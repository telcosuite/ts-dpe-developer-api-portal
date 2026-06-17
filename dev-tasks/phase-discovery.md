# Developer And API Portal Phase Discovery

## App Identity

| Field | Value |
| --- | --- |
| Suite | Digital, Partner, And Ecosystem |
| App | Developer And API Portal |
| App slug | `developer-api-portal` |
| Implementation repo | `ts-dpe-developer-api-portal` |
| Database | `ts_digital_partner_ecosystem` |
| Schema | `developer_api_portal` |
| APIs | TMF720, TMF672, TMF668, TMF704, TMF706, TMF705, TMF628, TMF657, TMF708, TMF707, TMF710, TMF635, TMF644, TMF681, TMF736, TMF737, TMF738 |
| Generated date | 2026-06-17 |
| Phase/task signature | 5 phases / P01=14, P02=5, P03=5, P04=3, P05=7 |

Phase count decision: 5 phases are evidence-derived from the current app-repo state, P01 runtime bootstrap requirements, and 8 build-ready feature files grouped by lifecycle, UI/API/data/event ownership, integration risk, and release gates.

Repeated skeleton audit: Evidence-derived and accepted for this app. Even when another app shares a phase/task-count signature, this discovery file cites this app's feature files, phase files, current repo state, and split/merge decisions; regenerate and split or merge phases if those inputs change.

## Input Evidence Inventory

| Evidence | Link | Status |
| --- | --- | --- |
| App implementation usage | [../implementation-file-usage.md](../implementation-file-usage.md) | Present |
| App README | [../README.md](../README.md) | Present |
| Modules and features | [../modules-and-features.md](../modules-and-features.md) | Present |
| Personas and journeys | [../personas-and-user-journeys.md](../personas-and-user-journeys.md) | Present |
| Suite data model | [../../data-model.md](../../data-model.md) | Present |
| Suite tech/UI guidance | [../../tech-and-ui-guidance.md](../../tech-and-ui-guidance.md) | Present |
| Suite implementation guide | [../../implementation-file-usage-guide.md](../../implementation-file-usage-guide.md) | Present |
| Repository strategy | [../../../../repository-strategy.md](../../../../repository-strategy.md) | Present |
| Feature: API Analytics And Health | [../features/api-analytics-and-health.md](../features/api-analytics-and-health.md) | Present |
| Feature: API Catalog | [../features/api-catalog.md](../features/api-catalog.md) | Present |
| Feature: API Governance And Conformance | [../features/api-governance-and-conformance.md](../features/api-governance-and-conformance.md) | Present |
| Feature: API Product Monetization Plans And Quotas | [../features/api-product-monetization-plans-and-quotas.md](../features/api-product-monetization-plans-and-quotas.md) | Present |
| Feature: Credential Consent Webhook And Secret Lifecycle | [../features/credential-consent-webhook-and-secret-lifecycle.md](../features/credential-consent-webhook-and-secret-lifecycle.md) | Present |
| Feature: Developer Onboarding And Subscription | [../features/developer-onboarding-and-subscription.md](../features/developer-onboarding-and-subscription.md) | Present |
| Feature: Production Certification Support And Version Migration | [../features/production-certification-support-and-version-migration.md](../features/production-certification-support-and-version-migration.md) | Present |
| Feature: Sandbox And Mock API | [../features/sandbox-and-mock-api.md](../features/sandbox-and-mock-api.md) | Present |

## App Repository Current State Inventory

| Marker | Value |
| --- | --- |
| Repo exists | Yes |
| Runnable frontend: | No |
| Runnable backend: | No |
| App-specific migrations: | Yes |
| OpenAPI contract | Yes |
| Event contracts | Yes |
| Deployment skeleton | Yes |
| CI workflow | No |
| Current implementation conclusion: | Keep the zero-to-one foundation explicit until runnable frontend, backend, migrations, contracts, CI, deployment, and proof-slice evidence are all present in `ts-dpe-developer-api-portal`. |

## Feature/Module Cluster Analysis

| Feature | Feature ID | Source detail carried into tasks | Implementing task IDs | Phase |
| --- | --- | --- | --- | --- |
| [API Analytics And Health](../features/api-analytics-and-health.md) | F-developer-api-portal-001 |  | DT-05-developer-api-portal-P05-T001, DT-05-developer-api-portal-P05-T002, DT-05-developer-api-portal-P05-T007 | P05 - API Analytics, Monetization, Governance, And Conformance |
| [API Catalog](../features/api-catalog.md) | F-developer-api-portal-001 |  | DT-05-developer-api-portal-P02-T001, DT-05-developer-api-portal-P02-T002, DT-05-developer-api-portal-P02-T005 | P02 - API Catalog Publication And Developer Onboarding |
| [API Governance And Conformance](../features/api-governance-and-conformance.md) | F-developer-api-portal-001 |  | DT-05-developer-api-portal-P05-T005, DT-05-developer-api-portal-P05-T006, DT-05-developer-api-portal-P05-T007 | P05 - API Analytics, Monetization, Governance, And Conformance |
| [API Product Monetization Plans And Quotas](../features/api-product-monetization-plans-and-quotas.md) | F-developer-api-portal-001 |  | DT-05-developer-api-portal-P05-T003, DT-05-developer-api-portal-P05-T004, DT-05-developer-api-portal-P05-T007 | P05 - API Analytics, Monetization, Governance, And Conformance |
| [Credential Consent Webhook And Secret Lifecycle](../features/credential-consent-webhook-and-secret-lifecycle.md) | F-developer-api-portal-001 |  | DT-05-developer-api-portal-P04-T001, DT-05-developer-api-portal-P04-T002, DT-05-developer-api-portal-P04-T003 | P04 - Subscription, Credentials, Consent, Webhook, And Secret Lifecycle |
| [Developer Onboarding And Subscription](../features/developer-onboarding-and-subscription.md) | F-developer-api-portal-001 |  | DT-05-developer-api-portal-P02-T003, DT-05-developer-api-portal-P02-T004, DT-05-developer-api-portal-P02-T005 | P02 - API Catalog Publication And Developer Onboarding |
| [Production Certification Support And Version Migration](../features/production-certification-support-and-version-migration.md) | F-developer-api-portal-001 |  | DT-05-developer-api-portal-P03-T003, DT-05-developer-api-portal-P03-T004, DT-05-developer-api-portal-P03-T005 | P03 - Sandbox, Mock API, And Certification |
| [Sandbox And Mock API](../features/sandbox-and-mock-api.md) | F-developer-api-portal-001 |  | DT-05-developer-api-portal-P03-T001, DT-05-developer-api-portal-P03-T002, DT-05-developer-api-portal-P03-T005 | P03 - Sandbox, Mock API, And Certification |

## Phase Decision Matrix

| Phase file | Task count | Evidence basis | Exit gate |
| --- | --- | --- | --- |
| [P01-from-scratch-app-foundation-and-delivery-runtime.md](P01-from-scratch-app-foundation-and-delivery-runtime.md) | 14 | The planning pack and local repo inspection do not prove a complete runnable implementation for `ts-dpe-developer-api-portal`; this from-scratch foundation phase creates the app-root runtime, governance, contracts, data, CI, deployment, observability, and proof slice before feature delivery. | A clean checkout of `ts-dpe-developer-api-portal` can run Angular and Spring Boot, apply `developer_api_portal` migrations, validate contracts/events, run Docker Compose and Helm checks, and prove one UI/API/data/event slice. |
| [P02-api-catalog-publication-and-developer-onboarding.md](P02-api-catalog-publication-and-developer-onboarding.md) | 5 | Build the API Catalog, Developer Onboarding And Subscription capability cluster for Developer And API Portal, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work. | Developer And API Portal can execute the API Catalog, Developer Onboarding And Subscription workflows through UI, API, `developer_api_portal` persistence, outbox events, audit evidence, and release tests. |
| [P03-sandbox-mock-api-and-certification.md](P03-sandbox-mock-api-and-certification.md) | 5 | Build the Sandbox And Mock API, Production Certification Support And Version Migration capability cluster for Developer And API Portal, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work. | Developer And API Portal can execute the Sandbox And Mock API, Production Certification Support And Version Migration workflows through UI, API, `developer_api_portal` persistence, outbox events, audit evidence, and release tests. |
| [P04-subscription-credentials-consent-webhook-and-secret-lifecycle.md](P04-subscription-credentials-consent-webhook-and-secret-lifecycle.md) | 3 | Build the Credential Consent Webhook And Secret Lifecycle capability cluster for Developer And API Portal, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work. | Developer And API Portal can execute the Credential Consent Webhook And Secret Lifecycle workflows through UI, API, `developer_api_portal` persistence, outbox events, audit evidence, and release tests. |
| [P05-api-analytics-monetization-governance-and-conformance.md](P05-api-analytics-monetization-governance-and-conformance.md) | 7 | Build the API Analytics And Health, API Product Monetization Plans And Quotas, API Governance And Conformance capability cluster for Developer And API Portal, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work. | Developer And API Portal can execute the API Analytics And Health, API Product Monetization Plans And Quotas, API Governance And Conformance workflows through UI, API, `developer_api_portal` persistence, outbox events, audit evidence, and release tests. |

## Split/Merge Decisions

- P01 remains the app-runtime foundation because the local repo inspection does not prove a complete runnable implementation for `ts-dpe-developer-api-portal`.
- Feature phases are grouped from source `features/*.md` files by lifecycle ownership, UI workbench/API/data/event coupling, security/privacy controls, observability, and release-test needs.
- Every feature file appears in task `Source evidence`, the tracker coverage matrix, and this discovery artifact; tracker-only feature references are not accepted as coverage.
- Generic phase names from older task packs are retired by this refresh and replaced with feature-derived phase names.

## Validator and Regeneration Notes

- Run `python3 telcosuite-skills/skills/tmf-dev-task-planner/scripts/validate_dev_tasks.py --root ts-planning/planning/suite-details/05-digital-partner-ecosystem/developer-api-portal --strict` after refresh.
- Re-run the mirror driver after validation so `ts-dpe-developer-api-portal/dev-tasks/` remains byte-identical to the planning source.
- If a source feature changes, refresh this app pack and verify phase count, feature coverage, task detail quality, and mirror parity again.
