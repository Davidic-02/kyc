// lib/features/auth/data/repositories/magic_link_repository_impl.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kyc/features/auth_1/domain/magic_link.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MagicLinkRepositoryImpl implements MagicLinkRepository {
  final FirebaseAuth _auth;

  MagicLinkRepositoryImpl(this._auth);

  static const _emailKey = 'magic_email';

  @override
  Future<void> sendLink(String email) async {
    final prefs = await SharedPreferences.getInstance();

    final actionCodeSettings = ActionCodeSettings(
      url: 'https://your-project-id.web.app/finishSignIn',
      handleCodeInApp: true,
      androidPackageName: 'com.yourcompany.kyc',
      androidInstallApp: true,
      iOSBundleId: 'com.yourcompany.kyc',
    );

    try {
      await _auth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      );

      // ✅ Save email locally for later verification
      await prefs.setString(_emailKey, email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw Exception('Invalid email address');
      } else if (e.code == 'too-many-requests') {
        throw Exception('Too many requests. Try again later.');
      }
      throw Exception('Failed to send link: ${e.message}');
    }
  }

  @override
  Future<void> signInWithLink(String email, String link) async {
    try {
      await _auth.signInWithEmailLink(email: email, emailLink: link);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-action-code') {
        throw Exception('Link expired or invalid. Request a new one.');
      }
      throw Exception('Sign in failed: ${e.message}');
    }
  }

  @override
  Future<String?> getCurrentUserId() async {
    return _auth.currentUser?.uid;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
