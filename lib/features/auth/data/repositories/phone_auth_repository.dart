import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/phone_auth_model.dart';

abstract class PhoneAuthRepository {
  Future<String> sendOtp(String phoneNumber);
  Future<String> resendOtp(String phoneNumber); // String, not void
  Future<bool> verifyOtp(String verificationId, String otp);
  Future<PhoneAuthModel?> getCurrentPhoneAuth();
}

class PhoneAuthRepositoryImpl implements PhoneAuthRepository {
  final FirebaseAuth _auth;
  final bool isTestMode;

  PhoneAuthRepositoryImpl(this._auth, {this.isTestMode = false});

  static const _testNumbers = {
    '+16502530000': '123456',
    '+16502530001': '654321',
  };

  @override
  Future<String> sendOtp(String phoneNumber) async {
    // 🧪 TEST MODE
    if (isTestMode && _testNumbers.containsKey(phoneNumber)) {
      return 'test-verification-id-$phoneNumber';
    }

    final completer = Completer<String>();

    // await _auth.verifyPhoneNumber(
    //   phoneNumber: phoneNumber,
    //   timeout: const Duration(seconds: 60),

    //   verificationCompleted: (credential) async {
    //     await _auth.signInWithCredential(credential);
    //   },

    //   verificationFailed: (FirebaseAuthException e) {
    //     if (!completer.isCompleted) {
    //       completer.completeError(_mapFirebaseError(e));
    //     }
    //   },

    //   codeSent: (verificationId, resendToken) {
    //     if (!completer.isCompleted) {
    //       completer.complete(verificationId);
    //     }
    //   },

    //   codeAutoRetrievalTimeout: (verificationId) {
    //     if (!completer.isCompleted) {
    //       completer.complete(verificationId);
    //     }
    //   },
    // );

    return 'test-verification-id';
  }

  @override
  Future<String> resendOtp(String phoneNumber) {
    return sendOtp(phoneNumber);
  }

  @override
  Future<bool> verifyOtp(String verificationId, String otp) async {
    // 🧪 TEST MODE
    if (isTestMode && verificationId.startsWith('test-verification-id-')) {
      final phone = verificationId.replaceFirst('test-verification-id-', '');
      return _testNumbers[phone] == otp;
    }

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      final result = await _auth.signInWithCredential(credential);
      return result.user != null;
    } on FirebaseAuthException catch (e) {
      throw Exception(_mapFirebaseError(e));
    }
  }

  @override
  Future<PhoneAuthModel?> getCurrentPhoneAuth() async {
    final user = _auth.currentUser;

    if (user == null) return null;

    return PhoneAuthModel(
      phoneNumber: user.phoneNumber ?? '',
      verificationId: '',
      isVerified: user.phoneNumber != null,
    );
  }

  String _mapFirebaseError(FirebaseAuthException e) {
    return switch (e.code) {
      'invalid-phone-number' => 'Invalid phone number format',
      'too-many-requests' => 'Too many requests. Try again later.',
      'app-not-authorized' => 'App not authorized for phone auth',
      'invalid-verification-code' => 'Invalid OTP code',
      'session-expired' => 'OTP expired. Please request a new code.',
      _ => e.message ?? 'An error occurred',
    };
  }
}
