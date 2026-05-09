import 'package:firebase_auth/firebase_auth.dart';
import 'package:kyc/features/auth_1/domain/magic_link.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MagicLinkRepositoryImpl implements MagicLinkRepository {
  final FirebaseAuth _auth;

  MagicLinkRepositoryImpl(this._auth);

  static const _emailKey = 'magic_email';

  // ✅ Replace these with your ACTUAL values from Firebase console
  // Firebase console → Authentication → Sign-in method → Email link
  // and your actual app bundle IDs
  static const _continueUrl = 'https://kyc-flow-f595f.web.app/finishSignIn';
  static const _androidPackage =
      'com.yourcompany.kyc'; // must match AndroidManifest
  static const _iosBundleId = 'com.yourcompany.kyc'; // must match Info.plist

  @override
  @override
  Future<void> sendLink(String email) async {
    final prefs = await SharedPreferences.getInstance();

    final actionCodeSettings = ActionCodeSettings(
      url: 'https://kyc-flow-f595f.web.app/finishSignIn',

      handleCodeInApp: true,

      androidPackageName: 'com.example.kyc',
      androidInstallApp: true,
      androidMinimumVersion: '1',

      iOSBundleId: 'com.example.kyc',
    );

    try {
      await _auth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      );

      print("EMAIL SENT SUCCESSFULLY");

      await prefs.setString(_emailKey, email);
    } catch (e) {
      print("ERROR SENDING EMAIL: $e");
      rethrow; // important so Bloc can also catch it
    }
  }

  @override
  Future<void> signInWithLink(String email, String link) async {
    try {
      if (!_auth.isSignInWithEmailLink(link)) {
        throw Exception('Invalid sign-in link.');
      }
      await _auth.signInWithEmailLink(email: email, emailLink: link);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-action-code':
          throw Exception('Link expired or already used. Request a new one.');
        case 'user-disabled':
          throw Exception('This account has been disabled.');
        default:
          throw Exception('Sign in failed: ${e.code} — ${e.message}');
      }
    }
  }

  @override
  Future<String?> getCurrentUserId() async {
    return _auth.currentUser?.uid;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emailKey);
  }
}
