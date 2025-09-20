## Unreleased

### Breaking Changes

- Change API for setting request environment.
  - Replace `Payrix.test_mode = true` with `Payrix.environment = :sandbox`.
  - Replace `Payrix.test_mode = false` with `Payrix.environment = :production`.
- Change default request environment to `:sandbox`.
  - Set `Payrix.environment = :production` to keep existing behaviour.

### Removals

- Remove `Payrix.test_mode` configuration.
- Remove Ruby version 2.7 from supported list.

### Additions

- Support per-request `:environment` configuration for all CRUD operations.

## 1.0.0 (2023-11-27)

- Interact with the Payrix API!
- Support CRUD operations for most API resources.
- Support Ruby versions 3.0, 3.1, 3.2.
- Deprecate Ruby version 2.7 (it will be removed in the next major release).
