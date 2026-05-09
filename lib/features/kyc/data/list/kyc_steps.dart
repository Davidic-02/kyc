// lib/features/kyc/data/list/kyc_steps.dart

enum KycSteps {
  intro,

  basicInfo,
  twoFactorSetup,
  twoFactorVerify,
  documents,
  completed, // Tier 1 done

  selfieCapture, // Step 4 — live selfie
  locationVerify, // Step 5 — GPS + country
  proofOfAddress, // Step 6 — utility bill / bank statement
  tier2Completed, // Tier 2 done
}
