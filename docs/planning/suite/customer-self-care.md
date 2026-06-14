# Customer Self-Care App

## Purpose

Give residential and business customers secure digital access to profile, products, services, orders, appointments, shipments, bills, payments, usage, tickets, outages, diagnostics, and change actions.

## Primary Personas

- Residential customer: manages personal services, payments, usage, orders, and support.
- Business customer admin: manages users, accounts, products, sites, orders, and tickets for an organization.
- Care deflection owner: designs digital flows that reduce assisted support.
- Digital product owner: manages self-care journeys and experience metrics.
- Accessibility/compliance user: ensures consent, privacy, and communication behavior follows policy.

## Core Workflow

1. Authenticate customer or business admin and resolve account access rights.
2. Show profile, products, services, devices, contracts, orders, bills, usage, payments, and support state.
3. Let customers buy, change, move, suspend, resume, disconnect, schedule, pay, top up, download, and raise support requests.
4. Surface outage, service status, diagnostics, and ticket status.
5. Trigger notifications and capture customer actions or required information.

## Module Capability Matrix

| Module | Detailed Capabilities | Related APIs |
| --- | --- | --- |
| Customer Profile And Access | Manage profile, contacts, preferences, privacy consent, identity, delegated access, business admins, roles, secure access, and links to account/product/order/billing/support functions. | [TMF629](../../../references/tmforum-open-apis/openapi-specs/TMF629_CustomerManagement), [TMF632](../../../references/tmforum-open-apis/openapi-specs/TMF632_PartyManagement), [TMF720](../../../references/tmforum-open-apis/openapi-specs/TMF720_DigitalIdentity), [TMF644](../../../references/tmforum-open-apis/openapi-specs/TMF644_Privacy), [TMF672](../../../references/tmforum-open-apis/openapi-specs/TMF672_UserRolesPermissions) |
| Product And Service View | Show active products, services, add-ons, devices, contracts, lifecycle state, health, and self-service actions such as upgrade, downgrade, add-on, move, suspend, resume, and disconnect. | [TMF637](../../../references/tmforum-open-apis/openapi-specs/TMF637_ProductInventory), [TMF638](../../../references/tmforum-open-apis/openapi-specs/TMF638_ServiceInventory), [TMF620](../../../references/tmforum-open-apis/openapi-specs/TMF620_ProductCatalog) |
| Digital Sales And Change | Provide browse, eligibility, recommendation, configure, quote, cart, checkout, serviceability, installation options, appointment choices, and order estimate flows. | [TMF679](../../../references/tmforum-open-apis/openapi-specs/TMF679_ProductOfferingQualification), [TMF645](../../../references/tmforum-open-apis/openapi-specs/TMF645_ServiceQualification), [TMF680](../../../references/tmforum-open-apis/openapi-specs/TMF680_Recommendation), [TMF648](../../../references/tmforum-open-apis/openapi-specs/TMF648_QuoteManagement), [TMF663](../../../references/tmforum-open-apis/openapi-specs/TMF663_ShoppingCart), [TMF622](../../../references/tmforum-open-apis/openapi-specs/TMF622_ProductOrder) |
| Order And Appointment Tracking | Show order milestones, due dates, field appointments, shipment state, customer actions required, delay/jeopardy, activation, completion, reschedule, cancellation request, and installation instructions. | [TMF622](../../../references/tmforum-open-apis/openapi-specs/TMF622_ProductOrder), [TMF646](../../../references/tmforum-open-apis/openapi-specs/TMF646_AppointmentManagement), [TMF700](../../../references/tmforum-open-apis/openapi-specs/TMF700_ShippingOrder), [TMF684](../../../references/tmforum-open-apis/openapi-specs/TMF684_ShipmentTracking), [TMF681](../../../references/tmforum-open-apis/openapi-specs/TMF681_Communication) |
| Billing, Payment, And Usage | Show bills, balances, due dates, payment history, usage, prepay balance, payment methods, one-time payment, auto-pay, top-up, bill download, bill explanation, failed payment handling, and usage alerts. | [TMF678](../../../references/tmforum-open-apis/openapi-specs/TMF678_CustomerBill), [TMF676](../../../references/tmforum-open-apis/openapi-specs/TMF676_PaymentManagement), [TMF670](../../../references/tmforum-open-apis/openapi-specs/TMF670_PaymentMethods), [TMF654](../../../references/tmforum-open-apis/openapi-specs/TMF654_PrepayBalanceManagement), [TMF677](../../../references/tmforum-open-apis/openapi-specs/TMF677_UsageConsumption) |
| Support And Trouble Ticket | Raise, view, update, and close tickets. Provide guided diagnostics, self-tests, outage awareness, service status, appointment scheduling, escalation, communications, and links to products/services/incidents. | [TMF621](../../../references/tmforum-open-apis/openapi-specs/TMF621_TroubleTicket), [TMF653](../../../references/tmforum-open-apis/openapi-specs/TMF653_ServiceTestManagement), [TMF656](../../../references/tmforum-open-apis/openapi-specs/TMF656_ServiceProblemManagement), [TMF724](../../../references/tmforum-open-apis/openapi-specs/TMF724_IncidentManagement), [TMF681](../../../references/tmforum-open-apis/openapi-specs/TMF681_Communication) |

## Data Ownership

Owns customer experience state, digital session state, UI configuration, customer-entered draft actions, and self-care telemetry. Core customer, product, order, bill, payment, usage, appointment, shipment, and ticket records are mastered by BSS/OSS apps.

## First Release Scope

Deliver secure access, product/service view, order tracking, bills/payments/usage, trouble ticket, and simple buy/change flows. Add business admin depth, personalization, and proactive service recovery later.
