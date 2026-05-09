import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/kyc_model.dart';

abstract class KycRepository {
  Future<void> saveBasicInfo(String uid, BasicInfoModel model);
  Future<void> saveSelfie(String uid, String selfieUrl);
  Future<void> saveLocation(
    String uid, {
    required double lat,
    required double lng,
    required String country,
    required bool isVpnSuspected,
  });
  Future<void> saveProofOfAddress(
    String uid,
    String documentUrl,
    String docType,
  );
  Future<void> submitTier2(String uid, Tier2Model model);

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

  @override
  Future<void> saveSelfie(String uid, String selfieUrl) async {
    try {
      await _doc(uid).set({
        'tier2.selfieUrl': selfieUrl,
        'tier2.selfieUploadedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save selfie: $e');
    }
  }

  @override
  Future<void> saveLocation(
    String uid, {
    required double lat,
    required double lng,
    required String country,
    required bool isVpnSuspected,
  }) async {
    try {
      await _doc(uid).set({
        'tier2.location.latitude': lat,
        'tier2.location.longitude': lng,
        'tier2.location.detectedCountry': country,
        'tier2.location.isVpnSuspected': isVpnSuspected,
        'tier2.location.capturedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save location: $e');
    }
  }

  @override
  Future<void> saveProofOfAddress(
    String uid,
    String documentUrl,
    String docType,
  ) async {
    try {
      await _doc(uid).set({
        'tier2.proofOfAddress.documentUrl': documentUrl,
        'tier2.proofOfAddress.documentType': docType,
        'tier2.proofOfAddress.uploadedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save proof of address: $e');
    }
  }

  @override
  Future<void> submitTier2(String uid, Tier2Model model) async {
    try {
      await _doc(uid).set({
        'tier2.status': 'pending_review',
        'tier2.submittedAt': FieldValue.serverTimestamp(),

        'status': 'tier2_pending_review',
        'tier2SubmittedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to submit Tier 2: $e');
    }
  }
}
