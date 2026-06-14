# Digital, Partner, And Ecosystem Tech And UI Guidance

This document guides implementation of the Digital, Partner, And Ecosystem suite. It applies the shared [Technology Stack Guidance](../../technology-stack-guidance.md) and [TelcoSuite UI Design System](../../telcosuite-ui-design-system.md) to customer self-care, partner, marketplace, developer portal, Open Gateway, and ecosystem shared apps.

## Apps Covered

| App | Implementation focus |
| --- | --- |
| Customer Self-Care | Digital customer access, service view, order tracking, billing view, support, self-service change, and privacy center |
| Partner And Marketplace | Partner lifecycle, marketplace listings, partner offers, partner orders, Open Gateway operations, disputes, and payouts |
| Digital And Network Component Operations | Digital/network component operations, ecosystem service operations, and operational channel support |
| Developer And API Portal | Developer organizations, API products, subscriptions, credentials, sandbox, testing, analytics, and conformance |
| Ecosystem Shared Modules | Notifications, preferences, content, channel routing, portal utilities, and shared ecosystem support |

## Recommended Build Order

1. Ecosystem Shared Modules.
2. Customer Self-Care.
3. Developer And API Portal.
4. Partner And Marketplace.
5. Digital And Network Component Operations.

This order establishes shared notification, preference, content, and portal utilities before customer, developer, partner, marketplace, and operational ecosystem experiences.

## Suite Technology Posture

Use Angular, Spring Boot, and PostgreSQL as the default implementation stack. PostgreSQL should own digital session/draft state, partner lifecycle extensions, marketplace operations, developer portal metadata, subscriptions, preference state, notification templates, and portal support state according to app boundaries.

Digital and partner apps expose capabilities from BSS, OSS, and platform apps. They should not become alternate masters for customer, product, order, billing, inventory, assurance, or API runtime policy records. If portal, API, identity, notification, content, search, or analytics needs exceed the primary stack, present open source options with pros and cons and ask for a decision.

## Suite UI Posture

The suite should feel like polished enterprise self-service and ecosystem operations: simple enough for external users, powerful enough for partner managers, marketplace operators, support teams, and developers.

Use the same TelcoSuite shell for internal ecosystem operations. Customer, partner, and developer-facing portals may use adapted navigation, but must preserve TelcoSuite tokens, accessibility, theme support, responsive behavior, and configurable product identity.

## Shared Suite Components

| Shared pattern | Use across apps |
| --- | --- |
| Portal identity shell | Configurable product name, tenant/brand context, external-user navigation, and account controls |
| Customer service summary | Services, orders, bills, tickets, appointments, outages, and privacy status |
| Partner profile header | Partner status, onboarding stage, agreements, marketplace role, payout state, and support status |
| API product card | API name, version, subscription state, environment, quota, policy, documentation, and test status |
| Subscription and credential panel | Developer app, client credentials, scope, quota, consent, and rotation status |
| Notification preference panel | Channel, consent, quiet hours, language, template, and delivery state |
| Marketplace listing card | Offer, eligibility, publication state, partner owner, approval, and operational status |

## Standard Page Templates

Use TelcoSuite page templates consistently:

- List and workbench for customers, partners, developer apps, API products, subscriptions, marketplace listings, notifications, and support cases.
- Record detail for customer portal context, partner, marketplace listing, API product, developer app, subscription, notification template, and ecosystem support records.
- Wizard or guided flow for onboarding, API subscription, credential creation, marketplace submission, partner offer review, and self-service change.
- Dashboard for portal adoption, API usage, partner operations, marketplace performance, notification delivery, and support health.
- Configuration pages for portal branding, content, preferences, notification templates, API products, partner policies, and marketplace rules.

## Data, API, And Integration Guidance

- Consume BSS, OSS, and platform records through APIs, events, governed projections, or data products.
- Keep submitted self-service actions, partner actions, and developer actions traceable to owning domain apps.
- Publish lifecycle events for portal sessions, submissions, partner lifecycle, marketplace listing state, API subscription state, credential events, notification delivery, and ecosystem support.
- Enforce consent, privacy, tenant, brand, market, language, accessibility, and data-residency controls for external users.
- Avoid duplicating customer, product, order, billing, inventory, assurance, or API runtime policy master data.

## Candidate Extra Technology Decision Areas

These categories may require a decision when implementation starts:

| Need | Why it may arise | Decision rule |
| --- | --- | --- |
| Portal content management | Help, documentation, marketplace content, onboarding guides | Prefer app-managed content first; ask before adding CMS technology. |
| API gateway and developer runtime | API products, subscriptions, credentials, quotas, policies, analytics | Coordinate with platform suite; ask before adding runtime technology. |
| Identity and federation | Customer, partner, developer, delegated admin, OAuth/OIDC, MFA | Use platform IAM where possible; ask before adding identity products. |
| Notification delivery | Email, SMS, push, webhook, preference, delivery evidence | Ask before adding notification infrastructure. |
| Search and recommendation | Marketplace, API catalog, support, knowledge, offers | Start with PostgreSQL/search projections; ask before adding a search engine. |

## App Readiness Checklist

- Uses shared portal identity, customer summary, partner profile, API product, credential, notification, and marketplace patterns.
- Defines app-owned digital, partner, developer, and ecosystem state without duplicating domain masters.
- Provides responsive portal workflows for customer, partner, developer, and internal operations users.
- Maintains configurable product name, branding, theme, palette, language, and accessibility settings.
- Tracks submitted actions through owning domain apps and displays authoritative downstream state.
- Applies consent, privacy, tenant, brand, market, masking, and external-user security controls.
- Documents any non-primary technology need with open source options, pros and cons, and a decision request.
