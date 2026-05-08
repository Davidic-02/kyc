// lib/features/auth/presentation/bloc/magic_link_bloc/magic_link_state.dart
part of 'magic_link_bloc.dart';

enum MagicLinkStatus { initial, loading, success, failure }

@freezed
abstract class MagicLinkState with _$MagicLinkState {
  const MagicLinkState._();

  const factory MagicLinkState({
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(MagicLinkStatus.initial) MagicLinkStatus sendStatus,
    @Default(MagicLinkStatus.initial) MagicLinkStatus verifyStatus,
    @Default('') String errorMessage,
    @Default(false) bool linkSent,
    @Default(false) bool isAuthenticated,
    String? userId,
  }) = _MagicLinkState;

  bool get isEmailValid => email.isValid;
}

class EmailFormz extends FormzInput<String, ValidationError> {
  const EmailFormz.pure([super.value = '']) : super.pure();
  const EmailFormz.dirty([super.value = '']) : super.dirty();

  @override
  ValidationError? validator(String? value) {
    if (value == null || value.isEmpty) return ValidationError.empty;

    if (!EmailValidator.validate(value.trim())) {
      return ValidationError.invalid;
    }

    return null;
  }
}
