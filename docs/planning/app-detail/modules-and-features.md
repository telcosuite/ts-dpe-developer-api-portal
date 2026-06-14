# Developer And API Portal App Modules And Features

Reviewed: 2026-06-06

This document expands each app module into feature-level planning guidance. It should be used to create epics, stories, API contracts, event contracts, screens, permissions, and test cases.

Source overview: [developer-api-portal.md](../developer-api-portal.md)

## App-Level Feature Principles

- Every feature must have an owning module and an owning app API.
- UI actions must call app APIs rather than writing directly to shared data stores.
- Cross-app reads should use APIs, subscribed events, governed projections, or data products.
- Each module should expose enough lifecycle state for operations, audit, automation, and customer/partner visibility.
- Feature design must include happy path, exception path, audit path, and reporting path.

## App Data Ownership Context

Owns API product catalog metadata, developer organizations, applications, subscriptions, credentials metadata, sandbox configuration, mock scenarios, API analytics summaries, and API governance evidence. Actual API runtime enforcement may sit in the platform API gateway.

## First Release Context

Deliver API catalog, developer onboarding, subscription, sandbox/mocks, analytics basics, and conformance evidence links. Add monetized API products, partner billing hooks, and automated certification later.

## Module 1: API Catalog

Anchor: `api-catalog`

### Capability Intent

Publish TMF APIs, product APIs, internal APIs, partner APIs, documentation, examples, policies, lifecycle state, owners, conformance status, and support channels.

### Primary Personas Supported

- API product manager: defines API products, audiences, lifecycle, and commercial packaging.
- Partner developer: discovers APIs, gets credentials, tests, and integrates.
- Internal developer: consumes governed APIs and mocks.
- API governance lead: manages standards, versioning, compatibility, deprecation, and TMF conformance.
- Platform operations user: monitors API health, usage, errors, and subscription issues.

### Feature Backlog Candidates

- Publish TMF APIs.
- Product APIs.
- Internal APIs.
- Partner APIs.
- Documentation.
- Lifecycle state.
- Conformance status.
- And support channels.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for api catalog records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate api catalog changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for api catalog work. |
| API and event behavior | Expose command, query, and event contracts for api catalog so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain API Catalog | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate api catalog state available through APIs |
| Handle API Catalog exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review API Catalog performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: Cross-cutting across all TMF APIs

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 2: Developer Onboarding And Subscription

Anchor: `developer-onboarding-and-subscription`

### Capability Intent

Register developers, apps, organizations, credentials, subscriptions, approvals, terms, API keys, OAuth clients, scopes, quotas, throttles, and environment access.

### Primary Personas Supported

- API product manager: defines API products, audiences, lifecycle, and commercial packaging.
- Partner developer: discovers APIs, gets credentials, tests, and integrates.
- Internal developer: consumes governed APIs and mocks.
- API governance lead: manages standards, versioning, compatibility, deprecation, and TMF conformance.
- Platform operations user: monitors API health, usage, errors, and subscription issues.

### Feature Backlog Candidates

- Register developers.
- Organizations.
- Subscriptions.
- OAuth clients.
- And environment access.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for developer onboarding and subscription records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate developer onboarding and subscription changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for developer onboarding and subscription work. |
| API and event behavior | Expose command, query, and event contracts for developer onboarding and subscription so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Developer Onboarding And Subscription | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate developer onboarding and subscription state available through APIs |
| Handle Developer Onboarding And Subscription exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Developer Onboarding And Subscription performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF720](../../../../references/tmforum-open-apis/openapi-specs/TMF720_DigitalIdentity), [TMF672](../../../../references/tmforum-open-apis/openapi-specs/TMF672_UserRolesPermissions), [TMF668](../../../../references/tmforum-open-apis/openapi-specs/TMF668_PartnershipType)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 3: Sandbox And Mock API

Anchor: `sandbox-and-mock-api`

### Capability Intent

Provide sandbox environments, sample data, mock APIs, callback simulators, test credentials, OpenAPI-driven mocks, and safe scenarios for qualification, order, usage, billing, and ticket flows.

### Primary Personas Supported

- API product manager: defines API products, audiences, lifecycle, and commercial packaging.
- Partner developer: discovers APIs, gets credentials, tests, and integrates.
- Internal developer: consumes governed APIs and mocks.
- API governance lead: manages standards, versioning, compatibility, deprecation, and TMF conformance.
- Platform operations user: monitors API health, usage, errors, and subscription issues.

### Feature Backlog Candidates

- Provide sandbox environments.
- Callback simulators.
- Test credentials.
- OpenAPI-driven mocks.
- And safe scenarios for qualification.
- And ticket flows.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for sandbox and mock api records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate sandbox and mock api changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for sandbox and mock api work. |
| API and event behavior | Expose command, query, and event contracts for sandbox and mock api so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Sandbox And Mock API | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate sandbox and mock api state available through APIs |
| Handle Sandbox And Mock API exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Sandbox And Mock API performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF704](../../../../references/tmforum-open-apis/openapi-specs/TMF704_TestCase), [TMF706](../../../../references/tmforum-open-apis/openapi-specs/TMF706_TestData), [TMF705](../../../../references/tmforum-open-apis/openapi-specs/TMF705_TestEnvironment)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 4: API Analytics And Health

Anchor: `api-analytics-and-health`

### Capability Intent

Track API usage, errors, latency, availability, quota consumption, consumer adoption, version migration, API degradation, and contract violations.

### Primary Personas Supported

- API product manager: defines API products, audiences, lifecycle, and commercial packaging.
- Partner developer: discovers APIs, gets credentials, tests, and integrates.
- Internal developer: consumes governed APIs and mocks.
- API governance lead: manages standards, versioning, compatibility, deprecation, and TMF conformance.
- Platform operations user: monitors API health, usage, errors, and subscription issues.

### Feature Backlog Candidates

- Track API usage.
- Availability.
- Quota consumption.
- Consumer adoption.
- Version migration.
- API degradation.
- And contract violations.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for api analytics and health records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate api analytics and health changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for api analytics and health work. |
| API and event behavior | Expose command, query, and event contracts for api analytics and health so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain API Analytics And Health | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate api analytics and health state available through APIs |
| Handle API Analytics And Health exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review API Analytics And Health performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF628](../../../../references/tmforum-open-apis/openapi-specs/TMF628_Performance), [TMF657](../../../../references/tmforum-open-apis/openapi-specs/TMF657_ServiceQualityManagement)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 5: API Governance And Conformance

Anchor: `api-governance-and-conformance`

### Capability Intent

Manage standards, versioning, review, approval, deprecation, compatibility, TMF conformance evidence, tests, certification results, change records, and implementation gaps.

### Primary Personas Supported

- API product manager: defines API products, audiences, lifecycle, and commercial packaging.
- Partner developer: discovers APIs, gets credentials, tests, and integrates.
- Internal developer: consumes governed APIs and mocks.
- API governance lead: manages standards, versioning, compatibility, deprecation, and TMF conformance.
- Platform operations user: monitors API health, usage, errors, and subscription issues.

### Feature Backlog Candidates

- Manage standards.
- Compatibility.
- TMF conformance evidence.
- Certification results.
- Change records.
- And implementation gaps.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for api governance and conformance records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate api governance and conformance changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for api governance and conformance work. |
| API and event behavior | Expose command, query, and event contracts for api governance and conformance so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain API Governance And Conformance | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate api governance and conformance state available through APIs |
| Handle API Governance And Conformance exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review API Governance And Conformance performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF704](../../../../references/tmforum-open-apis/openapi-specs/TMF704_TestCase), [TMF708](../../../../references/tmforum-open-apis/openapi-specs/TMF708_TestExecution), [TMF707](../../../../references/tmforum-open-apis/openapi-specs/TMF707_TestResult), [TMF710](../../../../references/tmforum-open-apis/openapi-specs/TMF710_GeneralTestArtifact)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.


## Critical Feature Review Enhancements (2026-06-14)

### Critical Assessment

The detailed developer portal feature specs are strong, but the app-level build guidance must make production readiness, API product lifecycle, credential safety, webhook reliability, quota evidence, conformance, version migration, and monetization handoffs explicit. This app should master developer organization, application, subscription, portal publication metadata, credential request references, sandbox/mock configuration, certification state, and portal analytics summaries while leaving gateway runtime policy, raw credentials, raw telemetry, identity enforcement, billing, and settlement records to owning platform/domain apps.

### Enhancements To Add

- Add API product lifecycle controls for audience, owner, version, OpenAPI/TMF conformance, support model, deprecation policy, documentation, SLA/SLO, plan/quota, and publication state.
- Add developer production-readiness scorecard covering onboarding, terms, app ownership, security review, credential readiness, sandbox tests, certification, webhook health, support contact, quota plan, and commercial approval.
- Add credential and secret lifecycle controls for OAuth/OIDC client requests, mTLS/certificates, signing keys, scope consent, rotation window, emergency revocation, compromised-secret response, and audit evidence.
- Add webhook reliability controls for endpoint verification, signing, retry policy, replay, idempotency, poison endpoint handling, subscriber health, and delivery evidence.
- Add API version migration campaign manager for impacted subscribers, migration window, test status, exception approval, communications, cutover state, and deprecation closeout.
- Add quota, usage, monetization, and dispute evidence linking portal summaries to platform gateway metrics, usage management, partner settlement, billing, and revenue-share records.

### Required Screens

- API product detail with contract/version, lifecycle, owner, audience, policy, quota/plan, conformance, support, health, documentation, and deprecation state.
- Developer organization and application workspace with users, roles, subscriptions, environments, credentials, terms, approvals, certification, and audit trail.
- Production-readiness scorecard with blocking criteria, remediation tasks, evidence, approvers, and gateway/platform activation status.
- Credential, consent, and webhook console with scopes, keys/certs, rotation, revocation, endpoint signing, retries, replay, and failure history.
- Version migration and deprecation dashboard with impacted apps, communications, test progress, exceptions, cutover, and residual traffic.
- API analytics and monetization view with usage, latency, errors, quota, billable events, settlement handoff, and dispute evidence.

### Open-Source Decision Points

- API gateway/runtime: integrate with the platform API gateway first; ask before adding or choosing an open-source gateway such as Apache APISIX, Kong Gateway OSS, or KrakenD.
- Identity/IAM: use platform IAM; ask before adding Keycloak or another open-source identity provider at portal level.
- Sandbox/mock APIs: start with Spring Boot mock scenarios and OpenAPI-driven fixtures; ask before adding WireMock, Microcks, or another open-source mock platform.
- Analytics/search: start with PostgreSQL summaries and platform telemetry references; ask before adding OpenSearch, ClickHouse, Prometheus, or Grafana components.

### API/Event/Data Additions

APIs should cover API product publish/deprecate, subscription request/approve/suspend, production-readiness evaluate, credential request/rotate/revoke, webhook endpoint verify, webhook replay, sandbox scenario publish, certification state update, version migration campaign, quota plan assignment, and usage dispute open/resolve.

Events should include `ApiProductPublished`, `ApiProductDeprecated`, `DeveloperOrganizationApproved`, `DeveloperApplicationApproved`, `ApiSubscriptionActivated`, `CredentialRotationRequested`, `CredentialRevoked`, `WebhookDeliveryFailed`, `WebhookReplayRequested`, `CertificationPassed`, `CertificationFailed`, `ApiVersionMigrationStarted`, `QuotaExceeded`, and `BillableApiUsageDisputed`.

Developer API Portal masters portal business context only. API contracts, runtime policies, gateway credentials, raw gateway metrics, identity enforcement, delivery attempts, billing, usage rating, and settlement remain mastered by platform and domain apps.

### First Release Scope

Include API catalog, developer organization/application onboarding, subscription approval, credential request reference, sandbox/mock scenario, conformance evidence, production-readiness scorecard, basic API analytics summary, webhook failure visibility, and version deprecation tracking. Defer full API monetization automation and advanced developer community features until gateway and settlement handoffs are proven.
