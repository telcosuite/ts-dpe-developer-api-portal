| Field | Value |
| --- | --- |
| Feature ID | F-developer-api-portal-001 |
| App | Developer Api Portal |
| App slug | `developer-api-portal` |
| Module | Developer And API Portal |
| Source slice | [modules-and-features.md](../modules-and-features.md) |
| Last refined | 2026-06-15 |
| Refiner verdict | Build-ready |

# API Analytics And Health Feature Specification


Reviewed: 2026-06-07

Suite: Digital, Partner, And Ecosystem

App: [Developer And API Portal App](../README.md)

Source module detail: [Modules And Features](../modules-and-features.md)

Feature area slug: `api-analytics-and-health`

## Feature Intent

Give API product managers, partner developers, platform operations users, governance leads, and security officers a portal view of API usage, latency, availability, errors, quota consumption, webhook delivery, consumer adoption, version migration, API degradation, contract violations, and monetization metering summaries. The Developer Portal owns developer-facing analytics summaries and health views while the API gateway, event fabric, monitoring platform, and data platform own raw logs, traces, metrics, and long-term analytical products.

The API Analytics And Health feature supports Suite 05 partner/API monetization, govern-to-comply, lead-to-order, usage-to-cash, and partner-to-settle journeys by turning developer intent into governed portal records, platform handoffs, developer-visible status, and audit evidence. The feature must not master raw gateway logs, runtime secrets, customer data, partner party records, usage records, settlement records, or source API implementation state.

## Personas Covered

- API product manager: Owns API product packaging, audience, lifecycle, support model, quota or commercial plan decision, and release readiness for developer-facing APIs.
- Partner developer: Discovers API products, accepts terms, registers applications, obtains credentials, tests webhooks or callbacks, and prepares production traffic.
- Internal developer: Consumes governed APIs, mocks, sandbox data, contract examples, and migration guidance without bypassing API lifecycle controls.
- API governance lead: Approves standards, compatibility, versioning, TMF conformance evidence, deprecation plans, and exception decisions for each API product.
- Platform operations user: Monitors gateway health, quota enforcement, webhook delivery, subscription failures, incident status, and developer-impact communications.
- Security officer: Reviews OAuth scopes, consent purpose, secret rotation, compromised credential response, tenant isolation, audit, and retention evidence for developer access.

## Persona-Specific Jobs And Outcomes

| Persona | Jobs-to-be-done | Outcome and decision evidence |
| --- | --- | --- |
| API product manager | Use the API analytics and health summary during review API usage, monitor health and incident impact, inspect quota consumption with role-aware portal access, environment awareness, and platform/source-system status. | The api product manager can complete or recover the API analytics and health summary lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |
| Partner developer | Use the API analytics and health summary during review API usage, monitor health and incident impact, inspect quota consumption with role-aware portal access, environment awareness, and platform/source-system status. | The partner developer can complete or recover the API analytics and health summary lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |
| Internal developer | Use the API analytics and health summary during review API usage, monitor health and incident impact, inspect quota consumption with role-aware portal access, environment awareness, and platform/source-system status. | The internal developer can complete or recover the API analytics and health summary lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |
| API governance lead | Use the API analytics and health summary during review API usage, monitor health and incident impact, inspect quota consumption with role-aware portal access, environment awareness, and platform/source-system status. | The api governance lead can complete or recover the API analytics and health summary lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |
| Platform operations user | Use the API analytics and health summary during review API usage, monitor health and incident impact, inspect quota consumption with role-aware portal access, environment awareness, and platform/source-system status. | The platform operations user can complete or recover the API analytics and health summary lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |
| Security officer | Use the API analytics and health summary during review API usage, monitor health and incident impact, inspect quota consumption with role-aware portal access, environment awareness, and platform/source-system status. | The security officer can complete or recover the API analytics and health summary lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |

## Core Workflows

| Workflow | Trigger | Validation and decision rights | Orchestration, exception, and completion evidence |
| --- | --- | --- | --- |
| 1. Review api usage | Developer, API product manager, governance lead, platform operations user, or lifecycle event starts the review API usage workflow. | The portal validates developer organization, application, subscription, API product lifecycle, environment, OAuth scope, consent purpose, partner status, quota plan, and tenant boundary for review API usage. | The portal stores the API analytics and health summary state, calls IAM/gateway/test/partner/usage owners as needed, queues fallout with correlation ID, notifies developers, and records completion evidence. |
| 2. Monitor health and incident impact | Developer, API product manager, governance lead, platform operations user, or lifecycle event starts the monitor health and incident impact workflow. | The portal validates developer organization, application, subscription, API product lifecycle, environment, OAuth scope, consent purpose, partner status, quota plan, and tenant boundary for monitor health and incident impact. | The portal stores the API analytics and health summary state, calls IAM/gateway/test/partner/usage owners as needed, queues fallout with correlation ID, notifies developers, and records completion evidence. |
| 3. Inspect quota consumption | Developer, API product manager, governance lead, platform operations user, or lifecycle event starts the inspect quota consumption workflow. | The portal validates developer organization, application, subscription, API product lifecycle, environment, OAuth scope, consent purpose, partner status, quota plan, and tenant boundary for inspect quota consumption. | The portal stores the API analytics and health summary state, calls IAM/gateway/test/partner/usage owners as needed, queues fallout with correlation ID, notifies developers, and records completion evidence. |
| 4. Track webhook delivery | Developer, API product manager, governance lead, platform operations user, or lifecycle event starts the track webhook delivery workflow. | The portal validates developer organization, application, subscription, API product lifecycle, environment, OAuth scope, consent purpose, partner status, quota plan, and tenant boundary for track webhook delivery. | The portal stores the API analytics and health summary state, calls IAM/gateway/test/partner/usage owners as needed, queues fallout with correlation ID, notifies developers, and records completion evidence. |
| 5. Analyze version migration | Developer, API product manager, governance lead, platform operations user, or lifecycle event starts the analyze version migration workflow. | The portal validates developer organization, application, subscription, API product lifecycle, environment, OAuth scope, consent purpose, partner status, quota plan, and tenant boundary for analyze version migration. | The portal stores the API analytics and health summary state, calls IAM/gateway/test/partner/usage owners as needed, queues fallout with correlation ID, notifies developers, and records completion evidence. |

## Detailed Feature Backlog

| Feature ID | Feature | Priority guidance | Backlog outcome |
| --- | --- | --- | --- |
| F-api-analytics-and-health-01 | API traffic and quota dashboard | Critical: sequence by production risk, partner revenue impact, security exposure, developer blockage, and platform dependency readiness. | show calls, errors, latency, throttles, quota consumption, subscriber, environment, plan, and API product breakdowns. |
| F-api-analytics-and-health-02 | Webhook and event delivery health | High: sequence by production risk, partner revenue impact, security exposure, developer blockage, and platform dependency readiness. | show endpoint success, retries, DLQ, payload version, signature failures, and replay status. |
| F-api-analytics-and-health-03 | Developer adoption and version migration | High: sequence by production risk, partner revenue impact, security exposure, developer blockage, and platform dependency readiness. | show active apps, new subscriptions, deprecated traffic, migration readiness, and campaign effectiveness. |
| F-api-analytics-and-health-04 | Incident and status impact view | High: sequence by production risk, partner revenue impact, security exposure, developer blockage, and platform dependency readiness. | surface degraded APIs, affected developers, SLA/SLO, support tickets, and communication state. |
| F-api-analytics-and-health-05 | Contract and policy violation analytics | Medium: sequence by production risk, partner revenue impact, security exposure, developer blockage, and platform dependency readiness. | report schema errors, unauthorized scopes, consent failures, abnormal traffic, and possible abuse patterns. |

## Acceptance Criteria

1. **AC-api-analytics-and-health-01:** Given an API product manager opens a monetized API dashboard, when the reporting period is selected, then the portal shows usage, quota, errors, latency, subscriber count, plan tier, metering export state, and settlement handoff status.
2. **AC-api-analytics-and-health-02:** Given a partner developer checks webhook health, when the developer opens delivery logs, then the portal shows endpoint, event type, retries, signature status, DLQ state, replay action, and payload version inside organization scope.
3. **AC-api-analytics-and-health-03:** Given platform operations declares an API incident, when the incident status changes, then the portal identifies impacted APIs, subscribers, versions, quota plans, and developer communications.
4. **AC-api-analytics-and-health-04:** Given a deprecated version still has active production traffic, when the migration report runs, then the portal lists applications, volume, errors, owner contacts, migration deadline, and exception approvals.
5. **AC-api-analytics-and-health-05:** Given abnormal traffic exceeds expected quota pattern, when analytics detects the pattern, then the portal alerts API product, security, and platform operations owners with plan, credential, and tenant context.
6. **AC-api-analytics-and-health-06:** Given raw gateway metrics are delayed, when the dashboard refreshes, then the portal shows freshness timestamp, partial-data warning, and does not make settlement or SLA assertions from incomplete data.

## Negative Scenarios

Negative scenarios for this feature include permission denial, missing source data, stale dependency state, policy failure, duplicate or replayed request, downstream timeout, reconciliation mismatch, and any feature-specific negative scenario additions listed in the suite gap-review closure addendum.

## Edge Cases

| Scenario | Expected behavior |
| --- | --- |
| Developer tries to view another organization analytics | The portal enforces tenant and organization boundary, masks traffic data, and records access decision. |
| Gateway sends duplicate metering records | The analytics summary deduplicates by event ID and sequence, flags the discrepancy, and protects monetization handoff. |
| Health view conflicts with API status page | The portal shows source timestamps and routes inconsistency to platform operations instead of silently choosing one state. |
| Unapproved developer or organization | The portal blocks subscription or credential issuance, records the onboarding decision, and shows the partner developer the missing verification, terms, KYC, or approval dependency. |
| Gateway or IAM enforcement unavailable | The portal does not claim production access is active, queues the credential or policy handoff when allowed, and alerts platform operations with correlation ID. |
| Unsupported API version requested | The portal shows lifecycle state, migration deadline, replacement version, compatibility notes, and support path without silently granting deprecated production traffic. |
| Cross-tenant data exposure risk | The portal masks subscription, credential, analytics, webhook, and support data outside the developer organization, tenant, partner, and environment boundary. |

## Suite Gap Review Closure Addendum

Source review: [05 Digital Partner Ecosystem Gap Review](../../../../suite-gap-reviews/05-digital-partner-ecosystem-gap-review.md)

This addendum applies the suite gap-review findings tied to this feature file. It supplements the baseline feature specification and should be carried into epic, story, API, event, data, and test refinement.

### Review Backlog Items Addressed

| Severity | Gap-review item | Closure expectation |
| --- | --- | --- |
| High | Webhook/credential lifecycle with replay, signing, and compromised-secret response. | Add concrete happy path, negative path, edge-case, API/event/data control, reporting, and test evidence for this feature area. |
| Medium | API usage dispute and monetization reconciliation. | Add concrete happy path, negative path, edge-case, API/event/data control, reporting, and test evidence for this feature area. |

### Acceptance Criteria Additions

1. Given a developer application requests production access, when security, conformance, sandbox test, webhook, quota, support, and commercial plan criteria are not complete, then production approval is blocked with remediation tasks.
2. Given a webhook delivery fails repeatedly, when retry policy is exhausted, then the subscriber is marked degraded, replay is made available with signed events, and billable/operational impacts are logged.
3. Given an API version is deprecated, when impacted subscribers remain active, then migration communications, test window, exception approval, and cutover status are tracked.

### Negative Scenario Additions

1. Partner rotates a secret incorrectly and production calls fail; revoke old credential only after safe overlap or approved emergency action.
2. API payload breaks TMF contract; block publication or require explicit extension approval.
3. Billable API usage is disputed; preserve usage events, quota ledger, plan version, and settlement handoff evidence.

### API, Event, Data, And Reporting Updates

- Add or refine command/query APIs so the owning app remains the system of record and consumers do not bypass app APIs.
- Add lifecycle events for the reviewed gap, including created, validated, blocked, approved, completed, failed, corrected, replayed, and reconciliation-failed variants where applicable.
- Capture idempotency keys, correlation IDs, source freshness, lineage, confidence, policy version, owner, SLA/OLA timers, and audit evidence.
- Add dashboards or operational reports for aging, failure reason, confidence/quality, consumer impact, exception backlog, and closure proof.
- Extend the test approach with happy-path, negative, edge-case, contract, event replay, data reconciliation, security, accessibility, and operational-readiness tests for the listed review items.

## API, Event, And Data Requirements

Related APIs and API areas: [TMF628](../../../../../references/tmforum-open-apis/openapi-specs/TMF628_Performance), [TMF657](../../../../../references/tmforum-open-apis/openapi-specs/TMF657_ServiceQualityManagement)

TMF and extension fit:

- Non-TMF extension APIs are required for API-specific traffic summaries, quota dashboards, webhook delivery health, developer adoption cohorts, and API product business KPIs.
- The API Analytics And Health feature must use TMF-aligned APIs as contract anchors and documented extension APIs for developer portal records that TMF does not model directly.
- The API Analytics And Health feature must publish events for portal record created, approval requested, approval granted, policy handoff sent, policy handoff failed, developer notified, exception raised, exception resolved, suspended, migrated, and completed.
- The API Analytics And Health feature must store portal-owned metadata, status, evidence links, developer-visible analytics summaries, and approval state in the Developer Portal logical database while secrets, raw logs, runtime policy, and source API contracts stay with platform owners.

## Integrations And Handoffs

- ['API gateway, event fabric, monitoring, incident management, and data platform for raw metrics, traces, event delivery, status, and analytical aggregation.']
- Integration, Eventing, And API Platform for API gateway policy, contract registry, event catalog, tracing, DLQ/replay, runtime quota enforcement, and adapter state.
- Platform Admin And Security for OAuth clients, certificates, secrets, roles, tenant policy, privileged access, and audit search.
- Partner And Marketplace, Customer And Party 360, Usage/Settlement, Billing, Data Platform, and Test Lab for partner context, party identity, usage metering, monetization, analytics, and conformance evidence.

## Non-Functional Requirements

- API analytics and health must ingest high-volume gateway summaries, keep developer-facing dashboards fresh within the target interval, protect raw logs from portal storage, and maintain reliable quota and webhook health views during incidents.
- The API Analytics And Health workflow must support idempotent approvals, environment-specific entitlements, retryable platform handoffs, reliable developer notifications, and audit retention for production access decisions.
- The API Analytics And Health portal UI and APIs must support partner-volume onboarding, high API traffic summaries, webhook reliability, quota visibility, role-based masking, accessibility, localization, and tenant/region isolation.

## Compliance Security Privacy Controls

- The API Analytics And Health feature must enforce OAuth scopes, least-privilege portal roles, consent purpose, tenant isolation, partner agreement status, secret rotation controls, data residency, retention, and legal-hold rules.
- The API Analytics And Health feature must never store raw client secrets, private keys, payment data, personal customer payloads, or unrestricted gateway logs in the portal database.
- The API Analytics And Health feature must record actor, developer organization, app, API product/version, environment, approval, policy decision, gateway/IAM/test handoff, and notification evidence for every material lifecycle change.

## Observability And Operations

- Track API latency by product for the API Analytics And Health lifecycle by API product, version, developer organization, application, partner, environment, plan, and tenant.
- Track quota exhaustion for the API Analytics And Health lifecycle by API product, version, developer organization, application, partner, environment, plan, and tenant.
- Track webhook DLQ aging for the API Analytics And Health lifecycle by API product, version, developer organization, application, partner, environment, plan, and tenant.
- Track deprecated traffic volume for the API Analytics And Health lifecycle by API product, version, developer organization, application, partner, environment, plan, and tenant.
- Track gateway metric freshness for the API Analytics And Health lifecycle by API product, version, developer organization, application, partner, environment, plan, and tenant.
- Alert API product, portal, platform operations, and security owners when API Analytics And Health handoffs fail, DLQs age, quota policy drifts, deprecated traffic remains, credentials near expiry, or approval queues breach SLA/OLA.
- Provide dashboards for API Analytics And Health volume, aging, failure reason, revenue risk, security risk, subscriber impact, migration readiness, and developer communication status.

## Test Approach

| Test layer | Required coverage |
| --- | --- |
| Journey tests | Cover happy path, approval, rejection, suspension, reactivation, migration, support recovery, and partner/developer notification for API Analytics And Health. |
| API and event contract tests | Validate TMF-aligned contracts, extension APIs, idempotency, correlation ID, event ordering, version compatibility, DLQ/replay, and gateway/IAM/test handoff behavior for API Analytics And Health. |
| Security and privacy tests | Validate OAuth scopes, roles, secret masking, consent purpose, tenant isolation, data residency, malicious payloads, compromised credential response, and audit evidence for API Analytics And Health. |
| NFR and operations tests | Validate onboarding scale, dashboard freshness, quota and webhook reliability, accessibility/localization, alert thresholds, and portal resilience for API Analytics And Health. |

## Out Of Scope And Dependencies

- The API Analytics And Health feature does not master source API implementations, API gateway runtime policy, raw traffic logs, secret material, customer or partner party masters, usage records, billing records, or settlement calculations.
- The API Analytics And Health feature depends on platform, IAM, gateway, eventing, test, partner, usage, billing, and data owners to provide APIs, events, enforcement status, and correction paths.
- The API Analytics And Health feature may store developer portal metadata, developer org/app/subscription state, approval evidence, developer-facing analytics summaries, sandbox configuration, and notification records only within the Developer Portal boundary.

## Feature Detail Review Implementation Alignment (2026-06-14)

Source: [App Feature Detail Review Alignment](README.md#feature-detail-review-alignment-2026-06-14) and [Suite Feature Detail Review](../../feature-detail-review.md).

Apply this app review scope to this feature: API product lifecycle, developer production readiness, credentials, webhooks, conformance, version migration, quota and usage controls, and monetization evidence.

Implementation updates required for this feature:

- Re-check the core workflows and add or adjust happy paths, approval paths, exception queues, rollback or compensation behavior, and handoffs so the review scope is directly represented in build stories.
- Add or refine UI workbench expectations, including operator queues, evidence panels, policy decision traces, preview/simulation views, and status dashboards where this feature owns the behavior.
- Add or refine command APIs, query APIs, events, app-owned data fields, DDL gap notes, and integration handoffs needed to support the review scope without crossing app data ownership boundaries.
- Add acceptance criteria for source authority, tenant and residency controls, lifecycle state, approval evidence, idempotency, correlation IDs, SLA/OLA timers, and downstream acknowledgement where applicable.
- Add negative scenarios for stale data, duplicate events, policy denial, missing evidence, downstream outage, unauthorized access, bulk/replay risk, and manual override misuse.
- Extend tests to include happy path, negative path, edge case, API contract, event replay, data reconciliation, security, accessibility, observability, runbook, and release-gate evidence for the review scope.

## Build-Ready Refinement (2026-06-14)

This refinement converts the feature review material for API Analytics And Health into delivery slices that can become epics, stories, API contracts, migrations, and test cases. Treat Developer And API Portal App as the owning application for this feature within Suite Digital, Partner, And Ecosystem and schema `developer_api_portal`.

| Workstream | Build-ready delivery guidance |
| --- | --- |
| UX and workflow | Build the API Analytics And Health workbench for API product manager, Partner developer, Internal developer, API governance lead, Platform operations user, Security officer. Include search or intake, guided validation, detail view, lifecycle timeline, decision panel, evidence drawer, exception queue, bulk or replay controls where relevant, saved filters, SLA/OLA aging, empty/error states, and role-aware masking. The UI must expose create, validate, approve, correct, close, and audit api analytics and health state and block closure when required evidence, approval, reconciliation, or downstream acknowledgement is missing. |
| API and events | Implement command and query APIs around api-analytics-and-health using TMF628, TMF657. Command APIs for API Analytics And Health should cover create/initiate, validate, update, approve/reject, hold/release, retry, correct, cancel or compensate, and close where those states apply. Query APIs for API Analytics And Health should cover search, detail, timeline, related entities, dependency status, work queue, metrics, and audit/evidence retrieval. The API Analytics And Health feature must publish events for portal record created, approval requested, approval granted, policy handoff sent, policy handoff failed, developer notified, exception raised, exception... Non-TMF extension APIs are required for API-specific traffic summaries, quota dashboards, webhook delivery health, developer adoption cohorts, and API product business KPIs. Every command, query, and event must carry tenant/brand/market where applicable, actor, source channel, reason code, idempotency key, correlation ID, external reference, lifecycle state, and version metadata. |
| Data and controls | Persist api analytics and health record inside `developer_api_portal` with typed lifecycle, owner, status reason, timestamps, policy decision, source freshness, confidence, old/new value, evidence, and reconciliation fields. Developer And API Portal App owns the app-local lifecycle and evidence records for API Analytics And Health; consumers must use APIs, events, projections, workflow tasks, or certified data products. Keep TMF payloads, extension characteristics, imported evidence, and low-stability metadata in JSONB while promoting operationally searched lifecycle fields to typed columns. |
| Integration and handoff | Exchange not yet specified with ['API gateway, event fabric, monitoring, incident management, and data platform for raw metrics, traces, event delivery, status, and analytical aggregation.'], Integration, Eventing, And API Platform for API gateway policy... only through APIs, events, workflow tasks, governed projections, adapters, evidence packages, or certified data products. Show source owner, freshness, confidence, dependency state, retry status, blocked consumer, and completion evidence so the app does not create shadow mastership or direct cross-schema coupling. |
| Security, privacy, and compliance | Enforce RBAC/ABAC, tenant and residency boundaries, least privilege, separation of duties, masking, purpose limitation, retention, legal hold, export control, manual override expiry, immutable audit, and evidence chain of custody for API Analytics And Health. Sensitive customer, revenue, partner, security, network, credential, or regulatory evidence must be masked unless the persona has explicit operational purpose. |
| Tests and operations | Create unit, API contract, event replay/idempotency, workflow, integration, migration, data reconciliation, security/privacy, accessibility/localization, performance, dashboard, alert, and runbook tests for API Analytics And Health. Cover happy path, assisted path, automated path, exception path, bulk/project path, stale or duplicate input, downstream outage, policy denial, manual override, and reconciliation mismatch. Use the existing review scope - API product lifecycle, developer production readiness, credentials, webhooks, conformance, version migration, quota and usage controls, and monetization evidence. - as mandatory backlog and test evidence. |

Implementation notes:

- Treat Developer And API Portal App as the lifecycle owner for api analytics and health record; referenced data such as not yet specified must remain references, snapshots, projections, evidence packages, or consumer acknowledgements unless the source file explicitly gives this app mastership.
- Make TMF alignment visible in every story: use named TMF resources where they fit, document non-TMF extension APIs with OpenAPI, and keep extension payloads compatible with TMF-style identifiers, lifecycle state, related entities, pagination, errors, and event envelopes.
- Build UI and API behavior around decision evidence, not only CRUD: surface the permitted next actions, policy decision, state reason, owner, SLA/OLA timer, blocked dependency, retry or compensation path, and closure proof.
- Add development tasks for route/page/component work, command/query handlers, DTO validation, entity/repository/migration changes, outbox/event contracts, projection refresh, privacy/security checks, and operational dashboards.
- Definition-of-done evidence must show downstream consumers can use published state through APIs, events, projections, workflow tasks, or certified data products without direct database reads or manual spreadsheet reconciliation.

## Definition Of Done

1. Product owner confirms the API Analytics And Health feature supports API product manager, partner developer, internal developer, governance lead, platform operations, and security officer jobs.
2. Architecture owner confirms the API Analytics And Health feature uses TMF-aligned source APIs, documented extension APIs, private portal storage, events, idempotency, and ODA component boundaries.
3. QA owner confirms acceptance criteria, negative scenarios, contract tests, security tests, accessibility/localization tests, quota/webhook tests, and resilience tests are automated or evidenced.
4. Operations owner confirms dashboards, alerts, DLQ/replay, runbooks, exception queues, support handoffs, and ownership escalation are live for API Analytics And Health.
5. Data steward confirms source-app mastership, portal metadata lineage, retention, consent, data residency, and analytics summary controls for API Analytics And Health.
6. Compliance and security owners confirm audit evidence, masking, OAuth scopes, secret lifecycle, partner agreement controls, and regulated developer communications for API Analytics And Health.


## Build-Ready Refinement (2026-06-15)

Header added at the top of this file. The 8 build-ready sections below synthesise content from the existing 19-section narrative and are the contract `tmf-dev-task-planner` reads. Source citations are inline.

## Persona & decision

- Not applicable — feature has no separate persona (single shared workflow).

## Lifecycle ownership

- This app owns the lifecycle state of the planning record listed in the source `## Telecom Objects And Decision Rights`. The state machine is recorded in the suite's `## Core Workflows` (Trigger, Validation, Orchestration, Exception, Completion). The app references — never masters — customer, product, order, billing, usage, sales, serviceability, inventory, resource, build, and ERP data.
- Source: [features/<this>.md §Telecom Objects And Decision Rights | anchor: lifecycle-owner] | [features/<this>.md §Core Workflows | anchor: lifecycle-states]

## TMF fit

- TMF API baseline for this app: TMF720, TMF672, TMF668, TMF704, TMF706, TMF705, TMF628, TMF657, TMF708, TMF707, TMF710.
- Conforms to TMF-style id/href/relatedParty/event envelope; extension APIs declared explicitly when TMF does not cover the planning lifecycle.
- Source: [planning/suite-details/tmf-api-ddl-reviews/developer-api-portal.md | anchor: tmf-fit]

## Data fit

- Owns schema `developer_api_portal`; the V001 migration lists the owned tables: `developer_organization`, `developer_application`, `api_product_publication_metadata`, `api_subscription`, `credential_request_reference`, `sandbox_mock_scenario`, `portal_api_analytics_summary`, `certification_state`, `event_outbox`.
- Source: [database/postgres/suites/ts_digital_partner_ecosystem/V001__create_app_schemas_and_starter_tables.sql §schema | anchor: schema-list]

## Path coverage

- Happy path: Not applicable — no evidence of this path in `## Edge Cases` or `## Missing Use Cases And Scenarios`.
- Assisted path: Not applicable — feature is persona-driven happy path; assisted path is owned by exception / approval features.
- Automated path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Exception path: Not applicable — no evidence of this path in `## Edge Cases` or `## Missing Use Cases And Scenarios`.
- Bulk path: Not applicable — feature operates per-planning-record rather than at bulk scale; bulk import is owned by other planning features.
- Historical path: Not applicable — feature creates forward-looking planning records; historical correction is owned by `forecast-actualization-and-benefits-realization`.
- Multi-tenant path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Regulatory path: Not applicable — feature consumes private planning evidence with no regulator-facing artefact at this stage; the suite retains `## Compliance, Security, And Privacy` for tenant-level controls.
- Source: [features/<this>.md §Edge Cases | anchor: paths] | [features/<this>.md §Missing Use Cases And Scenarios | anchor: paths]

## UI implications

- Pages / workbenches (per the app's `Required app screens / workbenches` block in `dev-tasks/development-task-tracker.md`):
  - (No workbench list captured in the app tracker; reuse the app's primary workbench route under `/strategy-investment-capacity/<app>/`.)
- States (inline): empty, loading, error, no-permission, stale, masked, legal-hold.
- Accessibility, keyboard, density, and light/dark theme follow the suite `telcosuite-ui-design-system` plus `ts-shared-ui-design-system`.
- Source: [development-task-tracker.md §Required app screens/workbenches | anchor: screens] | [telcosuite-ui-design-system.md | anchor: ux-baseline]

## Acceptance & tests

- AC1 (AC-api-analytics-and-health-01): Given an API product manager opens a monetized API dashboard, when the reporting period is selected, then the portal shows usage, quota, errors, latency, subscriber count, plan tier, metering export state, and settlement handoff status.
- AC2 (AC-api-analytics-and-health-02): Given a partner developer checks webhook health, when the developer opens delivery logs, then the portal shows endpoint, event type, retries, signature status, DLQ state, replay action, and payload version inside organization scope.
- AC3 (AC-api-analytics-and-health-03): Given platform operations declares an API incident, when the incident status changes, then the portal identifies impacted APIs, subscribers, versions, quota plans, and developer communications.
- AC4 (AC-api-analytics-and-health-04): Given a deprecated version still has active production traffic, when the migration report runs, then the portal lists applications, volume, errors, owner contacts, migration deadline, and exception approvals.
- AC5 (AC-api-analytics-and-health-05): Given abnormal traffic exceeds expected quota pattern, when analytics detects the pattern, then the portal alerts API product, security, and platform operations owners with plan, credential, and tenant context.
- AC6 (AC-api-analytics-and-health-06): Given raw gateway metrics are delayed, when the dashboard refreshes, then the portal shows freshness timestamp, partial-data warning, and does not make settlement or SLA assertions from incomplete data.
- Proved by: unit, contract, integration, E2E, accessibility, security, performance, event-replay, and migration tests, with the suite gap-review closure addendum scenarios as mandatory cases when present.
- Source: [features/<this>.md §Acceptance Criteria | anchor: ac-list]

## Dependencies & release gate

- Depends on: dev-tasks tracker `Required app screens/workbenches` block; the suite's P01 foundation tasks; cross-app TMF and event contracts listed under `## API, Event, And Data Requirements`.
- Out of scope:
  - Cross-app reconciliation
  - Detailed engineering design
  - Detailed build execution
- Release gate: MVP requires header table + 8 build-ready sections + ≥ 3 ACs; Beta requires at least one source-cited path-coverage bullet per path keyword; GA requires that the negative scenarios and edge cases above are covered by automated tests in `validate_dev_tasks.py`.
- Source: [development-task-tracker.md | anchor: release-gate]
