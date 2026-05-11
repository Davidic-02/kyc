// lib/features/auth/domain/repositories/magic_link_repository.dart
abstract class MagicLinkRepository {
  Future<void> sendLink(String email);
  Future<void> signInWithLink(String email, String link);
  Future<void> signOut();
  Future<String?> getCurrentUserId();
}
