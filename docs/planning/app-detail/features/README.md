# Developer And API Portal App Feature Specifications

Reviewed: 2026-06-07

This folder contains detailed feature specifications for Developer And API Portal capabilities. The specs make the portal responsible for developer-facing API product metadata, developer organizations, applications, subscriptions, sandbox configuration, mock scenarios, analytics summaries, governance evidence, monetization plan visibility, and support/migration workflows while platform runtime, IAM, gateway enforcement, raw logs, source API contracts, usage records, billing, and settlement remain with their owning apps.

Parent app: [Developer And API Portal App](../README.md)

## Feature Specification Index

| Feature specification | Intent | Core handoffs | Priority |
| --- | --- | --- | --- |
| [API Catalog](api-catalog.md) | Publish API products, TMF API references, partner APIs, internal APIs, OpenAPI documents, examples, policies, lifecycle state, owners, conformance status, support channels, and commercial packaging cues for API product managers, partner developers, internal developers, governance leads, and platform operations users. | TMF710 plus portal extension APIs, IAM/gateway, eventing, test, usage, and partner handoffs. | Critical |
| [Developer Onboarding And Subscription](developer-onboarding-and-subscription.md) | Register developer organizations, individual developers, applications, terms acceptance, API subscriptions, environment access, approval tasks, quota tier requests, OAuth client handoffs, and role assignments for partner developers, internal developers, API product managers, governance leads, and security officers. | TMF720, TMF672, TMF668 plus portal extension APIs, IAM/gateway, eventing, test, usage, and partner handoffs. | Critical |
| [Sandbox And Mock API](sandbox-and-mock-api.md) | Provide sandbox environments, mock APIs, sample data, callback simulators, webhook event simulations, test credentials, OpenAPI-driven mocks, safe failure scenarios, and certification pre-checks for partner developers, internal developers, governance leads, API product managers, and platform operations users. | TMF704, TMF706, TMF705 plus portal extension APIs, IAM/gateway, eventing, test, usage, and partner handoffs. | Critical |
| [API Analytics And Health](api-analytics-and-health.md) | Give API product managers, partner developers, platform operations users, governance leads, and security officers a portal view of API usage, latency, availability, errors, quota consumption, webhook delivery, consumer adoption, version migration, API degradation, contract violations, and monetization metering summaries. | TMF628, TMF657 plus portal extension APIs, IAM/gateway, eventing, test, usage, and partner handoffs. | Critical |
| [API Governance And Conformance](api-governance-and-conformance.md) | Manage API standards, review gates, versioning, compatibility, TMF conformance evidence, security review, privacy review, test cases, certification results, deprecation decisions, change records, implementation gaps, and exception waivers for API product managers, governance leads, platform operations, and security officers. | TMF704, TMF708, TMF707, TMF710 plus portal extension APIs, IAM/gateway, eventing, test, usage, and partner handoffs. | Critical |
| [API Product Monetization Plans And Quotas](api-product-monetization-plans-and-quotas.md) | Package APIs into free, paid, quota-based, revenue-share, trial, wholesale, and contract-specific plans with usage visibility, quota policy, rate-limit behavior, metering export, settlement handoff, partner billing context, and exception approvals for API product managers, partner developers, partner finance analysts, and platform operations users. | TMF668, TMF635, TMF736, TMF737 plus portal extension APIs, IAM/gateway, eventing, test, usage, and partner handoffs. | Critical |
| [Credential Consent Webhook And Secret Lifecycle](credential-consent-webhook-and-secret-lifecycle.md) | Manage client credentials, OAuth client metadata, secret rotation, compromised secret response, consent scopes, webhook subscriptions, callback endpoints, signing keys, event delivery health, replay requests, and revocation evidence for partner developers, security officers, platform operations, and API product managers. | TMF720, TMF672, TMF644, TMF681 plus portal extension APIs, IAM/gateway, eventing, test, usage, and partner handoffs. | Critical |
| [Production Certification Support And Version Migration](production-certification-support-and-version-migration.md) | Certify developer applications for production, manage production readiness evidence, support cases, incident/status communications, migration campaigns, deprecation exceptions, and version cutover tracking for partner developers, internal developers, API product managers, governance leads, platform operations, and security officers. | TMF704, TMF708, TMF707, TMF710 plus portal extension APIs, IAM/gateway, eventing, test, usage, and partner handoffs. | Critical |

## How To Use These Feature Specs

- Use the Developer Portal feature specs as the delivery source for API product lifecycle, developer onboarding, subscription approval, credentials, webhooks, sandbox, conformance, monetization, support, and version migration epics.
- Confirm every production-facing developer action has a portal owner, platform/IAM/gateway owner, source API owner, correlation ID, retry path, developer notification behavior, and audit evidence before implementation starts.
- Keep Developer Portal writes inside its private logical database for portal metadata, developer org/app/subscription state, sandbox configuration, approval evidence, analytics summaries, and migration/support workflow state; enforce runtime access only through platform-owned controls.

## Feature Detail Review Alignment (2026-06-14)

Source: [Suite Feature Detail Review](../../feature-detail-review.md) and [Critical Feature Review Enhancements](../modules-and-features.md#critical-feature-review-enhancements-2026-06-14).

The 2026-06-14 review upgrades this app feature set with required scope: API product lifecycle, developer production readiness, credentials, webhooks, conformance, version migration, quota and usage controls, and monetization evidence.

Apply this scope when refining the feature specifications in this folder:

- Add or update epics, stories, UI workbenches, APIs, events, app-owned data fields, DDL gaps, test cases, observability, runbooks, and definition-of-done evidence for the review scope.
- Preserve the app data ownership boundary. Cross-app access must use APIs, events, workflow tasks, governed projections, or certified data products rather than direct database sharing.
- If this scope needs technology beyond Angular, Spring Boot, PostgreSQL, and PrimeNG, offer open-source options with pros, cons, and a recommendation before implementation.
