# Digital, Partner, And Ecosystem Architecture Diagrams

Reviewed: 2026-06-14

## Purpose

Use these diagrams when building the Digital, Partner, And Ecosystem suite and its apps. They show how digital channels, partner marketplace operations, developer/API portal, component operations, and shared channel/notification modules consume BSS/OSS/platform APIs while owning their own experience, partner, subscription, credential, component, and notification lifecycle records.

Primary sources:

- [Implementation File Usage Guide](implementation-file-usage-guide.md)
- [Tech And UI Guidance](tech-and-ui-guidance.md)
- [Data Model](data-model.md)
- [Journey Coverage](journey-coverage.md)
- App `implementation-file-usage.md`, `README.md`, `modules-and-features.md`, `personas-and-user-journeys.md`, and `features/` detail packs
- [TMF API To DDL Traceability Matrix](../tmf-api-to-ddl-traceability-matrix.md)
- `database/postgres/suites/ts_digital_partner_ecosystem/`

## Suite Architecture

```mermaid
flowchart LR
  subgraph Channels["Digital And Ecosystem Channels"]
    Customer["Customers, enterprise admins, users, and authorized delegates"]
    PartnerUser["Partners, resellers, marketplace sellers, offnet providers"]
    Developer["Developers, API subscribers, sandbox users"]
    ComponentOps["Digital, NaaS, IoT, and component operations teams"]
  end

  subgraph Suite["Digital, Partner, And Ecosystem Suite"]
    SelfCare["Customer Self-Care"]
    Partner["Partner And Marketplace"]
    Components["Digital And Network Component Operations"]
    DevPortal["Developer And API Portal"]
    Shared["Ecosystem Shared Modules"]
  end

  subgraph APIs["Suite API And Event Contracts"]
    TMF["TMF APIs: TMF620, TMF621, TMF622, TMF629, TMF632, TMF644, TMF668, TMF681, TMF704, TMF705, TMF706, TMF707, TMF708, TMF710, TMF720, TMF910, TMF914, partner TMFs"]
    Extensions["Extension APIs for experience state, marketplace operations, subscriptions, certification, component health, credentials, webhooks, quotas, and notifications"]
    Events["Digital profile, self-service order, partner lifecycle, marketplace, developer subscription, credential, webhook, component, quota, notification, and certification events"]
  end

  subgraph Data["ts_digital_partner_ecosystem"]
    SelfCareDB["customer_self_care schema"]
    PartnerDB["partner_marketplace schema"]
    ComponentsDB["digital_network_components schema"]
    DevPortalDB["developer_api_portal schema"]
    SharedDB["ecosystem_shared schema"]
  end

  subgraph SourceDomains["Source Domains And Platforms"]
    BSS["Customer, catalog, CPQ, order, billing, usage, risk"]
    OSS["Inventory, fulfillment, field, assurance, SLA"]
    Enterprise["API platform, identity, policy, workflow, security, data, test"]
    External["Payment providers, partners, offnet systems, IoT platforms, API consumers"]
  end

  Customer --> SelfCare
  PartnerUser --> Partner
  Developer --> DevPortal
  ComponentOps --> Components
  Shared --> SelfCare
  Shared --> Partner
  Shared --> DevPortal

  SelfCare --> BSS
  SelfCare --> OSS
  Partner --> BSS
  Partner --> OSS
  DevPortal --> Enterprise
  Components --> OSS
  Components --> Enterprise

  Suite --> TMF
  Suite --> Extensions
  Suite --> Events

  SelfCare --> SelfCareDB
  Partner --> PartnerDB
  Components --> ComponentsDB
  DevPortal --> DevPortalDB
  Shared --> SharedDB

  Events --> Enterprise
  External --> Partner
  External --> DevPortal
  External --> Components
```

## Suite Build Flow

```mermaid
sequenceDiagram
  autonumber
  participant User as Customer, partner, or developer
  participant Shared as Ecosystem Shared Modules
  participant SelfCare as Customer Self-Care
  participant Partner as Partner And Marketplace
  participant DevPortal as Developer And API Portal
  participant Components as Component Operations
  participant BSS as BSS Commercial APIs
  participant OSS as OSS APIs
  participant Platform as API/Eventing, identity, workflow, test

  User->>Shared: Resolve channel, preferences, notification, locale, and brand context
  User->>SelfCare: View profile, products, orders, appointments, bills, usage, tickets
  SelfCare->>BSS: Query customer, catalog, CPQ, order, billing, usage, care records
  SelfCare->>OSS: Query inventory, appointment, fulfillment, outage, and trouble state
  User->>Partner: Onboard partner, manage offers, orders, support, usage, settlement
  Partner->>BSS: Use catalog, order, settlement, support, and agreement APIs
  User->>DevPortal: Subscribe to APIs, use sandbox, manage credentials and webhooks
  DevPortal->>Platform: Use API registry, gateway, contract, quota, and certification services
  Components->>OSS: Operate NaaS, IoT, self-care, slice/QoS, and component lifecycle
  Suite->>Platform: Publish channel, partner, subscription, component, and notification events
```

## App Architecture: Customer Self-Care

```mermaid
flowchart LR
  Inputs["Customer/account, identity, consent, products, services, orders, appointments, bills, payments, usage, tickets, outages, privacy, device/SIM/eSIM state"]
  UI["Profile and access, product/service view, digital sales/change, order/appointment tracking, bill/payment/usage, support/ticket, privacy center"]
  API["TMF629/TMF632/TMF720/TMF644/TMF672/TMF637/TMF638/TMF620/TMF679/TMF645/TMF680/TMF648/TMF663/TMF622/TMF646/TMF678/TMF676/TMF677/TMF621 APIs"]
  Domain["Customer profile/access, product/service view, digital sales/change, order and appointment tracking, billing/payment/usage, support/trouble ticket, MACD self-service, device/SIM/eSIM returns"]
  Data["customer_self_care schema: experience profile state, channel sessions, self-service drafts, tracking snapshots, support context, privacy center evidence, event_outbox"]
  Consumers["BSS/OSS source apps, notification, care, analytics, fraud/security, workflow"]
  Tests["Journey E2E, delegated admin, identity recovery, privacy, payment, order tracking, outage compensation, masking, accessibility tests"]

  Inputs --> UI --> API --> Domain --> Data
  Data --> Consumers
  Domain --> Tests
```

## App Architecture: Partner And Marketplace

```mermaid
flowchart LR
  Inputs["Partner party/role, agreements, KYC/tax/payee, catalog/offers, marketplace content, partner orders, usage, settlement, support, offnet capacity"]
  UI["Partner onboarding, KYC/tax/payee workflow, catalog/offer workbench, partner ordering, marketplace operations, usage/settlement, support queue"]
  API["TMF632/TMF669/TMF668/TMF651/TMF720/TMF667/TMF620/TMF936/TMF633/TMF622/TMF931/TMF641/TMF699/TMF937/TMF635/TMF736/TMF737/TMF738/TMF621/TMF681 APIs"]
  Domain["Partner onboarding, partner agreement/KYC/tax/payee, partner catalog/offer, partner ordering, marketplace operations, partner usage/settlement, support, certification/offnet/compliance"]
  Data["partner_marketplace schema: partner lifecycle, onboarding evidence, agreements, marketplace listings, partner orders, support cases, usage/settlement views, event_outbox"]
  Consumers["BSS catalog/order/settlement, OSS fulfillment/offnet, developer portal, self-care, finance, compliance"]
  Tests["Partner lifecycle, KYC, agreement, marketplace content quality, partner order, return/dispute/payout, settlement reconciliation, compliance tests"]

  Inputs --> UI --> API --> Domain --> Data
  Data --> Consumers
  Domain --> Tests
```

## App Architecture: Digital And Network Component Operations

```mermaid
flowchart LR
  Inputs["Self-care components, NaaS components, IoT agents/devices/services, network slice/QoS, edge/cloud, OTA, packaging, health, rollback, metering"]
  UI["Component health board, dependency map, rollout/rollback console, IoT device/service operations, slice/QoS metering, edge/cloud data sovereignty view"]
  API["TMF910/TMF909/TMF620/TMF641/TMF638/TMF640/TMF908/TMF637/TMF639/TMF914/TMF622/TMF635/TMF621 APIs"]
  Domain["Self-care component operations, NaaS component operations, IoT agent/device operations, IoT service operations, network slice/QoS/metering, edge/cloud/OTA/data sovereignty"]
  Data["digital_network_components schema: components, packages, dependencies, health, rollout/rollback, IoT agents/devices, slices, metering, sovereignty evidence, event_outbox"]
  Consumers["OSS fulfillment, inventory, assurance, developer portal, marketplace, self-care, data products"]
  Tests["Component dependency, health, rollback, package, OTA, IoT lifecycle, slice/QoS, data sovereignty, metering tests"]

  Inputs --> UI --> API --> Domain --> Data
  Data --> Consumers
  Domain --> Tests
```

## App Architecture: Developer And API Portal

```mermaid
flowchart LR
  Inputs["API registry, OpenAPI contracts, products, plans, quotas, developer identity, apps, subscriptions, credentials, webhooks, sandbox, certification, analytics"]
  UI["API catalog, developer onboarding, app/subscription manager, sandbox/mock console, credential/webhook lifecycle, analytics/health, certification workflow"]
  API["TMF720/TMF672/TMF668/TMF704/TMF706/TMF705/TMF628/TMF657/TMF708/TMF707/TMF710 APIs plus portal and API product extensions"]
  Domain["API catalog, developer onboarding/subscription, sandbox/mock API, analytics/health, governance/conformance, monetization/plans/quotas, credential/consent/webhook/secret lifecycle, certification/version migration"]
  Data["developer_api_portal schema: developers, apps, subscriptions, API products, plans, quotas, credentials, webhooks, sandbox data, certification results, event_outbox"]
  Consumers["API gateway, integration/eventing platform, partner marketplace, test lab, security, billing/monetization, external developers"]
  Tests["API contract, subscription approval, credential rotation, webhook retry, quota/metering, sandbox, certification, migration, security tests"]

  Inputs --> UI --> API --> Domain --> Data
  Data --> Consumers
  Domain --> Tests
```

## App Architecture: Ecosystem Shared Modules

```mermaid
flowchart LR
  Inputs["Brand, market, channel, language, tenant, customer/partner preferences, templates, consent, campaign/order/ticket/appointment/bill/outage triggers"]
  UI["Channel experience configuration, notification template manager, preference center support, delivery tracking, campaign and operational notification controls"]
  API["TMF620/TMF681/TMF644 APIs plus channel configuration, preference, template, and delivery tracking extensions"]
  Domain["Channel experience, notification and preference, delivery tracking, template lifecycle, opt-out behavior, release coordination"]
  Data["ecosystem_shared schema: channel configuration, experience variants, preference snapshots, templates, notification attempts, delivery evidence, event_outbox"]
  Consumers["Self-care, partner, developer portal, marketing, order, billing, assurance, platform notifications"]
  Tests["Preference/consent, template versioning, quiet hours, delivery retry, channel variant, localization, masking, accessibility tests"]

  Inputs --> UI --> API --> Domain --> Data
  Data --> Consumers
  Domain --> Tests
```

## Build Use

Use these diagrams to keep digital apps honest about source-of-truth boundaries. Customer Self-Care and Partner/Marketplace can own experience and partner workflow state, but customer, order, billing, inventory, fulfillment, and assurance corrections must go back through the owning BSS/OSS APIs.
