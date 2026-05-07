# Development Workflow

## 1. Branching

Use short-lived branches from `main`:

- `feature/<feature-name>`
- `fix/<bug-name>`
- `chore/<task-name>`

## 2. Local Quality Checks

Run before pushing:

```bash
flutter pub get
flutter analyze
flutter test
```

## 3. Pull Requests

Before opening a PR:

- Rebase or merge latest `main`
- Keep PRs focused and small
- Update docs if architecture or structure changes
- Add tests for behavior changes where applicable

PR checklist is enforced through `.github/pull_request_template.md`.

## 4. Commit Message Style

Recommended prefixes:

- `feat:` new functionality
- `fix:` bug fixes
- `refactor:` behavior-preserving structural changes
- `docs:` documentation updates
- `test:` test updates
- `chore:` tooling/maintenance

Example:

```text
feat(auth): add OTP verification flow
```

## 5. Definition of Done

A task is done when:

- Code is reviewed
- Static analysis passes
- Tests pass
- Documentation is updated if required
- No unrelated files are changed
