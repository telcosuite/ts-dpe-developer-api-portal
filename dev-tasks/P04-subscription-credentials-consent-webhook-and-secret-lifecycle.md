# Developer And API Portal P04 - Subscription, Credentials, Consent, Webhook, And Secret Lifecycle Development Tasks

Suite: Digital, Partner, And Ecosystem

App: Developer And API Portal

App slug: `developer-api-portal`

Implementation repository: `ts-dpe-developer-api-portal`

Phase: P04 - Subscription, Credentials, Consent, Webhook, And Secret Lifecycle

Phase file: `P04-subscription-credentials-consent-webhook-and-secret-lifecycle.md`

Phase rationale: Build the Credential Consent Webhook And Secret Lifecycle capability cluster for Developer And API Portal, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work.

Phase exit gate: Developer And API Portal can execute the Credential Consent Webhook And Secret Lifecycle workflows through UI, API, `developer_api_portal` persistence, outbox events, audit evidence, and release tests.

Out of scope for this phase: Runtime bootstrap is in P01; unrelated feature clusters and post-launch operations remain in their own phases.

Source tracker: [development-task-tracker.md](development-task-tracker.md)

Repository strategy: [TelcoSuite Repository Strategy](../../../../repository-strategy.md)

## Phase Coverage

- [Credential Consent Webhook And Secret Lifecycle](../features/credential-consent-webhook-and-secret-lifecycle.md)

## Phase Tasks

### DT-05-developer-api-portal-P04-T001: Build Credential Consent Webhook And Secret Lifecycle API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P04 - Subscription, Credentials, Consent, Webhook, And Secret Lifecycle |
| Priority | P0 |
| Source evidence | [Credential Consent Webhook And Secret Lifecycle](../features/credential-consent-webhook-and-secret-lifecycle.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../developer-api-portal.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Credential Consent Webhook And Secret Lifecycle |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/digitalpartnerecosystem/developerapiportal/CredentialConsentWebhookAndSecretLifecycleController.java`, `developer_api_portal.credential_consent_webhook_and_secret_lifecycle`, `contracts/events/CredentialConsentWebhookAndSecretLifecycleStateChangedEvent.json`, and `/api/05-digital-partner-ecosystem/developer-api-portal/v1/credential-consent-webhook-and-secret-lifecycle` |
| Dependencies | DT-05-developer-api-portal-P01-T013 |
| Outputs | `CredentialConsentWebhookAndSecretLifecycleController`, `CredentialConsentWebhookAndSecretLifecycleService`, `developer_api_portal.credential_consent_webhook_and_secret_lifecycle` migration, `CredentialConsentWebhookAndSecretLifecycleStateChangedEvent` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/05-digital-partner-ecosystem/developer-api-portal/v1/credential-consent-webhook-and-secret-lifecycle` using TMF628, TMF644, TMF657, TMF668, TMF672, TMF681, TMF688, TMF704, TMF705, TMF706, TMF707, TMF708, TMF710, TMF720, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Credential Consent Webhook And Secret Lifecycle` state in `developer_api_portal.credential_consent_webhook_and_secret_lifecycle` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `CredentialConsentWebhookAndSecretLifecycleStateChangedEvent` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: 1. Issue credential handoff, 2. Rotate secret, 3. Approve consent scope, 4. Configure webhook endpoint.
- Carry source details into code and tests for personas authorized operator and objects credential consent webhook and secret lifecycle; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/05-digital-partner-ecosystem/developer-api-portal/v1/credential-consent-webhook-and-secret-lifecycle`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `developer_api_portal.credential_consent_webhook_and_secret_lifecycle.id`, and appends `CredentialConsentWebhookAndSecretLifecycleStateChangedEvent` to `developer_api_portal.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/05-digital-partner-ecosystem/developer-api-portal/v1/credential-consent-webhook-and-secret-lifecycle/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Credential Consent Webhook And Secret Lifecycle` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `developer_api_portal.credential_consent_webhook_and_secret_lifecycle` is required.

#### Definition Of Done

- `CredentialConsentWebhookAndSecretLifecycleController`, service, repository, DTOs, validation, error model, and migration for `developer_api_portal.credential_consent_webhook_and_secret_lifecycle` are committed under `ts-dpe-developer-api-portal`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/05-digital-partner-ecosystem/developer-api-portal/v1/credential-consent-webhook-and-secret-lifecycle`, `developer_api_portal.credential_consent_webhook_and_secret_lifecycle`, and `CredentialConsentWebhookAndSecretLifecycleStateChangedEvent`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/05-digital-partner-ecosystem/developer-api-portal/v1/credential-consent-webhook-and-secret-lifecycle` return `403` and write a denial audit row instead of exposing `Credential Consent Webhook And Secret Lifecycle` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `developer_api_portal.credential_consent_webhook_and_secret_lifecycle` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `CredentialConsentWebhookAndSecretLifecycleStateChangedEvent` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Credential Consent Webhook And Secret Lifecycle` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `developer_api_portal.credential_consent_webhook_and_secret_lifecycle` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `CredentialConsentWebhookAndSecretLifecycleService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/05-digital-partner-ecosystem/developer-api-portal/v1/credential-consent-webhook-and-secret-lifecycle` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `developer_api_portal.credential_consent_webhook_and_secret_lifecycle` columns and indexes; event replay tests validate `contracts/events/CredentialConsentWebhookAndSecretLifecycleStateChangedEvent.json` and `developer_api_portal.event_outbox` ordering.

### DT-05-developer-api-portal-P04-T002: Build Credential Consent Webhook And Secret Lifecycle workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P04 - Subscription, Credentials, Consent, Webhook, And Secret Lifecycle |
| Priority | P1 |
| Source evidence | [Credential Consent Webhook And Secret Lifecycle](../features/credential-consent-webhook-and-secret-lifecycle.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../developer-api-portal.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Credential Consent Webhook And Secret Lifecycle |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/credential-consent-webhook-and-secret-lifecycle/`, `tests/e2e/credential-consent-webhook-and-secret-lifecycle.spec.ts`, Grafana panel `credential-consent-webhook-and-secret-lifecycle`, and `docs/operations-runbook.md#credential-consent-webhook-and-secret-lifecycle` |
| Dependencies | DT-05-developer-api-portal-P04-T001 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/credential-consent-webhook-and-secret-lifecycle/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas authorized operator.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows 1. Issue credential handoff, 2. Rotate secret, 3. Approve consent scope, 4. Configure webhook endpoint, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/developer-api-portal/credential-consent-webhook-and-secret-lifecycle`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Credential Consent Webhook And Secret Lifecycle` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `credential-consent-webhook-and-secret-lifecycle` refreshes, then it shows the metric and links to `docs/operations-runbook.md#credential-consent-webhook-and-secret-lifecycle`.

#### Definition Of Done

- `frontend/src/app/pages/credential-consent-webhook-and-secret-lifecycle/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/credential-consent-webhook-and-secret-lifecycle.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Credential Consent Webhook And Secret Lifecycle` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Credential Consent Webhook And Secret Lifecycle` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/credential-consent-webhook-and-secret-lifecycle.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-05-developer-api-portal-P04-T003: Prove Subscription, Credentials, Consent, Webhook, And Secret Lifecycle release gate, replay, and handoff evidence

| Field | Value |
| --- | --- |
| Phase | P04 - Subscription, Credentials, Consent, Webhook, And Secret Lifecycle |
| Priority | P1 |
| Source evidence | [Credential Consent Webhook And Secret Lifecycle](../features/credential-consent-webhook-and-secret-lifecycle.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../developer-api-portal.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Subscription, Credentials, Consent, Webhook, And Secret Lifecycle |
| Build area | Test/Ops/Release/Event |
| Target artifact | `tests/release/subscription-credentials-consent-webhook-and-secret-lifecycle.spec.ts`, `docs/release-notes/subscription-credentials-consent-webhook-and-secret-lifecycle.md`, Grafana dashboard `subscription-credentials-consent-webhook-and-secret-lifecycle`, and replay fixtures |
| Dependencies | DT-05-developer-api-portal-P04-T002 |
| Outputs | Release-gate test, replay/reconciliation evidence, accessibility/security/performance reports, dashboard/runbook links, support handoff notes |
| Missing evidence | No |

#### Implementation Notes

- Create a release-gate checklist for `subscription-credentials-consent-webhook-and-secret-lifecycle` covering Credential Consent Webhook And Secret Lifecycle, with happy path, assisted path, negative path, edge cases, event replay, data reconciliation, security, accessibility, performance, and support evidence.
- Record producer and consumer acknowledgements for phase events, reconcile `developer_api_portal.event_outbox`, and link replay fixtures and correlation IDs.
- Update `docs/operations-runbook.md`, `docs/release-notes/subscription-credentials-consent-webhook-and-secret-lifecycle.md`, and `development-task-tracker.md` with release evidence and unresolved blockers.

#### Acceptance Criteria

1. Given all tasks in `P04-subscription-credentials-consent-webhook-and-secret-lifecycle.md` are complete, when `tests/release/subscription-credentials-consent-webhook-and-secret-lifecycle.spec.ts` runs, then it returns exit code `0` and links evidence for UI, API, data, event, security, ops, and test gates.
2. Given a consumer rejects an event from `subscription-credentials-consent-webhook-and-secret-lifecycle`, when replay is triggered, then the replay fixture preserves `$.correlationId`, `$.eventId`, and consumer acknowledgement state.
3. Given release notes are generated, when support reviews `docs/release-notes/subscription-credentials-consent-webhook-and-secret-lifecycle.md`, then open blockers, rollback steps, runbook links, and ownership contacts are present.

#### Definition Of Done

- `tests/release/subscription-credentials-consent-webhook-and-secret-lifecycle.spec.ts`, replay fixtures, dashboard/runbook links, and release notes are committed.
- Accessibility, security, contract, migration, event replay, performance, and operational-readiness evidence is linked from the tracker.
- Open blockers have owner, due date, target increment, and rollback or removal criteria.

#### Negative Scenarios

- Do not mark the phase Done if event replay, reconciliation, accessibility, security, or downstream acknowledgement evidence is missing.
- Do not release `subscription-credentials-consent-webhook-and-secret-lifecycle` with unresolved cross-app writes, direct schema coupling, or stale source authority assumptions.
- Do not suppress failed release gates; record failures with owner, due date, and target increment.

#### Edge Cases

- Coordinated release gates may require downstream app windows; record scheduling, owner, and fallback route in release notes.
- Historical backfill, replay, bulk update, or migration repair runs must include preview, partial failure report, and rollback evidence.
- High-volume launch periods require dashboard thresholds, alert owners, queue back-pressure, and support escalation paths.

#### Test Expectations

- `tests/release/subscription-credentials-consent-webhook-and-secret-lifecycle.spec.ts`, `mvn test`, OpenAPI/event replay tests, Flyway checks, Playwright/Cypress E2E, accessibility, security, and k6/performance gates pass.
- `docker compose config`, clean-checkout smoke, `helm lint`, Kubernetes dry-run, dashboard JSON validation, and runbook link checks pass.
- Tracker evidence links command output, PRs, screenshots, replay payloads, dashboards, release notes, and support handoff notes.
