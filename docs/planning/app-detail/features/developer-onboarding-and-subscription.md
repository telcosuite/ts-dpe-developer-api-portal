# Developer Onboarding And Subscription Feature Specification

Reviewed: 2026-06-07

Suite: Digital, Partner, And Ecosystem

App: [Developer And API Portal App](../README.md)

Source module detail: [Modules And Features](../modules-and-features.md)

Feature area slug: `developer-onboarding-and-subscription`

## Feature Intent

Register developer organizations, individual developers, applications, terms acceptance, API subscriptions, environment access, approval tasks, quota tier requests, OAuth client handoffs, and role assignments for partner developers, internal developers, API product managers, governance leads, and security officers. The Developer Portal owns developer org, app, and subscription lifecycle state while IAM, API gateway, Partner Marketplace, and Customer And Party 360 own identity enforcement, runtime policy, partner lifecycle, and canonical party records.

The Developer Onboarding And Subscription feature supports Suite 05 partner/API monetization, govern-to-comply, lead-to-order, usage-to-cash, and partner-to-settle journeys by turning developer intent into governed portal records, platform handoffs, developer-visible status, and audit evidence. The feature must not master raw gateway logs, runtime secrets, customer data, partner party records, usage records, settlement records, or source API implementation state.

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
| API product manager | Use the developer organization, application, and API subscription during register developer organization, create developer application, request API subscription with role-aware portal access, environment awareness, and platform/source-system status. | The api product manager can complete or recover the developer organization, application, and API subscription lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |
| Partner developer | Use the developer organization, application, and API subscription during register developer organization, create developer application, request API subscription with role-aware portal access, environment awareness, and platform/source-system status. | The partner developer can complete or recover the developer organization, application, and API subscription lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |
| Internal developer | Use the developer organization, application, and API subscription during register developer organization, create developer application, request API subscription with role-aware portal access, environment awareness, and platform/source-system status. | The internal developer can complete or recover the developer organization, application, and API subscription lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |
| API governance lead | Use the developer organization, application, and API subscription during register developer organization, create developer application, request API subscription with role-aware portal access, environment awareness, and platform/source-system status. | The api governance lead can complete or recover the developer organization, application, and API subscription lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |
| Platform operations user | Use the developer organization, application, and API subscription during register developer organization, create developer application, request API subscription with role-aware portal access, environment awareness, and platform/source-system status. | The platform operations user can complete or recover the developer organization, application, and API subscription lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |
| Security officer | Use the developer organization, application, and API subscription during register developer organization, create developer application, request API subscription with role-aware portal access, environment awareness, and platform/source-system status. | The security officer can complete or recover the developer organization, application, and API subscription lifecycle with subscription ID, app ID, API product/version, policy decision, platform handoff, and audit evidence. |

## Core Workflows

| Workflow | Trigger | Validation and decision rights | Orchestration, exception, and completion evidence |
| --- | --- | --- | --- |
| 1. Register developer organization | Developer, API product manager, governance lead, platform operations user, or lifecycle event starts the register developer organization workflow. | The portal validates developer organization, application, subscription, API product lifecycle, environment, OAuth scope, consent purpose, partner status, quota plan, and tenant boundary for register developer organization. | The portal stores the developer organization, application, and API subscription state, calls IAM/gateway/test/partner/usage owners as needed, queues fallout with correlation ID, notifies developers, and records completion evidence. |
| 2. Create developer application | Developer, API product manager, governance lead, platform operations user, or lifecycle event starts the create developer application workflow. | The portal validates developer organization, application, subscription, API product lifecycle, environment, OAuth scope, consent purpose, partner status, quota plan, and tenant boundary for create developer application. | The portal stores the developer organization, application, and API subscription state, calls IAM/gateway/test/partner/usage owners as needed, queues fallout with correlation ID, notifies developers, and records completion evidence. |
| 3. Request api subscription | Developer, API product manager, governance lead, platform operations user, or lifecycle event starts the request API subscription workflow. | The portal validates developer organization, application, subscription, API product lifecycle, environment, OAuth scope, consent purpose, partner status, quota plan, and tenant boundary for request API subscription. | The portal stores the developer organization, application, and API subscription state, calls IAM/gateway/test/partner/usage owners as needed, queues fallout with correlation ID, notifies developers, and records completion evidence. |
| 4. Approve production access | Developer, API product manager, governance lead, platform operations user, or lifecycle event starts the approve production access workflow. | The portal validates developer organization, application, subscription, API product lifecycle, environment, OAuth scope, consent purpose, partner status, quota plan, and tenant boundary for approve production access. | The portal stores the developer organization, application, and API subscription state, calls IAM/gateway/test/partner/usage owners as needed, queues fallout with correlation ID, notifies developers, and records completion evidence. |
| 5. Suspend or terminate subscription | Developer, API product manager, governance lead, platform operations user, or lifecycle event starts the suspend or terminate subscription workflow. | The portal validates developer organization, application, subscription, API product lifecycle, environment, OAuth scope, consent purpose, partner status, quota plan, and tenant boundary for suspend or terminate subscription. | The portal stores the developer organization, application, and API subscription state, calls IAM/gateway/test/partner/usage owners as needed, queues fallout with correlation ID, notifies developers, and records completion evidence. |

## Detailed Feature Backlog

| Feature ID | Feature | Priority guidance | Backlog outcome |
| --- | --- | --- | --- |
| F-developer-onboarding-and-subscription-01 | Developer organization registration | Critical: sequence by production risk, partner revenue impact, security exposure, developer blockage, and platform dependency readiness. | capture organization, contacts, partner linkage, tenant, country, terms, and verification dependencies. |
| F-developer-onboarding-and-subscription-02 | Application registration and ownership | Critical: sequence by production risk, partner revenue impact, security exposure, developer blockage, and platform dependency readiness. | create app profile, redirect URIs, environment needs, technical contact, data purpose, and support contact. |
| F-developer-onboarding-and-subscription-03 | API subscription approval | Critical: sequence by production risk, partner revenue impact, security exposure, developer blockage, and platform dependency readiness. | approve API product, scope, environment, quota tier, term, consent purpose, and production certification dependency. |
| F-developer-onboarding-and-subscription-04 | Environment access lifecycle | High: sequence by production risk, partner revenue impact, security exposure, developer blockage, and platform dependency readiness. | manage sandbox, pre-production, and production entitlement with gateway/IAM handoff and revocation evidence. |
| F-developer-onboarding-and-subscription-05 | Subscription suspension and termination | High: sequence by production risk, partner revenue impact, security exposure, developer blockage, and platform dependency readiness. | handle policy breach, inactivity, partner suspension, contract end, secret compromise, and voluntary offboarding. |

## Acceptance Criteria

1. **AC-developer-onboarding-and-subscription-01:** Given a partner developer registers a new organization, when the onboarding form is submitted, then the portal validates partner status, required contacts, country, tenant, terms, KYC or commercial dependency, and identity proof before creating an onboarding record.
2. **AC-developer-onboarding-and-subscription-02:** Given a developer creates an application for a billing API, when the app profile is saved, then the portal captures redirect URIs, webhook endpoints, data purpose, technical owner, support contact, and requested environments.
3. **AC-developer-onboarding-and-subscription-03:** Given an API product manager approves a production subscription, when the approval is recorded, then the portal checks certification state, quota plan, OAuth scopes, consent basis, partner agreement, and gateway handoff readiness before granting production access state.
4. **AC-developer-onboarding-and-subscription-04:** Given a partner lifecycle is suspended, when the suspension event arrives, then the portal suspends affected subscriptions, blocks new credentials, notifies developers, and records partner source reference.
5. **AC-developer-onboarding-and-subscription-05:** Given a developer leaves an organization, when the organization admin removes the user, then the portal revokes portal role, rotates ownership tasks, and sends IAM role revocation handoff.
6. **AC-developer-onboarding-and-subscription-06:** Given a security officer reviews subscription history, when the officer opens the subscription timeline, then the portal shows actor, approver, scopes, plan, environment, credential status, gateway policy result, and audit evidence.

## Negative Scenarios

Negative scenarios for this feature include permission denial, missing source data, stale dependency state, policy failure, duplicate or replayed request, downstream timeout, reconciliation mismatch, and any feature-specific negative scenario additions listed in the suite gap-review closure addendum.

## Edge Cases

| Scenario | Expected behavior |
| --- | --- |
| Developer requests scopes outside approved purpose | The portal rejects or routes the subscription to governance review and records the data-purpose and consent decision. |
| Organization has no active technical owner | The portal blocks production access expansion and requires owner reassignment before new subscriptions or credential changes. |
| Partner KYC or agreement expires | The portal marks related subscriptions at risk, blocks new production grants, and notifies partner and API product owners. |
| Unapproved developer or organization | The portal blocks subscription or credential issuance, records the onboarding decision, and shows the partner developer the missing verification, terms, KYC, or approval dependency. |
| Gateway or IAM enforcement unavailable | The portal does not claim production access is active, queues the credential or policy handoff when allowed, and alerts platform operations with correlation ID. |
| Unsupported API version requested | The portal shows lifecycle state, migration deadline, replacement version, compatibility notes, and support path without silently granting deprecated production traffic. |
| Cross-tenant data exposure risk | The portal masks subscription, credential, analytics, webhook, and support data outside the developer organization, tenant, partner, and environment boundary. |

## API, Event, And Data Requirements

Related APIs and API areas: [TMF720](../../../../../references/tmforum-open-apis/openapi-specs/TMF720_DigitalIdentity), [TMF672](../../../../../references/tmforum-open-apis/openapi-specs/TMF672_UserRolesPermissions), [TMF668](../../../../../references/tmforum-open-apis/openapi-specs/TMF668_PartnershipType)

TMF and extension fit:

- Non-TMF extension APIs are required for developer organization profiles, application registration, terms acceptance, subscription approval workflow, environment entitlement, and onboarding task queues.
- The Developer Onboarding And Subscription feature must use TMF-aligned APIs as contract anchors and documented extension APIs for developer portal records that TMF does not model directly.
- The Developer Onboarding And Subscription feature must publish events for portal record created, approval requested, approval granted, policy handoff sent, policy handoff failed, developer notified, exception raised, exception resolved, suspended, migrated, and completed.
- The Developer Onboarding And Subscription feature must store portal-owned metadata, status, evidence links, developer-visible analytics summaries, and approval state in the Developer Portal logical database while secrets, raw logs, runtime policy, and source API contracts stay with platform owners.

## Integrations And Handoffs

- ['Partner Marketplace for partner lifecycle and KYC/agreement state; IAM and API gateway for OAuth client, role, scope, and runtime policy enforcement.']
- Integration, Eventing, And API Platform for API gateway policy, contract registry, event catalog, tracing, DLQ/replay, runtime quota enforcement, and adapter state.
- Platform Admin And Security for OAuth clients, certificates, secrets, roles, tenant policy, privileged access, and audit search.
- Partner And Marketplace, Customer And Party 360, Usage/Settlement, Billing, Data Platform, and Test Lab for partner context, party identity, usage metering, monetization, analytics, and conformance evidence.

## Non-Functional Requirements

- Developer onboarding and subscription must process partner onboarding bursts, support approval SLA queues, keep developer org search responsive for operations users, and make every environment entitlement revocable within the target security window.
- The Developer Onboarding And Subscription workflow must support idempotent approvals, environment-specific entitlements, retryable platform handoffs, reliable developer notifications, and audit retention for production access decisions.
- The Developer Onboarding And Subscription portal UI and APIs must support partner-volume onboarding, high API traffic summaries, webhook reliability, quota visibility, role-based masking, accessibility, localization, and tenant/region isolation.

## Compliance Security Privacy Controls

- The Developer Onboarding And Subscription feature must enforce OAuth scopes, least-privilege portal roles, consent purpose, tenant isolation, partner agreement status, secret rotation controls, data residency, retention, and legal-hold rules.
- The Developer Onboarding And Subscription feature must never store raw client secrets, private keys, payment data, personal customer payloads, or unrestricted gateway logs in the portal database.
- The Developer Onboarding And Subscription feature must record actor, developer organization, app, API product/version, environment, approval, policy decision, gateway/IAM/test handoff, and notification evidence for every material lifecycle change.

## Observability And Operations

- Track developer onboarding SLA for the Developer Onboarding And Subscription lifecycle by API product, version, developer organization, application, partner, environment, plan, and tenant.
- Track subscription approval aging for the Developer Onboarding And Subscription lifecycle by API product, version, developer organization, application, partner, environment, plan, and tenant.
- Track production access handoff failures for the Developer Onboarding And Subscription lifecycle by API product, version, developer organization, application, partner, environment, plan, and tenant.
- Track inactive application count for the Developer Onboarding And Subscription lifecycle by API product, version, developer organization, application, partner, environment, plan, and tenant.
- Track suspended partner subscription count for the Developer Onboarding And Subscription lifecycle by API product, version, developer organization, application, partner, environment, plan, and tenant.
- Alert API product, portal, platform operations, and security owners when Developer Onboarding And Subscription handoffs fail, DLQs age, quota policy drifts, deprecated traffic remains, credentials near expiry, or approval queues breach SLA/OLA.
- Provide dashboards for Developer Onboarding And Subscription volume, aging, failure reason, revenue risk, security risk, subscriber impact, migration readiness, and developer communication status.

## Test Approach

| Test layer | Required coverage |
| --- | --- |
| Journey tests | Cover happy path, approval, rejection, suspension, reactivation, migration, support recovery, and partner/developer notification for Developer Onboarding And Subscription. |
| API and event contract tests | Validate TMF-aligned contracts, extension APIs, idempotency, correlation ID, event ordering, version compatibility, DLQ/replay, and gateway/IAM/test handoff behavior for Developer Onboarding And Subscription. |
| Security and privacy tests | Validate OAuth scopes, roles, secret masking, consent purpose, tenant isolation, data residency, malicious payloads, compromised credential response, and audit evidence for Developer Onboarding And Subscription. |
| NFR and operations tests | Validate onboarding scale, dashboard freshness, quota and webhook reliability, accessibility/localization, alert thresholds, and portal resilience for Developer Onboarding And Subscription. |

## Out Of Scope And Dependencies

- The Developer Onboarding And Subscription feature does not master source API implementations, API gateway runtime policy, raw traffic logs, secret material, customer or partner party masters, usage records, billing records, or settlement calculations.
- The Developer Onboarding And Subscription feature depends on platform, IAM, gateway, eventing, test, partner, usage, billing, and data owners to provide APIs, events, enforcement status, and correction paths.
- The Developer Onboarding And Subscription feature may store developer portal metadata, developer org/app/subscription state, approval evidence, developer-facing analytics summaries, sandbox configuration, and notification records only within the Developer Portal boundary.

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

This refinement converts the feature review material for Developer Onboarding And Subscription into delivery slices that can become epics, stories, API contracts, migrations, and test cases. Treat Developer And API Portal App as the owning application for this feature within Suite Digital, Partner, And Ecosystem and schema `developer_api_portal`.

| Workstream | Build-ready delivery guidance |
| --- | --- |
| UX and workflow | Build the Developer Onboarding And Subscription workbench for API product manager, Partner developer, Internal developer, API governance lead, Platform operations user, Security officer. Include search or intake, guided validation, detail view, lifecycle timeline, decision panel, evidence drawer, exception queue, bulk or replay controls where relevant, saved filters, SLA/OLA aging, empty/error states, and role-aware masking. The UI must expose create, validate, approve, correct, close, and audit developer onboarding and subscription state and block closure when required evidence, approval, reconciliation, or downstream acknowledgement is missing. |
| API and events | Implement command and query APIs around developer-onboarding-and-subscription using TMF720, TMF672, TMF668. Command APIs for Developer Onboarding And Subscription should cover create/initiate, validate, update, approve/reject, hold/release, retry, correct, cancel or compensate, and close where those states apply. Query APIs for Developer Onboarding And Subscription should cover search, detail, timeline, related entities, dependency status, work queue, metrics, and audit/evidence retrieval. The Developer Onboarding And Subscription feature must publish events for portal record created, approval requested, approval granted, policy handoff sent, policy handoff failed, developer notified, exception raised... Non-TMF extension APIs are required for developer organization profiles, application registration, terms acceptance, subscription approval workflow, environment entitlement, and onboarding task queues. Every command, query, and event must carry tenant/brand/market where applicable, actor, source channel, reason code, idempotency key, correlation ID, external reference, lifecycle state, and version metadata. |
| Data and controls | Persist developer onboarding and subscription record inside `developer_api_portal` with typed lifecycle, owner, status reason, timestamps, policy decision, source freshness, confidence, old/new value, evidence, and reconciliation fields. Developer And API Portal App owns the app-local lifecycle and evidence records for Developer Onboarding And Subscription; consumers must use APIs, events, projections, workflow tasks, or certified data products. Keep TMF payloads, extension characteristics, imported evidence, and low-stability metadata in JSONB while promoting operationally searched lifecycle fields to typed columns. |
| Integration and handoff | Exchange not yet specified with ['Partner Marketplace for partner lifecycle and KYC/agreement state; IAM and API gateway for OAuth client, role, scope, and runtime policy enforcement.'], Integration, Eventing, And API Platform for API gateway policy, contract... only through APIs, events, workflow tasks, governed projections, adapters, evidence packages, or certified data products. Show source owner, freshness, confidence, dependency state, retry status, blocked consumer, and completion evidence so the app does not create shadow mastership or direct cross-schema coupling. |
| Security, privacy, and compliance | Enforce RBAC/ABAC, tenant and residency boundaries, least privilege, separation of duties, masking, purpose limitation, retention, legal hold, export control, manual override expiry, immutable audit, and evidence chain of custody for Developer Onboarding And Subscription. Sensitive customer, revenue, partner, security, network, credential, or regulatory evidence must be masked unless the persona has explicit operational purpose. |
| Tests and operations | Create unit, API contract, event replay/idempotency, workflow, integration, migration, data reconciliation, security/privacy, accessibility/localization, performance, dashboard, alert, and runbook tests for Developer Onboarding And Subscription. Cover happy path, assisted path, automated path, exception path, bulk/project path, stale or duplicate input, downstream outage, policy denial, manual override, and reconciliation mismatch. Use the existing review scope - API product lifecycle, developer production readiness, credentials, webhooks, conformance, version migration, quota and usage controls, and monetization evidence. - as mandatory backlog and test evidence. |

Implementation notes:

- Treat Developer And API Portal App as the lifecycle owner for developer onboarding and subscription record; referenced data such as not yet specified must remain references, snapshots, projections, evidence packages, or consumer acknowledgements unless the source file explicitly gives this app mastership.
- Make TMF alignment visible in every story: use named TMF resources where they fit, document non-TMF extension APIs with OpenAPI, and keep extension payloads compatible with TMF-style identifiers, lifecycle state, related entities, pagination, errors, and event envelopes.
- Build UI and API behavior around decision evidence, not only CRUD: surface the permitted next actions, policy decision, state reason, owner, SLA/OLA timer, blocked dependency, retry or compensation path, and closure proof.
- Add development tasks for route/page/component work, command/query handlers, DTO validation, entity/repository/migration changes, outbox/event contracts, projection refresh, privacy/security checks, and operational dashboards.
- Definition-of-done evidence must show downstream consumers can use published state through APIs, events, projections, workflow tasks, or certified data products without direct database reads or manual spreadsheet reconciliation.

## Definition Of Done

1. Product owner confirms the Developer Onboarding And Subscription feature supports API product manager, partner developer, internal developer, governance lead, platform operations, and security officer jobs.
2. Architecture owner confirms the Developer Onboarding And Subscription feature uses TMF-aligned source APIs, documented extension APIs, private portal storage, events, idempotency, and ODA component boundaries.
3. QA owner confirms acceptance criteria, negative scenarios, contract tests, security tests, accessibility/localization tests, quota/webhook tests, and resilience tests are automated or evidenced.
4. Operations owner confirms dashboards, alerts, DLQ/replay, runbooks, exception queues, support handoffs, and ownership escalation are live for Developer Onboarding And Subscription.
5. Data steward confirms source-app mastership, portal metadata lineage, retention, consent, data residency, and analytics summary controls for Developer Onboarding And Subscription.
6. Compliance and security owners confirm audit evidence, masking, OAuth scopes, secret lifecycle, partner agreement controls, and regulated developer communications for Developer Onboarding And Subscription.
