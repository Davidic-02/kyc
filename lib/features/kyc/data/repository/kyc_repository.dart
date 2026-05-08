import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/kyc_model.dart';

abstract class KycRepository {
  Future<void> saveBasicInfo(String uid, BasicInfoModel model);

  Future<void> saveTwoFactorAuth(String uid, TwoFactorAuthModel model);

  Future<void> saveDocumentVerification(
    String uid,
    DocumentVerificationModel model,
  );

  Future<KycProgressModel?> getKycProgress(String uid);

  Future<void> submitKyc(String uid);
}

class KycRepositoryImpl implements KycRepository {
  final FirebaseFirestore _firestore;

  KycRepositoryImpl(this._firestore);

  // =========================
  // Helper
  // =========================
  DocumentReference<Map<String, dynamic>> _doc(String uid) {
    return _firestore.collection('kyc').doc(uid);
  }

  // =========================
  // BASIC INFO
  // =========================
  @override
  Future<void> saveBasicInfo(String uid, BasicInfoModel model) async {
    try {
      await _doc(
        uid,
      ).set({'basicInfo': model.toJson()}, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save basic info: $e');
    }
  }

  // =========================
  // 2FA
  // =========================
  @override
  Future<void> saveTwoFactorAuth(String uid, TwoFactorAuthModel model) async {
    try {
      await _doc(
        uid,
      ).set({'twoFactorAuth': model.toJson()}, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save 2FA: $e');
    }
  }

  // =========================
  // DOCUMENTS
  // =========================
  @override
  Future<void> saveDocumentVerification(
    String uid,
    DocumentVerificationModel model,
  ) async {
    try {
      await _doc(
        uid,
      ).set({'documentVerification': model.toJson()}, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save document: $e');
    }
  }

  // =========================
  // GET PROGRESS
  // =========================
  @override
  Future<KycProgressModel?> getKycProgress(String uid) async {
    try {
      final doc = await _doc(uid).get();

      if (!doc.exists || doc.data() == null) return null;

      return KycProgressModel.fromJson(doc.data()!);
    } catch (e) {
      throw Exception('Failed to fetch KYC progress: $e');
    }
  }

  // =========================
  // SUBMIT
  // =========================
  @override
  Future<void> submitKyc(String uid) async {
    try {
      await _doc(uid).set({
        'status': 'submitted',
        'completedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to submit KYC: $e');
    }
  }
}
