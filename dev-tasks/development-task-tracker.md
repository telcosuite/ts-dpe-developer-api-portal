# Developer API Portal Development Task Tracker

Suite: Digital, Partner, And Ecosystem

App: Developer API Portal

App slug: `developer-api-portal`

Implementation repository: `ts-dpe-developer-api-portal`

Physical database: `ts_digital_partner_ecosystem`

App schema: `developer_api_portal`

Primary APIs: TMF720, TMF672, TMF668, TMF704, TMF706, TMF705, TMF628, TMF657

Source implementation guide: [implementation-file-usage.md](../implementation-file-usage.md)

Repository strategy: [TelcoSuite Repository Strategy](../../../../repository-strategy.md)

Last updated: 2026-06-14

## App Build Context

- Default scaffold targets are defined in P01 for GitHub app repository `ts-dpe-developer-api-portal` and include app-root `frontend/`, `backend/`, `contracts/openapi/v1/openapi.yaml`, `contracts/events/`, `database/postgres/migrations/`, `database/postgres/seeds/`, `.github/workflows/`, `deploy/compose/`, `deploy/k8s/`, `deploy/helm/`, `docs/`, `OWNERS.md`, `CODEOWNERS`, local dev scripts, and copied `dev-tasks/`.
- Shared repository dependencies: consume versioned UI/design-system assets from `ts-shared-ui-design-system` and GitHub Actions workflow templates from `ts-shared-pipeline-templates`; app-specific UI, domain logic, migrations, and lifecycle decisions stay inside this app repo.
- Source planning is the app detail pack under `docs/planning/app-detail/` and the suite-level data model and tech/UI guidance under `docs/planning/suite/`.
- This app has no pre-existing runnable implementation repository; P01 bootstraps the GitHub app repo plus zero-to-one Angular, Spring Boot, PostgreSQL, API contract, security, event, CI, observability, Docker Compose, Kubernetes/Helm, and local-dev foundation before feature delivery begins.
- This tracker maps every source `F-...` capability slice to at least one implementation task.
- Build tasks cover product boundary, UI, API, data, events, workflow, security/privacy, observability, tests, launch, and operations evidence.
- App writes stay inside `developer_api_portal`; cross-app collaboration must use APIs, events, workflow tasks, governed projections, or data products.
- TMF review status: Complete (see `docs/planning/tmf-api-to-ddl-review.md` for the full V001/V00X baseline rationale); DDL baseline status: Complete; starter tables: see `database/postgres/source-migrations/V002__refine_developer_api_portal_tmf_core.sql`.

## Discovered Phase Summary

| Phase | Phase file | Rationale | Exit gate | Status | Notes |
| --- | --- | --- | --- | --- | --- |
| P01 - From Scratch App Foundation And Delivery Runtime | [P01-from-scratch-app-foundation-and-delivery-runtime.md](P01-from-scratch-app-foundation-and-delivery-runtime.md) | Bootstrap GitHub app repository `ts-dpe-developer-api-portal` and app-root runtime before feature implementation because planning has no runnable app implementation. | Clean checkout of `ts-dpe-developer-api-portal` can run the frontend/backend, migrate the app schema, validate Docker Compose and Kubernetes/Helm, run CI smoke checks, and prove the first UI/API/database/audit-event vertical slice. | Not Started | Updated to align with app-repo strategy. |
| P02 - Phase 2 Foundation | [P02-phase-2-foundation.md](P02-phase-2-foundation.md) | Build the first feature-area foundation specific to Developer API Portal before the next set of capability slices can be built. | First feature-area foundation in `developer_api_portal` is testable against the V001/V00X migrations and TMF-aligned APIs. | Not Started | Generated from source feature pack. |
| P03 - Phase 3 Expansion | [P03-phase-3-expansion.md](P03-phase-3-expansion.md) | Expand the first feature area and connect to the second feature area specific to Developer API Portal. | Second feature area is testable and emits or consumes the first feature area's events. | Not Started | Generated from source feature pack. |
| P04 - Phase 4 Cross Area | [P04-phase-4-cross-area.md](P04-phase-4-cross-area.md) | Wire cross-area handoffs, lifecycle transitions, and downstream events for Developer API Portal. | Cross-area handoffs and event publication are tested end to end. | Not Started | Generated from source feature pack. |
| P05 - Phase 5 Release Readiness | [P05-phase-5-release-readiness.md](P05-phase-5-release-readiness.md) | Complete release-gate evidence, observability, runbooks, and support handoff for Developer API Portal. | App release evidence covers privacy, audit, observability, accessibility, support, and post-launch monitoring. | Not Started | Generated from source feature pack. |

## From-Scratch Build Artifact Checklist

| Artifact area | Default target | Completion evidence |
| --- | --- | --- |
| GitHub app repository | `ts-dpe-developer-api-portal` | Repository exists with `README.md`, `OWNERS.md`, `CODEOWNERS`, branch protection, required checks, security scanning, and copied `dev-tasks/` from planning. |
| Angular shell | `frontend/` with app code under `frontend/src/app/` | Route registered, required screens reachable, shared UI package pinned, and loading/empty/error/no-permission states tested. |
| Spring Boot service | `backend/` | Health/readiness/app-info endpoints, package under `com.telcosuite.<suite>.<app>`, config profiles, security baseline, and service tests. |
| API contracts | `contracts/openapi/v1/openapi.yaml` | Command/query/admin/evidence contracts, TMF-style envelope decisions, generated clients, and contract tests. |
| Event contracts | `contracts/events/` | Versioned schemas, replay fixtures, acknowledgement/reconciliation examples, and event compatibility checks. |
| PostgreSQL | `database/postgres/migrations/` and `database/postgres/seeds/` | Clean app-repo migration run, app-owned tables for schema `developer_api_portal`, idempotency/audit/outbox, seed/demo data, and rollback/repair notes. |
| App docs | `docs/architecture.md`, `docs/api.md`, `docs/data-model.md`, `docs/operations-runbook.md`, `docs/adr/` | App boundary, planning source commit/link, API/event/data decisions, runbook, and architecture decisions captured. |
| Security | Backend security package and frontend guards | RBAC/ABAC, tenant/brand/market context, masking, denial audit tests, and GitHub security scan evidence. |
| Local dev | `.env.example`, `deploy/compose/docker-compose.yml`, local dev scripts | Clean-checkout startup, PostgreSQL migration, seeded demo data, and smoke-test evidence using Docker Compose. |
| CI/release | `.github/workflows/ci.yml`, `.github/workflows/release.yml`, `deploy/k8s/`, `deploy/helm/` | GitHub Actions from `ts-shared-pipeline-templates`, lint/unit/contract/migration/E2E/security/accessibility gates, Docker Compose validation, Kubernetes/Helm validation, release notes, rollback, and runbook evidence. |
| Shared dependencies | `ts-shared-ui-design-system` and `ts-shared-pipeline-templates` | Version pins, upgrade notes, compatibility evidence, and no app-specific domain logic placed in shared repos. |

## Feature-Slice Coverage Matrix

The following source features are tracked and will be implemented in dedicated dev tasks across P02-P05. Each `F-<feature>-NN` capability slice is generated from the corresponding `docs/planning/app-detail/features/<feature>.md` file.

| Feature | Source slice file | Slice count | Phase | Status |
| --- | --- | --- | --- | --- |
| [api-analytics-and-health](../planning/app-detail/features/api-analytics-and-health.md) | `features/api-analytics-and-health.md` | derived | P02-P05 | Not Started |
| [api-catalog](../planning/app-detail/features/api-catalog.md) | `features/api-catalog.md` | derived | P02-P05 | Not Started |
| [api-governance-and-conformance](../planning/app-detail/features/api-governance-and-conformance.md) | `features/api-governance-and-conformance.md` | derived | P02-P05 | Not Started |
| [api-product-monetization-plans-and-quotas](../planning/app-detail/features/api-product-monetization-plans-and-quotas.md) | `features/api-product-monetization-plans-and-quotas.md` | derived | P02-P05 | Not Started |
| [credential-consent-webhook-and-secret-lifecycle](../planning/app-detail/features/credential-consent-webhook-and-secret-lifecycle.md) | `features/credential-consent-webhook-and-secret-lifecycle.md` | derived | P02-P05 | Not Started |
| [developer-onboarding-and-subscription](../planning/app-detail/features/developer-onboarding-and-subscription.md) | `features/developer-onboarding-and-subscription.md` | derived | P02-P05 | Not Started |
| [production-certification-support-and-version-migration](../planning/app-detail/features/production-certification-support-and-version-migration.md) | `features/production-certification-support-and-version-migration.md` | derived | P02-P05 | Not Started |
| [sandbox-and-mock-api](../planning/app-detail/features/sandbox-and-mock-api.md) | `features/sandbox-and-mock-api.md` | derived | P02-P05 | Not Started |

Total tracked source features: 8. Total tracked capability slices: derived from the per-feature feature specs.

## Task Tracker

Each DT task is recorded in the matching phase file. The full task list with dependencies, source evidence, and acceptance coverage is generated from the source features in `docs/planning/app-detail/features/`. See the per-phase files for the detailed backlog.

- [P01 task list](P01-from-scratch-app-foundation-and-delivery-runtime.md)
- [P02 task list](P02-phase-2-foundation.md)
- [P03 task list](P03-phase-3-expansion.md)
- [P04 task list](P04-phase-4-cross-area.md)
- [P05 task list](P05-phase-5-release-readiness.md)
