# Partner And Marketplace App

## Purpose

Manage partners, resellers, channel partners, API consumers, suppliers, marketplace providers, partner offers, partner orders, marketplace operations, Open Gateway usage, partner settlement, and partner support.

## Primary Personas

- Partner manager: owns partner onboarding, lifecycle, agreements, certification, and performance.
- Reseller/channel partner: sells, orders, tracks, and supports services.
- Marketplace provider: publishes offers and tracks listing performance.
- Partner finance user: reconciles usage, revenue sharing, settlement, and disputes.
- Partner support user: resolves onboarding, API, order, usage, and settlement issues.

## Core Workflow

1. Onboard partner with legal entity, roles, agreements, documents, identity, approval, and certification.
2. Approve partner offers and publish to catalog or marketplace.
3. Accept partner-submitted orders, reseller orders, marketplace orders, and Open Gateway onboarding/order flows.
4. Track partner-visible fulfillment status, fallout, usage, and settlement.
5. Resolve partner support issues, disputes, and operational escalations.

## Module Capability Matrix

| Module | Detailed Capabilities | Related APIs |
| --- | --- | --- |
| Partner Onboarding | Onboard partners, resellers, channel partners, API consumers, suppliers, and marketplace providers. Manage profile, legal entity, roles, agreements, identity, access, documents, approval, certification, status, suspension, termination, and renewal. | [TMF632](../../../references/tmforum-open-apis/openapi-specs/TMF632_PartyManagement), [TMF669](../../../references/tmforum-open-apis/openapi-specs/TMF669_PartyRole), [TMF668](../../../references/tmforum-open-apis/openapi-specs/TMF668_PartnershipType), [TMF651](../../../references/tmforum-open-apis/openapi-specs/TMF651_AgreementManagement), [TMF720](../../../references/tmforum-open-apis/openapi-specs/TMF720_DigitalIdentity), [TMF667](../../../references/tmforum-open-apis/openapi-specs/TMF667_Document) |
| Partner Catalog And Offer | Allow partners to publish and manage product/service offers. Validate commercial, technical, billing, and compliance rules. Manage catalog syndication, versioning, approval, publication, and retirement. | [TMF620](../../../references/tmforum-open-apis/openapi-specs/TMF620_ProductCatalog), [TMF936](../../../references/tmforum-open-apis/openapi-specs/TMF936_OperateProductCatalog), [TMF633](../../../references/tmforum-open-apis/openapi-specs/TMF633_ServiceCatalog) |
| Partner Ordering | Support partner-submitted orders, reseller orders, marketplace purchases, Open Gateway onboarding/order flows, validation, fulfillment status, fallout, cancellation, partner milestones, APIs, and portal views. | [TMF622](../../../references/tmforum-open-apis/openapi-specs/TMF622_ProductOrder), [TMF931](../../../references/tmforum-open-apis/openapi-specs/TMF931_OpenGatewayOnboardingAndOrderingComponentSuite), [TMF641](../../../references/tmforum-open-apis/openapi-specs/TMF641_ServiceOrder) |
| Marketplace Operations | Manage marketplace listings, categories, partner products, approvals, lifecycle, merchandising, publication, listing performance, availability, ordering outcomes, and customer/partner experience. | [TMF620](../../../references/tmforum-open-apis/openapi-specs/TMF620_ProductCatalog), [TMF668](../../../references/tmforum-open-apis/openapi-specs/TMF668_PartnershipType), [TMF699](../../../references/tmforum-open-apis/openapi-specs/TMF699_Sales) |
| Partner Usage And Settlement | Track partner product usage, Open Gateway usage, transaction records, revenue sharing, settlement periods, reports, reconciliation, dashboards, disputes, adjustments, and approvals. | [TMF937](../../../references/tmforum-open-apis/openapi-specs/TMF937_OpenGatewayProductUsage), [TMF635](../../../references/tmforum-open-apis/openapi-specs/TMF635_UsageManagement), [TMF736](../../../references/tmforum-open-apis/openapi-specs/TMF736_RevenueSharingAlgorithmManagement), [TMF737](../../../references/tmforum-open-apis/openapi-specs/TMF737_RevenueSharingReportManagement), [TMF738](../../../references/tmforum-open-apis/openapi-specs/TMF738_RevenueSharingModelManagement) |
| Partner Support | Manage service requests, onboarding issues, API issues, operational tickets, settlement disputes, escalation, communication, and links to partner accounts/APIs/orders/usage/revenue reports. | [TMF621](../../../references/tmforum-open-apis/openapi-specs/TMF621_TroubleTicket), [TMF681](../../../references/tmforum-open-apis/openapi-specs/TMF681_Communication) |

## Data Ownership

Owns partner profile operational state, partner lifecycle, marketplace listings, partner offer workflow state, partner order visibility, Open Gateway partner operations state, and partner support records. Core product catalog and product order records are delegated to BSS where appropriate.

## First Release Scope

Deliver partner onboarding, partner catalog approval, partner order view, marketplace listing, partner usage report, and support ticketing. Add advanced settlement automation and partner certification workflows later.

