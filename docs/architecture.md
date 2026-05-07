# Architecture

This project uses a feature-first clean architecture structure for maintainability and team scalability.

## Layers

### App Layer (`lib/app`)

Contains app bootstrap and global setup:

- `app.dart`: Root widget and MaterialApp setup
- `app_router.dart`: Route generation and navigation mapping
- `app_bloc_observer.dart`: Bloc observer wiring (if using Bloc)
- `di.dart`: Dependency registration and service locator setup

### Core Layer (`lib/core`)

Reusable technical foundations shared across features:

- `constants`: static app-wide values
- `network`: HTTP clients, endpoints, and interceptors
- `storage`: local persistence abstractions
- `utils`: pure helper and formatting utilities
- `theme`: light/dark theme definitions
- `router`: route names and routing helpers
- `widgets`: reusable UI components

### Feature Layer (`lib/features`)

Business modules isolated by feature.

Typical feature structure:

- `data`: data sources, DTOs, repositories (implementation)
- `domain`: entities, use cases, repository contracts
- `presentation`: UI pages/widgets and state management

Current features:

- `auth`
- `kyc`
- `dashboard`
- `wallet`

### Shared Layer (`lib/shared`)

Cross-feature artifacts that are not infrastructure-specific:

- `models`
- `enums`
- `extensions`

## Dependency Direction

Keep dependencies flowing inward:

- `presentation` depends on `domain`
- `data` depends on `domain`
- `domain` should not depend on `data` or `presentation`
- `core` and `shared` can be used by features where appropriate

## Conventions

- Use singular, descriptive file names where practical.
- Keep one primary class per file.
- Prefer explicit imports and avoid circular dependencies.
- Keep feature logic inside its feature folder unless truly shared.
