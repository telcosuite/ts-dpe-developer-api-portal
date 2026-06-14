# Ecosystem Shared Modules

## Purpose

Provide shared channel experience and notification/preference capabilities used by customer self-care, partner portal, marketplace, developer portal, and embedded ecosystem channels.

## Primary Personas

- Channel product owner: configures web, mobile, partner, retail, contact center, and embedded channel behavior.
- Marketing/campaign user: coordinates notifications and channel-specific presentation.
- Partner manager: controls partner-facing content and feature access.
- Customer experience owner: manages personalization and journey consistency.
- Compliance user: ensures preferences and privacy rules are enforced.

## Core Workflow

1. Configure channel policies, feature flags, content, journeys, personalization, and presentation rules.
2. Coordinate release of channel features across BSS, OSS, partner, and platform dependencies.
3. Manage notification templates, preferences, delivery tracking, and opt-out behavior.
4. Trigger notifications for orders, tickets, appointments, bills, payments, outages, changes, partner activity, and API events.

## Module Capability Matrix

| Module | Detailed Capabilities | Related APIs |
| --- | --- | --- |
| Channel Experience | Manage channel-specific policies, content, feature flags, journeys, personalization, presentation rules, web/mobile/retail/contact center/partner/API channel variants, and release coordination. | [TMF620](../../../references/tmforum-open-apis/openapi-specs/TMF620_ProductCatalog), [TMF681](../../../references/tmforum-open-apis/openapi-specs/TMF681_Communication) |
| Notification And Preference | Manage customer and partner notification preferences, templates, delivery tracking, campaigns, opt-out behavior, and notifications for orders, tickets, appointments, bills, payments, outages, and changes. | [TMF681](../../../references/tmforum-open-apis/openapi-specs/TMF681_Communication), [TMF644](../../../references/tmforum-open-apis/openapi-specs/TMF644_Privacy) |

## Data Ownership

Owns channel configuration, feature flags, presentation rules, notification templates, delivery-state summaries, and channel-level preference overlays. Legal privacy consent remains mastered by Customer And Party 360.

## First Release Scope

Deliver shared notification templates, preference enforcement hooks, feature flags, and channel configuration. Add personalization studio and channel experimentation later.

