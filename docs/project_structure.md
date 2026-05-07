# Project Structure

This document describes the expected repository structure.

## Root

```text
.
├── android/
├── ios/
├── lib/
├── linux/
├── macos/
├── test/
├── web/
├── windows/
├── analysis_options.yaml
├── pubspec.yaml
└── README.md
```

## Source (`lib`)

```text
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── app_router.dart
│   ├── app_bloc_observer.dart
│   └── di.dart
├── core/
│   ├── constants/
│   ├── network/
│   ├── storage/
│   ├── utils/
│   ├── theme/
│   ├── router/
│   └── widgets/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── kyc/
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   └── services/
│   ├── dashboard/
│   │   └── presentation/
│   └── wallet/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── shared/
    ├── models/
    ├── enums/
    └── extensions/
```

## Naming Rules

- Folders: `snake_case`
- Files: `snake_case.dart`
- Types (classes/enums): `PascalCase`
- Variables/functions: `camelCase`
- Constants: `camelCase` for Dart constants unless team conventions require otherwise

## Where to Put New Code

- New user-facing module: `lib/features/<feature_name>/...`
- App-wide utility with no feature ownership: `lib/core/utils`
- App-wide UI atom/molecule: `lib/core/widgets`
- Shared domain model used by multiple features: `lib/shared/models`
