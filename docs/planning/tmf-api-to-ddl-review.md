# Developer And API Portal TMF API To DDL Review

Reviewed: 2026-06-14

Status: Complete for baseline app implementation. Endpoint-specific contract tests and final story-level field promotion still happen during build.

## Scope

This review covers `developer_api_portal` in suite database `ts_digital_partner_ecosystem`. It uses the local TMF Open API reference set, the suite data model, the API-to-DDL traceability matrix, and the V001 starter DDL.

The review confirms that the app can move into implementation with a V002 typed DDL baseline while preserving full TMF payload compatibility through validated `tmf_payload`, typed common TMF columns, and normalized support tables.

## TMF API Baseline Selection

| TMF API | Local baseline spec | Resources/path roots reviewed | V001 table groups |
| --- | --- | --- | --- |
| TMF720 | `references/tmforum-open-apis/openapi-specs/TMF720_DigitalIdentity/TMF720_Digital_Identity_Management_API_v4.0.0_swagger.json` | `digitalIdentity` | platform_user; customer_identity_link; developer_organization; developer_application |
| TMF672 | `references/tmforum-open-apis/openapi-specs/TMF672_UserRolesPermissions/TMF672-User_Role_Permission_Management_API-v5.1.0.oas.yaml` | `checkPermission`, `permissionSet`, `permissionSpecification`, `permissionSpecificationSet` | tenant; environment; platform_user; platform_role; platform_permission; developer_application references |
| TMF668 | `references/tmforum-open-apis/openapi-specs/TMF668_PartnershipType/TMF668_Partnership_Type_v4.0.0_swagger.json` | `partnership`, `partnershipSpecification` | partnership_type; partner_profile_extension; api_subscription references |
| TMF704 | `references/tmforum-open-apis/openapi-specs/TMF704_TestCase/TMF704_Test_Case_Management_API_v4.0.0_swagger.json` | `nonFunctionalTestModel`, `testCase`, `testSuite` | test_case; sandbox_mock_scenario references |
| TMF706 | `references/tmforum-open-apis/openapi-specs/TMF706_TestData/TMF706_Test_Data_Management_API_v4.0.0_swagger.json` | `testDataInstance`, `testDataSchema` | test_data_definition; sandbox_mock_scenario references |
| TMF705 | `references/tmforum-open-apis/openapi-specs/TMF705_TestEnvironment/TMF705_Test_Environment_Management_API_v4.0.0_swagger.json` | `abstractEnvironment`, `concreteEnvironmentMetaModel`, `provisioningArtifact`, `testResourceAPI` | test_environment; sandbox_mock_scenario references |
| TMF628 | `references/tmforum-open-apis/openapi-specs/TMF628_Performance/TMF628-Performance-v4.0.0.swagger.json` | `measurementCollectionJob`, `onDemandCollection`, `performanceIndicatorGroupSpecification`, `performanceIndicatorSpecification`, `trackingRecord` | performance_measurement; quality_analytics_output; portal_api_analytics_summary |
| TMF657 | `references/tmforum-open-apis/openapi-specs/TMF657_ServiceQualityManagement/TMF657_Service_Quality_Management_Management_API_v4.0.0_swagger.json` | `serviceLevelObjective`, `serviceLevelSpecification` | service_quality_score; service_quality_objective; sla_calculation; portal_api_analytics_summary |
| TMF708 | `references/tmforum-open-apis/openapi-specs/TMF708_TestExecution/TMF708_Test_Execution_Management_API_v4.0.0_swagger.json` | `nonFunctionalTestExecution`, `testCaseExecution`, `testEnvironmentAllocationExecution`, `testEnvironmentProvisioningExecution`, `testSuiteExecution` | test_execution |
| TMF707 | `references/tmforum-open-apis/openapi-specs/TMF707_TestResult/TMF707_Test_Result_Management_API_v4.0.0_swagger.json` | `nonFunctionalTestResult`, `testCaseResult`, `testSuiteResult` | test_result; control_evidence references |
| TMF710 | `references/tmforum-open-apis/openapi-specs/TMF710_GeneralTestArtifact/TMF710_General_Test_Artifact_Management_API_v4.0.0_swagger.json` | `generalTestArtifact` | api_contract; api_contract_version; test_artifact; conformance_evidence |

## Current DDL Coverage

Current starter DDL is in `database/postgres/suites/ts_digital_partner_ecosystem/V001__create_app_schemas_and_starter_tables.sql` under schema `developer_api_portal`.

| Current table | TMF purpose | V002 decision |
| --- | --- | --- |
| `developer_api_portal.developer_organization` | Starter table for Developer And API Portal; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |
| `developer_api_portal.developer_application` | Starter table for Developer And API Portal; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |
| `developer_api_portal.api_product_publication_metadata` | Starter table for Developer And API Portal; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |
| `developer_api_portal.api_subscription` | Starter table for Developer And API Portal; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |
| `developer_api_portal.credential_request_reference` | Starter table for Developer And API Portal; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |
| `developer_api_portal.sandbox_mock_scenario` | Starter table for Developer And API Portal; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |
| `developer_api_portal.portal_api_analytics_summary` | Starter table for Developer And API Portal; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |
| `developer_api_portal.certification_state` | Starter table for Developer And API Portal; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |
| `developer_api_portal.event_outbox` | App outbox for domain and TMF notification events. | Keep and refine through `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |

## Resource To Table Decisions

| TMF API/resource | Master or anchor table | Path coverage | Promoted field candidates | Field handling strategy |
| --- | --- | --- | --- | --- |
| TMF720 `digitalIdentity` | `developer_api_portal.developer_organization` | `/digitalIdentity`, `/digitalIdentity/{id}` | `id`, `href`, `creationDate`, `lastUpdate`, `nickname`, `status`, `attachment`, `contactMedium` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF672 `checkPermission` | `developer_api_portal.developer_application` | `/checkPermission`, `/checkPermission/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF672 `permissionSet` | `developer_api_portal.developer_application` | `/permissionSet`, `/permissionSet/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF672 `permissionSpecification` | `developer_api_portal.developer_application` | `/permissionSpecification`, `/permissionSpecification/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF672 `permissionSpecificationSet` | `developer_api_portal.developer_application` | `/permissionSpecificationSet`, `/permissionSpecificationSet/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF668 `partnership` | `developer_api_portal.api_subscription` | `/partnership`, `/partnership/{id}` | `id`, `href`, `description`, `name`, `partner`, `specification`, `@baseType`, `@schemaLocation` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF668 `partnershipSpecification` | `developer_api_portal.api_subscription` | `/partnershipSpecification`, `/partnershipSpecification/{id}` | `id`, `href`, `description`, `name`, `roleSpecification`, `@baseType`, `@schemaLocation`, `@type` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF704 `nonFunctionalTestModel` | `developer_api_portal.sandbox_mock_scenario` | `/nonFunctionalTestModel`, `/nonFunctionalTestModel/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `agreement`, `attribute`, `nonFunctionalTestModelDefinition` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF704 `testCase` | `developer_api_portal.sandbox_mock_scenario` | `/testCase`, `/testCase/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `agreement`, `attribute`, `relatedParty` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF704 `testSuite` | `developer_api_portal.sandbox_mock_scenario` | `/testSuite`, `/testSuite/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `agreement`, `attribute`, `relatedParty` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF706 `testDataInstance` | `developer_api_portal.sandbox_mock_scenario` | `/testDataInstance`, `/testDataInstance/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `agreement`, `attribute`, `relatedParty` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF706 `testDataSchema` | `developer_api_portal.sandbox_mock_scenario` | `/testDataSchema`, `/testDataSchema/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `agreement`, `attribute`, `relatedParty` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF705 `abstractEnvironment` | `developer_api_portal.sandbox_mock_scenario` | `/abstractEnvironment`, `/abstractEnvironment/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `abstractEnvironmentDefinition`, `agreement`, `attribute` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF705 `concreteEnvironmentMetaModel` | `developer_api_portal.sandbox_mock_scenario` | `/concreteEnvironmentMetaModel`, `/concreteEnvironmentMetaModel/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `agreement`, `attribute`, `concreteEnvironmentMetaModelDefinition` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF705 `provisioningArtifact` | `developer_api_portal.sandbox_mock_scenario` | `/provisioningArtifact`, `/provisioningArtifact/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `agreement`, `attribute`, `provisioningArtifactDefinition` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF705 `testResourceAPI` | `developer_api_portal.sandbox_mock_scenario` | `/testResourceAPI`, `/testResourceAPI/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `agreement`, `attribute`, `relatedParty` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF628 `measurementCollectionJob` | `developer_api_portal.portal_api_analytics_summary` | `/measurementCollectionJob`, `/measurementCollectionJob/{id}` | `id`, `href`, `consumingApplicationId`, `creationTime`, `jobId`, `jobPriority`, `lastModifiedTime`, `outputFormat` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF628 `onDemandCollection` | `developer_api_portal.portal_api_analytics_summary` | `/onDemandCollection`, `/onDemandCollection/{id}` | `id`, `href`, `consumingApplicationId`, `creationTime`, `jobId`, `jobPriority`, `lastModifiedTime`, `outputFormat` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF628 `performanceIndicatorGroupSpecification` | `developer_api_portal.portal_api_analytics_summary` | `/performanceIndicatorGroupSpecification`, `/performanceIndicatorGroupSpecification/{id}` | `id`, `href`, `name`, `performanceIndicatorSpecification`, `@baseType`, `@schemaLocation`, `@type` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF628 `performanceIndicatorSpecification` | `developer_api_portal.portal_api_analytics_summary` | `/performanceIndicatorSpecification`, `/performanceIndicatorSpecification/{id}` | `id`, `href`, `derivationAlgorithm`, `derivationMethod`, `description`, `indicatorCategory`, `indicatorUnit`, `name` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF628 `trackingRecord` | `developer_api_portal.portal_api_analytics_summary` | `/trackingRecord`, `/trackingRecord/{id}` | `id`, `description`, `systemId`, `time`, `user`, `characteristic`, `@baseType`, `@schemaLocation` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF657 `serviceLevelObjective` | `developer_api_portal.portal_api_analytics_summary` | `/serviceLevelObjective`, `/serviceLevelObjective/{id}` | `id`, `href`, `conformanceComparator`, `conformanceTarget`, `graceTimes`, `name`, `thresholdTarget`, `toleranceTarget` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF657 `serviceLevelSpecification` | `developer_api_portal.portal_api_analytics_summary` | `/serviceLevelSpecification`, `/serviceLevelSpecification/{id}` | `id`, `href`, `description`, `name`, `relatedServiceLevelObjective`, `validFor`, `@baseType`, `@schemaLocation` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF708 `nonFunctionalTestExecution` | `developer_api_portal.developer_organization` | `/nonFunctionalTestExecution`, `/nonFunctionalTestExecution/{id}` | `id`, `href`, `dataCorrelationId`, `generalTestArtifact`, `nonFunctionalTestModel`, `state`, `testDataInstance`, `testEnvironmentProvisioningExecution` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF708 `testCaseExecution` | `developer_api_portal.developer_organization` | `/testCaseExecution`, `/testCaseExecution/{id}` | `id`, `href`, `dataCorrelationId`, `generalTestArtifact`, `state`, `testCase`, `testDataInstance`, `testEnvironmentProvisioningExecution` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF708 `testEnvironmentAllocationExecution` | `developer_api_portal.developer_organization` | `/testEnvironmentAllocationExecution`, `/testEnvironmentAllocationExecution/{id}` | `id`, `href`, `dataCorrelationId`, `resourceManagerUrl`, `abstractEnvironment`, `concreteResourceMapping`, `generalTestArtifact`, `state` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF708 `testEnvironmentProvisioningExecution` | `developer_api_portal.developer_organization` | `/testEnvironmentProvisioningExecution`, `/testEnvironmentProvisioningExecution/{id}` | `id`, `href`, `dataCorrelationId`, `generalTestArtifact`, `provisioningArtifact`, `state`, `testEnvironmentAllocationExecution`, `@baseType` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF708 `testSuiteExecution` | `developer_api_portal.developer_organization` | `/testSuiteExecution`, `/testSuiteExecution/{id}` | `id`, `href`, `dataCorrelationId`, `name`, `generalTestArtifact`, `state`, `testDataInstance`, `testEnvironmentProvisioningExecution` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF707 `nonFunctionalTestResult` | `developer_api_portal.developer_organization` | `/nonFunctionalTestResult`, `/nonFunctionalTestResult/{id}` | `id`, `href`, `nonFunctionalTestResultDefinition`, `testExecution`, `@baseType`, `@schemaLocation`, `@type` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF707 `testCaseResult` | `developer_api_portal.developer_organization` | `/testCaseResult`, `/testCaseResult/{id}` | `id`, `href`, `testCaseResultDefinition`, `testExecution`, `@baseType`, `@schemaLocation`, `@type` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF707 `testSuiteResult` | `developer_api_portal.developer_organization` | `/testSuiteResult`, `/testSuiteResult/{id}` | `id`, `href`, `testExecution`, `testSuiteResultDefinition`, `@baseType`, `@schemaLocation`, `@type` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF710 `generalTestArtifact` | `developer_api_portal.developer_organization` | `/generalTestArtifact`, `/generalTestArtifact/{id}` | `id`, `href`, `description`, `version`, `versionDescription`, `agreement`, `attribute`, `generalArtifactDefinition` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |

## V002 DDL Refinement

Migration: `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql`

The migration adds this implementation baseline for the app:

| Area | Decision |
| --- | --- |
| Common TMF fields | Add reusable typed columns such as `tmf_id`, `tmf_href`, `tmf_type`, `tmf_base_type`, `tmf_schema_location`, `tmf_referred_type`, `tmf_name`, `tmf_description`, `tmf_lifecycle_status`, `tmf_state`, dates, priority, and external ID to every V001 app table. |
| Full TMF compatibility | Keep the V001 `tmf_payload` column as the complete validated TMF resource snapshot for fields that are not yet promoted to typed columns. |
| Characteristics and references | Add normalized `tmf_characteristic`, `tmf_resource_reference`, `tmf_external_identifier`, `tmf_related_party`, `tmf_note`, `tmf_attachment`, and `tmf_relationship` support tables. |
| API/resource map | Add `tmf_api_resource_map` rows for the selected local TMF APIs and resource roots. |
| Event contracts | Add baseline event contract rows for create, update, state-change, and delete events per reviewed API resource. |
| Privacy and audit | Add table-level privacy, retention, legal-hold, residency, masking, and audit policy rows. |
| High-volume candidates | `developer_api_portal.portal_api_analytics_summary`, `developer_api_portal.event_outbox` |

## Event Contract Baseline

Events are registered in `developer_api_portal.event_contract` using `developer_api_portal.event_outbox` as the publication basis. Consumers must be added when integrations are designed; no app should directly write another app schema.

## Privacy, Retention, And Audit Baseline

| Table | Data classification | Retention class | Audit level |
| --- | --- | --- | --- |
| `developer_api_portal.developer_organization` | internal | domain_lifecycle | standard |
| `developer_api_portal.developer_application` | internal | domain_lifecycle | standard |
| `developer_api_portal.api_product_publication_metadata` | internal | domain_lifecycle | standard |
| `developer_api_portal.api_subscription` | internal | domain_lifecycle | standard |
| `developer_api_portal.credential_request_reference` | restricted | regulated_lifecycle | high |
| `developer_api_portal.sandbox_mock_scenario` | internal | domain_lifecycle | standard |
| `developer_api_portal.portal_api_analytics_summary` | internal | operational_telemetry | standard |
| `developer_api_portal.certification_state` | internal | domain_lifecycle | standard |
| `developer_api_portal.event_outbox` | internal | operational_telemetry | standard |

## Build Gate Result

| Gate item | Result |
| --- | --- |
| API/resource review | Complete for baseline implementation |
| V002 typed DDL | Complete: `database/postgres/suites/ts_digital_partner_ecosystem/V002__refine_developer_api_portal_tmf_core.sql` |
| Event contract register | Baseline complete |
| Privacy/retention/audit classification | Baseline complete |
| Remaining implementation control | Validate exact endpoint operations and contract tests as Angular/Spring Boot features are built |
