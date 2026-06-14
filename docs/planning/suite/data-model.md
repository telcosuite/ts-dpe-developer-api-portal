# Digital, Partner, And Ecosystem Data Model

This document defines the suite-level data model for Digital, Partner, And Ecosystem. It translates the product-suite data mastery decisions into one PostgreSQL suite database with app-owned schemas and TMF-aligned entity ownership.

## Suite Database Layout

Physical database: `ts_digital_partner_ecosystem`

| App | Owning schema | Primary data role |
| --- | --- | --- |
| Customer Self-Care | `customer_self_care` | Digital session, draft action, experience telemetry, self-service submission state |
| Partner And Marketplace | `partner_marketplace` | Partner lifecycle extension, onboarding, marketplace listing, partner disputes, Open Gateway flow state |
| Digital And Network Component Operations | `digital_network_components` | Self-care, NaaS, IoT, and digital component operations state |
| Developer And API Portal | `developer_api_portal` | Developer orgs, apps, API product publication metadata, subscriptions, credential request references, sandbox/conformance state |
| Ecosystem Shared Modules | `ecosystem_shared` | Notification templates, preferences, channel routing, portal content, support utilities |

## Data Modeling Rules

- Digital apps own experience state, drafts, submissions, partner lifecycle extensions, portal metadata, and ecosystem workflow state.
- They do not master customer, product, order, bill, inventory, assurance, or API runtime policy records owned by other suites.
- Submitted customer, partner, and developer actions must link to the authoritative downstream app record after submission.
- External-facing records require tenant, brand, language, market, consent, data-residency, accessibility, and masking metadata.
- Partner and developer data must distinguish party/customer master references from partner/developer lifecycle extensions.

## Entity Mastery Matrix

| Entity family | Master app | Owning schema | TMF API anchors | Main consumers | Data role |
| --- | --- | --- | --- | --- | --- |
| Self-care experience state | Customer Self-Care | `customer_self_care` | Customer-facing BSS/OSS APIs | Digital support, analytics | Experience master |
| Customer-entered draft action | Customer Self-Care | `customer_self_care` | TMF622, TMF663, TMF621 | Order, sales, NOC, care | Draft before submission |
| Self-care submitted action reference | Customer Self-Care | `customer_self_care` | TMF622, TMF663, TMF621 | Customer, order, assurance | Submission trace |
| Partner operational profile and lifecycle | Partner And Marketplace | `partner_marketplace` | TMF632, TMF669, TMF668, TMF651, TMF720, TMF667 | Product, settlement, developer, support | Master lifecycle extension |
| Partnership type and onboarding state | Partner And Marketplace | `partner_marketplace` | TMF668 | Partner ops, compliance | Master |
| Partner catalog submission state | Partner And Marketplace | `partner_marketplace` | TMF620, TMF936, TMF633 | Product And Offer Studio | Workflow state |
| Marketplace listing | Partner And Marketplace | `partner_marketplace` | TMF620, TMF668, TMF699 | Customer self-care, partner portal, product | Master listing context |
| Partner order visibility state | Partner And Marketplace | `partner_marketplace` | TMF622, TMF931, TMF641 | Partner portal, support | Partner-facing projection |
| Open Gateway onboarding/order operations state | Partner And Marketplace | `partner_marketplace` | TMF931 | Developer, partner, API platform | Master flow state |
| Open Gateway product usage view | Partner And Marketplace | `partner_marketplace` | TMF937, TMF635 | Partner, settlement, support | Partner-facing projection |
| Partner support record | Partner And Marketplace | `partner_marketplace` | TMF621, TMF681 | NOC, care, partner ops | Master partner support context |
| Self-care component definition | Digital And Network Component Operations | `digital_network_components` | TMF910 | Customer self-care, operations | Master component packaging |
| IoT/NaaS component operations state | Digital And Network Component Operations | `digital_network_components` | TMF908, TMF914 | Partner, operations, assurance | Master digital component state |
| API product catalog metadata for developers | Developer And API Portal | `developer_api_portal` | Cross-cutting APIs | Developers, partners, API platform | Portal publication metadata; API contract source remains platform-owned |
| Developer organization and developer application | Developer And API Portal | `developer_api_portal` | TMF720, TMF672, TMF668 | API platform, partner, security | Master portal business context |
| API subscription | Developer And API Portal | `developer_api_portal` | TMF720, TMF672, TMF668 | API platform, security, partner | Master subscription lifecycle and approval state |
| Sandbox/mock scenario | Developer And API Portal | `developer_api_portal` | TMF704, TMF705, TMF706 | Test lab, partner, API platform | Master developer-facing sandbox configuration |
| API analytics summary for portal consumers | Developer And API Portal | `developer_api_portal` | TMF628, TMF657 | Developers, partners, API platform | Portal summary projection |
| Notification template and preference view | Ecosystem Shared Modules | `ecosystem_shared` | TMF681, TMF644 | Customer, partner, self-care, marketing | Master ecosystem utility |
| Channel routing and portal content | Ecosystem Shared Modules | `ecosystem_shared` | TMF681, TMF683, TMF688 | Digital, partner, developer | Master utility/config |

## Schema-Ready App Physical Design

Candidate table names are starter names for app migrations. Each app must validate exact TMF API version, resource, operation, and field paths against `references/tmforum-open-apis/openapi-specs/` before creating DDL.

| Owning schema | Starter table groups and candidate tables | Key and relationship rules | Controls and storage notes |
| --- | --- | --- | --- |
| `customer_self_care` | Customer experience: `digital_session`, `selfcare_experience_state`, `customer_draft_action`, `submitted_action_reference`, `interaction_telemetry`, `portal_projection_cache`, `event_outbox` | Drafts use local IDs until submitted. Submitted references store downstream BSS/OSS canonical IDs, source app, source API/event, freshness, and permission scope. | External-facing PII must include tenant, brand, market, language, accessibility, consent, masking, and retention metadata. |
| `partner_marketplace` | Partner lifecycle and marketplace: `partner_profile_extension`, `partnership_type`, `partner_onboarding_state`, `partner_catalog_submission`, `marketplace_listing`, `partner_order_visibility_state`, `open_gateway_flow_state`, `open_gateway_usage_view`, `partner_support_record`, `event_outbox` | Partner records reference canonical party/party-role/account IDs from BSS. Marketplace listings reference accepted product offers; submissions remain workflow state until accepted. | Partner contractual and support evidence needs retention, approval, certification, and dispute history. |
| `digital_network_components` | Digital component operations: `selfcare_component_definition`, `naas_component_state`, `iot_agent_device_component_state`, `iot_service_component_state`, `component_operation`, `event_outbox` | Component records reference catalog, order, service/resource inventory, usage, and support IDs without mastering those domain records. | Version component definitions and preserve operational state transitions and customer/partner exposure rules. |
| `developer_api_portal` | Developer experience: `developer_organization`, `developer_application`, `api_product_publication_metadata`, `api_subscription`, `credential_request_reference`, `sandbox_mock_scenario`, `portal_api_analytics_summary`, `certification_state`, `event_outbox` | Portal owns developer app/subscription business context. API contracts, gateway policy, credentials, raw API metrics, and delivery attempts remain platform-owned and are referenced. | Developer data needs tenant, partner, policy, consent, secret-reference, approval, certification, and revocation history. |
| `ecosystem_shared` | Channel utilities: `notification_template`, `channel_preference_overlay`, `channel_route`, `feature_flag`, `portal_content`, `notification_delivery_reference_view`, `event_outbox` | Templates and preference overlays reference customer consent/privacy from BSS. Delivery attempts are platform-owned references, not ecosystem master records. | Store language, accessibility, channel eligibility, suppression, retention, and publication state for externally visible content/config. |

## Consumed Cross-Suite Data

| Source suite/app | Consumed data | Storage rule |
| --- | --- | --- |
| BSS Commercial | Customer, product, offer, cart, order, bill, payment, usage, consent | Store portal projections, drafts, and submitted references only |
| OSS Engineering, Inventory, And Fulfillment | Service/resource inventory, fulfillment state, appointments | Store customer/partner-facing projections only |
| OSS Operations And Assurance | Tickets, incidents, outages, maintenance, service quality | Store portal-facing projections and support references |
| Enterprise Platform, Data, And Governance | API contracts, gateway policy, credentials, notification delivery attempts, identity, tests, analytics | Store portal metadata, source references, and summaries only |

## TMF Compliance Rules

- Use TMF622, TMF663, and TMF621 for submitted customer actions involving orders, carts, and tickets.
- Use TMF632, TMF669, TMF668, TMF651, TMF720, and TMF667 for partner identity, role, agreement, credential, and document references.
- Use TMF931, TMF936, and TMF937 for Open Gateway onboarding, product catalog, and usage views when available.
- Use TMF720, TMF672, and TMF668 for developer organizations, applications, and API subscriptions; platform-owned API contracts and gateway policies remain references.
- Use TMF704, TMF705, and TMF706 for developer-facing sandbox/mock scenario configuration, with formal test assets mastered by Test And Certification Lab.
- Use TMF681, TMF683, and TMF644 for communication, interaction, notification, preference, and consent-related records.

## Events And Projections

- Publish events for digital draft submitted, self-care action linked, partner onboarding changed, marketplace listing changed, API subscription changed, credential request reference changed, sandbox certification changed, notification preference changed, and portal content changed.
- Each event must be registered with event name/version, event key, payload basis, outbox table, known consumers, replay retention, and masking controls before implementation.
- Digital projections must keep source app, source ID, source event/API, display freshness, and permission scope.
- Submitted actions must receive and store downstream authoritative IDs once accepted by owning domain apps.

## App-Level Data Model Checklist

- External-facing data includes tenant, brand, language, market, consent, privacy, and accessibility metadata.
- Candidate tables, primary keys, alternate identifiers, cross-app reference fields, and migration owner must be recorded before creating migrations.
- Each app must maintain TMF conformance, event contract, and privacy/retention/audit registers for every table group.
- Digital/partner/developer records do not become shadow customer, product, order, bill, inventory, or assurance masters.
- Drafts and submissions are separated from downstream authoritative records.
- Portal projections have freshness, source, and permission metadata.
- Partner and developer lifecycle extensions reference canonical party/user/account IDs.
