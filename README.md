# KYC

Professional Flutter codebase scaffolded with a feature-first clean architecture.

## Overview

This repository is prepared for production-style development with:

- Feature-first folder organization
- Core/shared layer separation
- Repository documentation standards
- Collaboration templates for issues and pull requests

The goal is to start implementation with clear boundaries and consistent conventions.

## Tech Stack

- Flutter
- Dart
- Flutter lints (`flutter_lints`)

## Architecture

The project follows a feature-first clean architecture layout:

- `app/`: app bootstrap and cross-cutting app-level setup
- `core/`: reusable infrastructure (networking, storage, theme, constants, utilities)
- `features/`: business features split into `data`, `domain`, and `presentation`
- `shared/`: shared models, enums, and extensions used by multiple features

Detailed docs:

- [Architecture](docs/architecture.md)
- [Project Structure](docs/project_structure.md)
- [Development Workflow](docs/development_workflow.md)

## Project Structure

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

## Getting Started

### Prerequisites

- Flutter SDK installed and configured
- Xcode (for iOS/macOS builds)
- Android Studio and Android SDK (for Android builds)

### Setup

```bash
flutter pub get
flutter analyze
flutter test
```

### Run

```bash
flutter run
```

## Quality Standards

- Keep features isolated inside `lib/features/<feature_name>`
- Keep reusable primitives in `lib/core` and `lib/shared`
- Prefer small, focused files and explicit naming
- Run analysis/tests before opening a pull request

## Collaboration

- [Contributing Guide](CONTRIBUTING.md)
- [Code of Conduct](CODE_OF_CONDUCT.md)
- [Security Policy](SECURITY.md)
- [Changelog](CHANGELOG.md)

## License

This repository is currently private/internal unless a license file is added.
