import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/phone_auth_model.dart';

abstract class PhoneAuthRepository {
  Future<String> sendOtp(String phoneNumber);
  Future<bool> verifyOtp(String verificationId, String otp);
  Future<PhoneAuthModel?> getCurrentPhoneAuth();
  Future<String> resendOtp(String phoneNumber);
}

class PhoneAuthRepositoryImpl implements PhoneAuthRepository {
  final FirebaseAuth _auth;
  PhoneAuthRepositoryImpl(this._auth);

  @override
  Future<String> sendOtp(String phoneNumber) async {
    // Completer lets us properly await the async Firebase callback.

    // Without it, the future resolves before codeSent fires and

    // verificationId is always null.

    final completer = Completer<String>();

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),

      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },

      verificationFailed: (FirebaseAuthException e) {
        if (!completer.isCompleted) {
          completer.completeError(e.message ?? 'Phone verification failed');
        }
      },

      codeSent: (String verificationId, int? resendToken) {
        if (!completer.isCompleted) {
          completer.complete(verificationId);
        }
      },

      codeAutoRetrievalTimeout: (String verificationId) {
        if (!completer.isCompleted) {
          completer.complete(verificationId);
        }
      },
    );

    return completer.future; // now actually waits for the callback
  }

  @override
  Future<bool> verifyOtp(String verificationId, String otp) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    final result = await _auth.signInWithCredential(credential);
    return result.user != null;
  }

  @override
  Future<PhoneAuthModel?> getCurrentPhoneAuth() async {
    final user = _auth.currentUser;
    if (user == null) return null;

    return PhoneAuthModel(
      phoneNumber: user.phoneNumber ?? '',
      verificationId: '',
      isVerified: user.phoneNumber != null, // phoneNumberVerified doesn't exist
    );
  }

  @override
  Future<String> resendOtp(String phoneNumber) => sendOtp(phoneNumber);
}
