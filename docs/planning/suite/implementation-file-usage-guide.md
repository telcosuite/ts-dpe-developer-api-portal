# Digital, Partner, And Ecosystem Implementation File Usage Guide

Reviewed: 2026-06-14

## Purpose

This guide explains how to use the planning, TMF, UI, data, and DDL files for the Digital, Partner, And Ecosystem suite while building its apps.

Suite focus: digital self-care, partner marketplace, developer/API portal, ecosystem shared modules, and component operations.

## Suite-Level Files

| File | Use it for |
| --- | --- |
| [README.md](README.md) | Suite navigation and app list. |
| [tech-and-ui-guidance.md](tech-and-ui-guidance.md) | Suite-specific Angular, PrimeNG, layout, navigation, density, and UI consistency guidance. |
| [data-model.md](data-model.md) | Suite database ownership, app schemas, data mastery, cross-app sharing, and physical model guidance. |
| [journey-coverage.md](journey-coverage.md) | Cross-app suite journeys and end-to-end flow validation. |
| [../build-artifact-usage-guide.md](../build-artifact-usage-guide.md) | Global explanation of how all generated files fit together. |
| [../suite-app-coverage-control-matrix.md](../suite-app-coverage-control-matrix.md) | Build-readiness status across all suites and apps. |
| [../tmf-api-to-ddl-traceability-matrix.md](../tmf-api-to-ddl-traceability-matrix.md) | API-level TMF-to-schema/table coverage. |
| [../../../database/postgres/README.md](../../../database/postgres/README.md) | Database execution model and migration usage. |

## Database And Migration Use

Physical database: `ts_digital_partner_ecosystem`

Run migrations in order inside this suite database. `V001` creates app schemas and starter tables. Each V002+ migration refines one app with promoted TMF fields, support tables, event contracts, and privacy/retention/audit policies.

| Migration | Path |
| --- | --- |
| `V001__create_app_schemas_and_starter_tables.sql` | `database/postgres/suites/ts_digital_partner_ecosystem/V001__create_app_schemas_and_starter_tables.sql` |
| `V002__refine_developer_api_portal_tmf_core.sql` | `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |
| `V003__refine_customer_self_care_tmf_core.sql` | `database/postgres/suites/ts_digital_partner_ecosystem/V003__refine_customer_self_care_tmf_core.sql` |
| `V004__refine_partner_marketplace_tmf_core.sql` | `database/postgres/suites/ts_digital_partner_ecosystem/V004__refine_partner_marketplace_tmf_core.sql` |
| `V005__refine_digital_network_components_tmf_core.sql` | `database/postgres/suites/ts_digital_partner_ecosystem/V005__refine_digital_network_components_tmf_core.sql` |
| `V006__refine_ecosystem_shared_tmf_core.sql` | `database/postgres/suites/ts_digital_partner_ecosystem/V006__refine_ecosystem_shared_tmf_core.sql` |

## App File Map

| App | Schema | App usage guide | TMF review | App migration | Primary TMF/API areas |
| --- | --- | --- | --- | --- | --- |
| Customer Self-Care | `customer_self_care` | [customer-self-care/implementation-file-usage.md](customer-self-care/implementation-file-usage.md) | [customer-self-care.md](../tmf-api-ddl-reviews/customer-self-care.md) | `V003__refine_customer_self_care_tmf_core.sql` | TMF629, TMF632, TMF720, TMF644, TMF672, TMF637, TMF638, TMF620, TMF679, TMF645, TMF680, TMF648, TMF663, TMF622, TMF646, TMF700, TMF684, TMF681, TMF678, TMF676, TMF670, TMF654, TMF677, TMF621, TMF653, TMF656, TMF724 |
| Developer And API Portal | `developer_api_portal` | [developer-api-portal/implementation-file-usage.md](developer-api-portal/implementation-file-usage.md) | [developer-api-portal.md](../tmf-api-ddl-reviews/developer-api-portal.md) | `V002__refine_developer_api_portal_tmf_core.sql` | TMF720, TMF672, TMF668, TMF704, TMF706, TMF705, TMF628, TMF657, TMF708, TMF707, TMF710 |
| Digital And Network Component Operations | `digital_network_components` | [digital-network-component-operations/implementation-file-usage.md](digital-network-component-operations/implementation-file-usage.md) | [digital-network-components.md](../tmf-api-ddl-reviews/digital-network-components.md) | `V005__refine_digital_network_components_tmf_core.sql` | TMF910, TMF909, TMF620, TMF641, TMF638, TMF640, TMF908, TMF637, TMF639, TMF914, TMF622, TMF635, TMF621 |
| Ecosystem Shared Modules | `ecosystem_shared` | [ecosystem-shared-modules/implementation-file-usage.md](ecosystem-shared-modules/implementation-file-usage.md) | [ecosystem-shared.md](../tmf-api-ddl-reviews/ecosystem-shared.md) | `V006__refine_ecosystem_shared_tmf_core.sql` | TMF620, TMF681, TMF644 |
| Partner And Marketplace | `partner_marketplace` | [partner-and-marketplace/implementation-file-usage.md](partner-and-marketplace/implementation-file-usage.md) | [partner-marketplace.md](../tmf-api-ddl-reviews/partner-marketplace.md) | `V004__refine_partner_marketplace_tmf_core.sql` | TMF632, TMF669, TMF668, TMF651, TMF720, TMF667, TMF620, TMF936, TMF633, TMF622, TMF931, TMF641, TMF699, TMF937, TMF635, TMF736, TMF737, TMF738, TMF621, TMF681 |

## Suite Build Workflow

1. Start with this guide and the suite `data-model.md` to confirm database, schema, and ownership boundaries.
2. Use `tech-and-ui-guidance.md` before any Angular work so all apps share the TelcoSuite design language.
3. Build apps in the priority order from [../tmf-api-ddl-reviews/backlog.md](../tmf-api-ddl-reviews/backlog.md), unless delivery priorities explicitly change.
4. For each app, open its `implementation-file-usage.md` and follow its checklist.
5. Apply `V001`, then the app's V002+ migration, before implementing repositories/entities that depend on promoted columns or support tables.
6. Emit events through the app `event_outbox` and use the app `event_contract` table as the baseline register.
7. Enforce table handling with the app `privacy_retention_policy` table and add jurisdiction-specific rules before release.
8. Keep cross-app interactions out of database writes; use APIs, events, governed views, workflow tasks, or data products.

## Suite Delivery Gate

The suite is implementation-ready when each app keeps these artifacts aligned: app overview, modules/features, personas/journeys, TMF review, V002+ DDL, endpoint contract tests, event behavior, and privacy/audit controls.
