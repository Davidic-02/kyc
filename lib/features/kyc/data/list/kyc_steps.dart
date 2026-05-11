// lib/features/kyc/data/list/kyc_steps.dart

enum KycSteps {
  intro,

  // ── Tier 1 ──────────────────────────
  basicInfo,
  twoFactorSetup,
  twoFactorVerify,
  documents,
  completed, // Tier 1 submitted → pending review screen
  // ── Tier 2 ──────────────────────────
  tier2Intro, // Explanation screen before committing to Tier 2
  selfieCapture, // Step 4 — live selfie
  locationVerify, // Step 5 — GPS + country
  proofOfAddress, // Step 6 — utility bill / bank statement
  tier2Completed, // Tier 2 submitted → pending review screen
}
