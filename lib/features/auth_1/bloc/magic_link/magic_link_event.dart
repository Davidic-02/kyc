// lib/features/auth/presentation/bloc/magic_link_bloc/magic_link_event.dart
part of 'magic_link_bloc.dart';

@freezed
class MagicLinkEvent with _$MagicLinkEvent {
  const factory MagicLinkEvent.emailChanged(String email) = _EmailChanged;

  const factory MagicLinkEvent.sendLink() = _SendLink;

  const factory MagicLinkEvent.verifyLink(String link) = _VerifyLink;

  const factory MagicLinkEvent.checkAuth() = _CheckAuth;

  const factory MagicLinkEvent.signOut() = _SignOut;
}
