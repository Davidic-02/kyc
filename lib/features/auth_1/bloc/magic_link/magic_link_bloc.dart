import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kyc/core/utils/validators.dart';
import 'package:kyc/features/auth_1/domain/magic_link.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'magic_link_event.dart';
part 'magic_link_state.dart';
part 'magic_link_bloc.freezed.dart';

class MagicLinkBloc extends Bloc<MagicLinkEvent, MagicLinkState> {
  final MagicLinkRepository _repository;

  MagicLinkBloc(this._repository) : super(const MagicLinkState()) {
    on<_EmailChanged>(_onEmailChanged);
    on<_SendLink>(_sendLink);
    on<_VerifyLink>(_verifyLink);
    on<_CheckAuth>(_checkAuth);
    on<_SignOut>(_signOut);
  }

  void _onEmailChanged(_EmailChanged event, Emitter<MagicLinkState> emit) {
    final email = EmailFormz.dirty(event.email.trim());

    emit(state.copyWith(email: email, errorMessage: ''));
  }

  Future<void> _sendLink(_SendLink event, Emitter<MagicLinkState> emit) async {
    if (state.sendStatus == MagicLinkStatus.loading) return;
    if (!state.email.isValid) {
      emit(state.copyWith(errorMessage: 'Please enter a valid email'));
      return;
    }

    emit(state.copyWith(sendStatus: MagicLinkStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 2));

      emit(
        state.copyWith(
          sendStatus: MagicLinkStatus.success,
          linkSent: true,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          sendStatus: MagicLinkStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _verifyLink(
    _VerifyLink event,
    Emitter<MagicLinkState> emit,
  ) async {
    emit(state.copyWith(verifyStatus: MagicLinkStatus.loading));

    try {
      // ✅ Get email from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('magic_email');

      if (email == null) {
        throw Exception('Email not found. Request a new link.');
      }

      // ✅ Sign in with link
      await _repository.signInWithLink(email, event.link);

      // ✅ Get user ID
      final userId = await _repository.getCurrentUserId();

      emit(
        state.copyWith(
          verifyStatus: MagicLinkStatus.success,
          isAuthenticated: true,
          userId: userId,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          verifyStatus: MagicLinkStatus.failure,
          errorMessage: e.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  Future<void> _checkAuth(
    _CheckAuth event,
    Emitter<MagicLinkState> emit,
  ) async {
    try {
      final userId = await _repository.getCurrentUserId();
      if (userId != null) {
        emit(state.copyWith(isAuthenticated: true, userId: userId));
      }
    } catch (_) {
      // Not authenticated
    }
  }

  Future<void> _signOut(_SignOut event, Emitter<MagicLinkState> emit) async {
    try {
      await _repository.signOut();
      emit(
        state.copyWith(
          isAuthenticated: false,
          userId: null,
          email: EmailFormz.pure(),
          linkSent: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
