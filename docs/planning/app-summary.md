# Developer And API Portal App

## Purpose

Publish API products, manage developer onboarding, subscriptions, credentials, sandboxes, mock APIs, API analytics, health, governance, and conformance evidence.

## Primary Personas

- API product manager: defines API products, audiences, lifecycle, and commercial packaging.
- Partner developer: discovers APIs, gets credentials, tests, and integrates.
- Internal developer: consumes governed APIs and mocks.
- API governance lead: manages standards, versioning, compatibility, deprecation, and TMF conformance.
- Platform operations user: monitors API health, usage, errors, and subscription issues.

## Core Workflow

1. Publish API products, documentation, OpenAPI specs, policies, examples, and lifecycle state.
2. Register developers, organizations, applications, credentials, subscriptions, and terms.
3. Provide sandbox, sample data, mock APIs, callback simulators, and test credentials.
4. Track usage, latency, errors, availability, quotas, adoption, and version migration.
5. Govern API standards, compatibility, release evidence, deprecation, tests, and conformance.

## Module Capability Matrix

| Module | Detailed Capabilities | Related APIs |
| --- | --- | --- |
| API Catalog | Publish TMF APIs, product APIs, internal APIs, partner APIs, documentation, examples, policies, lifecycle state, owners, conformance status, and support channels. | Cross-cutting across all TMF APIs |
| Developer Onboarding And Subscription | Register developers, apps, organizations, credentials, subscriptions, approvals, terms, API keys, OAuth clients, scopes, quotas, throttles, and environment access. | [TMF720](../../../references/tmforum-open-apis/openapi-specs/TMF720_DigitalIdentity), [TMF672](../../../references/tmforum-open-apis/openapi-specs/TMF672_UserRolesPermissions), [TMF668](../../../references/tmforum-open-apis/openapi-specs/TMF668_PartnershipType) |
| Sandbox And Mock API | Provide sandbox environments, sample data, mock APIs, callback simulators, test credentials, OpenAPI-driven mocks, and safe scenarios for qualification, order, usage, billing, and ticket flows. | [TMF704](../../../references/tmforum-open-apis/openapi-specs/TMF704_TestCase), [TMF706](../../../references/tmforum-open-apis/openapi-specs/TMF706_TestData), [TMF705](../../../references/tmforum-open-apis/openapi-specs/TMF705_TestEnvironment) |
| API Analytics And Health | Track API usage, errors, latency, availability, quota consumption, consumer adoption, version migration, API degradation, and contract violations. | [TMF628](../../../references/tmforum-open-apis/openapi-specs/TMF628_Performance), [TMF657](../../../references/tmforum-open-apis/openapi-specs/TMF657_ServiceQualityManagement) |
| API Governance And Conformance | Manage standards, versioning, review, approval, deprecation, compatibility, TMF conformance evidence, tests, certification results, change records, and implementation gaps. | [TMF704](../../../references/tmforum-open-apis/openapi-specs/TMF704_TestCase), [TMF708](../../../references/tmforum-open-apis/openapi-specs/TMF708_TestExecution), [TMF707](../../../references/tmforum-open-apis/openapi-specs/TMF707_TestResult), [TMF710](../../../references/tmforum-open-apis/openapi-specs/TMF710_GeneralTestArtifact) |

## Data Ownership

Owns API product catalog metadata, developer organizations, applications, subscriptions, credentials metadata, sandbox configuration, mock scenarios, API analytics summaries, and API governance evidence. Actual API runtime enforcement may sit in the platform API gateway.

## First Release Scope

Deliver API catalog, developer onboarding, subscription, sandbox/mocks, analytics basics, and conformance evidence links. Add monetized API products, partner billing hooks, and automated certification later.

