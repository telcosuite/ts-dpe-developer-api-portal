# Digital, Partner, And Ecosystem Feature Detail Review

Reviewed: 2026-06-14

## Purpose

This document records the critical Suite 05 feature review across all Digital, Partner, And Ecosystem apps. It explains what is already strong, what still needed app-level build guidance, and what was enhanced before implementation starts.

## Review Inputs

| Input | How it was used |
| --- | --- |
| [Suite Data Model](data-model.md) | Checked source-of-truth boundaries for self-care state, partner lifecycle, developer portal metadata, component operations, notifications, preferences, and portal content. |
| [Suite Tech And UI Guidance](tech-and-ui-guidance.md) | Checked external portal posture, TelcoSuite consistency, responsive behavior, and open-source decision points. |
| [Implementation File Usage Guide](implementation-file-usage-guide.md) | Checked V001/V002+ migration use, TMF reviews, event contracts, privacy/audit controls, and app build workflow. |
| [Suite Journey Coverage](journey-coverage.md) | Checked digital customer lifecycle, API product to monetized usage, and partner marketplace order to payout journeys. |
| [Suite Gap Review](../../suite-gap-reviews/05-digital-partner-ecosystem-gap-review.md) | Confirmed detailed feature gaps already closed in feature specs and promoted the remaining app-level controls into module guidance. |
| App `modules-and-features.md` files | Reviewed every app module baseline and added app-specific critical build guidance. |
| App `personas-and-user-journeys.md` files | Checked customer, partner, developer, component operations, and channel/governance personas. |
| App feature specification files | Confirmed detailed acceptance criteria, negative scenarios, TMF anchors, extension APIs, NFRs, observability, and test approach exist for core features. |
| TMF API to DDL review files | Checked TMF payload compatibility, app-owned schemas, event registers, privacy/audit baselines, and remaining endpoint contract test gates. |

## Critical Findings

| Area | Finding | Action taken |
| --- | --- | --- |
| App-level usability | Detailed feature specs are strong, but app-level module docs were still too generic for builders starting from the app folder. | Added concise critical enhancement sections to every Suite 05 app module file. |
| Source-of-truth boundaries | Digital, partner, and developer apps must not become shadow masters for customer, product, order, billing, inventory, assurance, identity, gateway runtime, or notification delivery attempts. | Added explicit app mastery and projection rules in each app enhancement. |
| External-user trust | Customer, partner, developer, and marketplace experiences need source freshness, permission scope, consent, masking, accessibility, localization, and escalation routes. | Added required screens and controls for trust center, contact decisions, readiness scorecards, and evidence views. |
| Money and commercial risk | Marketplace payout, partner settlement, API monetization, compensation, refunds, and disputes need auditable ledgers and hold/release controls. | Added settlement, payout hold, usage reconciliation, and dispute evidence requirements. |
| Production operations | Developer APIs, components, NaaS, IoT, notifications, and channel releases need runtime health, versioning, rollback, certification, and observability. | Added production readiness, webhook/credential, component dependency, OTA safety, and channel release gates. |
| TMF caveat | Partner Marketplace references TMF937, but the local TMF937 folder has no exact spec file in the current reference set. | Added a build-time warning to validate or add the TMF937 spec before exposing TMF937 endpoints. |

## App Review Summary

| App | Critical enhancement focus | Updated file |
| --- | --- | --- |
| Customer Self-Care | Cross-feature journey resume, customer trust center, assisted digital handoff, source freshness, accessibility, privacy, and payment/support recovery. | [customer-self-care/modules-and-features.md](customer-self-care/modules-and-features.md) |
| Partner And Marketplace | Partner risk/compliance scorecard, KYC/tax/payee gating, off-net readiness, marketplace quality, payout holds, settlement disputes, and TMF937 caveat. | [partner-and-marketplace/modules-and-features.md](partner-and-marketplace/modules-and-features.md) |
| Developer And API Portal | API product lifecycle, developer production readiness, credentials, webhooks, conformance, version migration, quota/usage, and monetization evidence. | [developer-api-portal/modules-and-features.md](developer-api-portal/modules-and-features.md) |
| Digital And Network Component Operations | Component dependency graph, package/version governance, NaaS/slice lifecycle, IoT fleet/OTA safety, metering assurance, and rollback. | [digital-network-component-operations/modules-and-features.md](digital-network-component-operations/modules-and-features.md) |
| Ecosystem Shared Modules | Contact decision service, notification suppression/delivery, consent and preference overlays, channel release governance, accessibility/localization, and feature flag rollback. | [ecosystem-shared-modules/modules-and-features.md](ecosystem-shared-modules/modules-and-features.md) |

## Suite 05 Build Implications

1. Build Ecosystem Shared Modules first so notification, preference, content, channel, feature flag, and contact-decision rules are reusable.
2. Build Customer Self-Care around complete customer jobs, not siloed pages; every view needs source freshness, next action, and escalation route.
3. Build Developer And API Portal with production readiness and gateway/platform handoff controls from day one.
4. Build Partner And Marketplace with compliance, settlement, payout, off-net, and marketplace quality gates before partner-facing scale.
5. Build Digital And Network Component Operations only with explicit component owner, dependency, version, telemetry, rollback, and metering rules.
6. Keep API gateway, IAM, notification infrastructure, search, CMS, workflow, object storage, and observability technology choices open-source and decision-based; do not force them before the primary Angular/Spring Boot/PostgreSQL stack proves insufficient.

## Remaining Build-Time Questions

| Question | Why it must be decided during implementation |
| --- | --- |
| Should customer self-care use a separate journey orchestration service? | PostgreSQL-backed draft/submission state may be enough initially; cross-channel resume and care handoff may justify workflow technology later. |
| Which IAM and federation capabilities are platform-owned versus portal-owned? | Suite 05 must reference identity and credential runtime safely without duplicating platform IAM master records. |
| Does the developer portal need a dedicated API gateway or only platform integration? | Runtime enforcement, quotas, policies, analytics, and credentials should remain platform-owned unless an explicit open-source gateway decision is made. |
| Is a notification delivery engine required in release 1? | Ecosystem Shared can master templates/preferences first, but delivery scale, failover, and evidence may require dedicated infrastructure. |
| Is marketplace/API/component search beyond PostgreSQL needed? | Start with PostgreSQL projections and full-text search; ask before adding OpenSearch or another open-source search engine. |
| How will TMF937 be validated? | The local TMF937 folder currently lacks an exact spec file; endpoint exposure needs the spec or a documented compliant contract before build. |

## Recommendation

Suite 05 is strong at detailed feature-spec level and now stronger at app-start level. During build, use the app feature specs for story-level acceptance criteria, use the enhanced module docs for cross-feature operating controls, and keep all technology additions open-source, justified, and explicitly approved.
