import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/kyc_model.dart';

abstract class KycRepository {
  // =========================
  // TIER 1
  // =========================

  Future<void> saveBasicInfo(String uid, BasicInfoModel model);

  Future<void> saveTwoFactorAuth(String uid, TwoFactorAuthModel model);

  Future<void> saveDocumentVerification(
    String uid,
    DocumentVerificationModel model,
  );

  Future<void> submitKyc(String uid);

  // =========================
  // TIER 2
  // =========================

  Future<void> saveSelfie(String uid, String selfieUrl);

  Future<void> saveLocation(
    String uid,
    double lat,
    double lng,
    String country,
    bool isVpnSuspected,
  );

  Future<void> saveProofOfAddress(String uid, String documentUrl);

  Future<void> submitTier2(String uid);

  // =========================
  // GENERAL
  // =========================

  Future<KycProgressModel?> getKycProgress(String uid);
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
  // DOCUMENT VERIFICATION
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
      throw Exception('Failed to save document verification: $e');
    }
  }

  // =========================
  // SELFIE / LIVENESS
  // =========================

  @override
  Future<void> saveSelfie(String uid, String selfieUrl) async {
    try {
      await _doc(uid).set({
        'tier2': {'selfieUrl': selfieUrl},
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save selfie: $e');
    }
  }

  // =========================
  // LOCATION
  // =========================

  @override
  Future<void> saveLocation(
    String uid,
    double lat,
    double lng,
    String country,
    bool isVpnSuspected,
  ) async {
    try {
      await _doc(uid).set({
        'tier2': {
          'location': {
            'latitude': lat,
            'longitude': lng,
            'country': country,
            'isVpnSuspected': isVpnSuspected,
          },
        },
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save location: $e');
    }
  }

  // =========================
  // PROOF OF ADDRESS
  // =========================

  @override
  Future<void> saveProofOfAddress(String uid, String documentUrl) async {
    try {
      await _doc(uid).set({
        'tier2': {
          'proofOfAddress': {'documentUrl': documentUrl},
        },
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save proof of address: $e');
    }
  }

  // =========================
  // GET PROGRESS
  // =========================

  @override
  Future<KycProgressModel?> getKycProgress(String uid) async {
    try {
      final doc = await _doc(uid).get();

      if (!doc.exists || doc.data() == null) {
        return null;
      }

      return KycProgressModel.fromJson(doc.data()!);
    } catch (e) {
      throw Exception('Failed to fetch KYC progress: $e');
    }
  }

  // =========================
  // TIER 1 SUBMIT
  // =========================

  @override
  Future<void> submitKyc(String uid) async {
    try {
      await _doc(uid).set({
        'status': 'tier1_submitted',
        'tier1CompletedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to submit Tier 1 KYC: $e');
    }
  }

  // =========================
  // TIER 2 SUBMIT
  // =========================

  @override
  Future<void> submitTier2(String uid) async {
    try {
      await _doc(uid).set({
        'status': 'tier2_submitted',
        'tier2CompletedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to submit Tier 2 KYC: $e');
    }
  }
}
