-- TelcoSuite starter DDL for Digital, Partner, And Ecosystem
-- Target database: ts_digital_partner_ecosystem
-- Source model: planning/suite-details/05-digital-partner-ecosystem/data-model.md
-- Migration type: Flyway SQL migration, run while connected to ts_digital_partner_ecosystem.
-- Purpose: create app schemas, starter tables, standard controls, and app event outboxes.

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE SCHEMA IF NOT EXISTS customer_self_care;
COMMENT ON SCHEMA customer_self_care IS 'App-owned schema for Customer Self-Care in Digital, Partner, And Ecosystem.';
CREATE SCHEMA IF NOT EXISTS partner_marketplace;
COMMENT ON SCHEMA partner_marketplace IS 'App-owned schema for Partner And Marketplace in Digital, Partner, And Ecosystem.';
CREATE SCHEMA IF NOT EXISTS digital_network_components;
COMMENT ON SCHEMA digital_network_components IS 'App-owned schema for Digital And Network Component Operations in Digital, Partner, And Ecosystem.';
CREATE SCHEMA IF NOT EXISTS developer_api_portal;
COMMENT ON SCHEMA developer_api_portal IS 'App-owned schema for Developer And API Portal in Digital, Partner, And Ecosystem.';
CREATE SCHEMA IF NOT EXISTS ecosystem_shared;
COMMENT ON SCHEMA ecosystem_shared IS 'App-owned schema for Ecosystem Shared Modules in Digital, Partner, And Ecosystem.';

CREATE TABLE IF NOT EXISTS customer_self_care.digital_session (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_customer__digital_session_canonica_ec27347f UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_customer__digital_session_version_23a483e7 CHECK (version > 0),
    CONSTRAINT ck_customer__digital_session_validity_05cd143b CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_customer__digital_session_canonica_2418a047 ON customer_self_care.digital_session (canonical_id);
CREATE INDEX IF NOT EXISTS ix_customer__digital_session_status_30694f12 ON customer_self_care.digital_session (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_customer__digital_session_updated_aa38f3d7 ON customer_self_care.digital_session (updated_at);
CREATE INDEX IF NOT EXISTS ix_customer__digital_session_source_0008d043 ON customer_self_care.digital_session (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_customer__digital_session_attrgin_0509329d ON customer_self_care.digital_session USING gin (attributes);
COMMENT ON TABLE customer_self_care.digital_session IS 'Starter table for Customer Self-Care. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN customer_self_care.digital_session.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN customer_self_care.digital_session.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN customer_self_care.digital_session.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS customer_self_care.selfcare_experience_state (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_customer__selfcare_experience_state_canonica_e50a7355 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_customer__selfcare_experience_state_version_ec866369 CHECK (version > 0),
    CONSTRAINT ck_customer__selfcare_experience_state_validity_8c382078 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_customer__selfcare_experience_state_canonica_cae775dd ON customer_self_care.selfcare_experience_state (canonical_id);
CREATE INDEX IF NOT EXISTS ix_customer__selfcare_experience_state_status_fa901ce7 ON customer_self_care.selfcare_experience_state (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_customer__selfcare_experience_state_updated_928d6f3e ON customer_self_care.selfcare_experience_state (updated_at);
CREATE INDEX IF NOT EXISTS ix_customer__selfcare_experience_state_source_0f9fb90e ON customer_self_care.selfcare_experience_state (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_customer__selfcare_experience_state_attrgin_b7bfab17 ON customer_self_care.selfcare_experience_state USING gin (attributes);
COMMENT ON TABLE customer_self_care.selfcare_experience_state IS 'Starter table for Customer Self-Care. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN customer_self_care.selfcare_experience_state.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN customer_self_care.selfcare_experience_state.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN customer_self_care.selfcare_experience_state.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS customer_self_care.customer_draft_action (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_customer__customer_draft_action_canonica_2ed3d62d UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_customer__customer_draft_action_version_85e94dc0 CHECK (version > 0),
    CONSTRAINT ck_customer__customer_draft_action_validity_54c721ec CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_customer__customer_draft_action_canonica_24231f80 ON customer_self_care.customer_draft_action (canonical_id);
CREATE INDEX IF NOT EXISTS ix_customer__customer_draft_action_status_92632a4d ON customer_self_care.customer_draft_action (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_customer__customer_draft_action_updated_0e079bc3 ON customer_self_care.customer_draft_action (updated_at);
CREATE INDEX IF NOT EXISTS ix_customer__customer_draft_action_source_ece50120 ON customer_self_care.customer_draft_action (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_customer__customer_draft_action_attrgin_e028e62d ON customer_self_care.customer_draft_action USING gin (attributes);
COMMENT ON TABLE customer_self_care.customer_draft_action IS 'Starter table for Customer Self-Care. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN customer_self_care.customer_draft_action.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN customer_self_care.customer_draft_action.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN customer_self_care.customer_draft_action.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS customer_self_care.submitted_action_reference (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_customer__submitted_action_reference_canonica_12c198b5 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_customer__submitted_action_reference_version_dccc7431 CHECK (version > 0),
    CONSTRAINT ck_customer__submitted_action_reference_validity_3a6ecb0c CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_customer__submitted_action_reference_canonica_71df1ee1 ON customer_self_care.submitted_action_reference (canonical_id);
CREATE INDEX IF NOT EXISTS ix_customer__submitted_action_reference_status_28a9dd6b ON customer_self_care.submitted_action_reference (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_customer__submitted_action_reference_updated_14ae0162 ON customer_self_care.submitted_action_reference (updated_at);
CREATE INDEX IF NOT EXISTS ix_customer__submitted_action_reference_source_dee83a46 ON customer_self_care.submitted_action_reference (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_customer__submitted_action_reference_attrgin_e14eb774 ON customer_self_care.submitted_action_reference USING gin (attributes);
COMMENT ON TABLE customer_self_care.submitted_action_reference IS 'Starter table for Customer Self-Care. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN customer_self_care.submitted_action_reference.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN customer_self_care.submitted_action_reference.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN customer_self_care.submitted_action_reference.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS customer_self_care.interaction_telemetry (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_customer__interaction_telemetry_canonica_ee6a40da UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_customer__interaction_telemetry_version_3b0423ae CHECK (version > 0),
    CONSTRAINT ck_customer__interaction_telemetry_validity_30530883 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_customer__interaction_telemetry_canonica_82bdc86f ON customer_self_care.interaction_telemetry (canonical_id);
CREATE INDEX IF NOT EXISTS ix_customer__interaction_telemetry_status_7323260e ON customer_self_care.interaction_telemetry (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_customer__interaction_telemetry_updated_b2baea2f ON customer_self_care.interaction_telemetry (updated_at);
CREATE INDEX IF NOT EXISTS ix_customer__interaction_telemetry_source_b40f3979 ON customer_self_care.interaction_telemetry (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_customer__interaction_telemetry_attrgin_a8a35aeb ON customer_self_care.interaction_telemetry USING gin (attributes);
COMMENT ON TABLE customer_self_care.interaction_telemetry IS 'Starter table for Customer Self-Care. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN customer_self_care.interaction_telemetry.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN customer_self_care.interaction_telemetry.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN customer_self_care.interaction_telemetry.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS customer_self_care.portal_projection_cache (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_customer__portal_projection_cache_canonica_07e7e875 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_customer__portal_projection_cache_version_40ea01f1 CHECK (version > 0),
    CONSTRAINT ck_customer__portal_projection_cache_validity_a0c88a0e CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_customer__portal_projection_cache_canonica_d9985ebf ON customer_self_care.portal_projection_cache (canonical_id);
CREATE INDEX IF NOT EXISTS ix_customer__portal_projection_cache_status_0484ae07 ON customer_self_care.portal_projection_cache (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_customer__portal_projection_cache_updated_3c82216c ON customer_self_care.portal_projection_cache (updated_at);
CREATE INDEX IF NOT EXISTS ix_customer__portal_projection_cache_source_380955c5 ON customer_self_care.portal_projection_cache (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_customer__portal_projection_cache_attrgin_01b70608 ON customer_self_care.portal_projection_cache USING gin (attributes);
COMMENT ON TABLE customer_self_care.portal_projection_cache IS 'Starter table for Customer Self-Care. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN customer_self_care.portal_projection_cache.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN customer_self_care.portal_projection_cache.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN customer_self_care.portal_projection_cache.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS customer_self_care.event_outbox (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    event_name text NOT NULL,
    event_version integer NOT NULL DEFAULT 1,
    event_key text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    payload jsonb NOT NULL,
    headers jsonb NOT NULL DEFAULT '{}'::jsonb,
    data_classification text NOT NULL DEFAULT 'internal',
    occurred_at timestamptz NOT NULL DEFAULT now(),
    published_at timestamptz,
    publish_status text NOT NULL DEFAULT 'pending',
    publish_attempt_count integer NOT NULL DEFAULT 0,
    last_error text,
    correlation_id text,
    causation_id text,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_customer__event_outbox_status_d1d6a7c8 CHECK (publish_status IN ('pending', 'published', 'failed', 'dead_letter'))
);

CREATE INDEX IF NOT EXISTS ix_customer__event_outbox_publish_87310472 ON customer_self_care.event_outbox (publish_status, occurred_at);
CREATE INDEX IF NOT EXISTS ix_customer__event_outbox_eventkey_1d954863 ON customer_self_care.event_outbox (event_key, occurred_at);
CREATE INDEX IF NOT EXISTS ix_customer__event_outbox_agg_c54185d2 ON customer_self_care.event_outbox (aggregate_type, aggregate_id);
COMMENT ON TABLE customer_self_care.event_outbox IS 'Transactional event outbox for the owning app schema. Event contracts must be registered before publishing beyond the suite boundary.';

CREATE TABLE IF NOT EXISTS partner_marketplace.partner_profile_extension (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_partner_m_partner_profile_extension_canonica_a58d2dc1 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_partner_m_partner_profile_extension_version_2d5b4de5 CHECK (version > 0),
    CONSTRAINT ck_partner_m_partner_profile_extension_validity_1b135f68 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_partner_m_partner_profile_extension_canonica_4cd0f5c4 ON partner_marketplace.partner_profile_extension (canonical_id);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_profile_extension_status_da336785 ON partner_marketplace.partner_profile_extension (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_profile_extension_updated_dc49b7e8 ON partner_marketplace.partner_profile_extension (updated_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_profile_extension_source_bf5ec02b ON partner_marketplace.partner_profile_extension (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_profile_extension_attrgin_1d18ce11 ON partner_marketplace.partner_profile_extension USING gin (attributes);
COMMENT ON TABLE partner_marketplace.partner_profile_extension IS 'Starter table for Partner And Marketplace. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN partner_marketplace.partner_profile_extension.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN partner_marketplace.partner_profile_extension.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN partner_marketplace.partner_profile_extension.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS partner_marketplace.partnership_type (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_partner_m_partnership_type_canonica_ea3c30df UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_partner_m_partnership_type_version_153e6fc7 CHECK (version > 0),
    CONSTRAINT ck_partner_m_partnership_type_validity_c38cda4d CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_partner_m_partnership_type_canonica_5476cace ON partner_marketplace.partnership_type (canonical_id);
CREATE INDEX IF NOT EXISTS ix_partner_m_partnership_type_status_232d5712 ON partner_marketplace.partnership_type (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_partner_m_partnership_type_updated_224b6d37 ON partner_marketplace.partnership_type (updated_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_partnership_type_source_6ecc5405 ON partner_marketplace.partnership_type (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_partner_m_partnership_type_attrgin_aeb2fb30 ON partner_marketplace.partnership_type USING gin (attributes);
COMMENT ON TABLE partner_marketplace.partnership_type IS 'Starter table for Partner And Marketplace. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN partner_marketplace.partnership_type.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN partner_marketplace.partnership_type.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN partner_marketplace.partnership_type.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS partner_marketplace.partner_onboarding_state (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_partner_m_partner_onboarding_state_canonica_91b299a4 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_partner_m_partner_onboarding_state_version_5cf2d4da CHECK (version > 0),
    CONSTRAINT ck_partner_m_partner_onboarding_state_validity_d823e385 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_partner_m_partner_onboarding_state_canonica_104139ab ON partner_marketplace.partner_onboarding_state (canonical_id);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_onboarding_state_status_8a21b06c ON partner_marketplace.partner_onboarding_state (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_onboarding_state_updated_0ca63be3 ON partner_marketplace.partner_onboarding_state (updated_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_onboarding_state_source_2e1fec16 ON partner_marketplace.partner_onboarding_state (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_onboarding_state_attrgin_b4dc2d96 ON partner_marketplace.partner_onboarding_state USING gin (attributes);
COMMENT ON TABLE partner_marketplace.partner_onboarding_state IS 'Starter table for Partner And Marketplace. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN partner_marketplace.partner_onboarding_state.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN partner_marketplace.partner_onboarding_state.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN partner_marketplace.partner_onboarding_state.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS partner_marketplace.partner_catalog_submission (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_partner_m_partner_catalog_submission_canonica_2eb2f822 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_partner_m_partner_catalog_submission_version_99aee036 CHECK (version > 0),
    CONSTRAINT ck_partner_m_partner_catalog_submission_validity_9f1dec7f CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_partner_m_partner_catalog_submission_canonica_4a787fe7 ON partner_marketplace.partner_catalog_submission (canonical_id);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_catalog_submission_status_3306bd0d ON partner_marketplace.partner_catalog_submission (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_catalog_submission_updated_21bbe6e8 ON partner_marketplace.partner_catalog_submission (updated_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_catalog_submission_source_642477a0 ON partner_marketplace.partner_catalog_submission (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_catalog_submission_attrgin_877c0893 ON partner_marketplace.partner_catalog_submission USING gin (attributes);
COMMENT ON TABLE partner_marketplace.partner_catalog_submission IS 'Starter table for Partner And Marketplace. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN partner_marketplace.partner_catalog_submission.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN partner_marketplace.partner_catalog_submission.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN partner_marketplace.partner_catalog_submission.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS partner_marketplace.marketplace_listing (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_partner_m_marketplace_listing_canonica_4aa539bd UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_partner_m_marketplace_listing_version_5e0c8352 CHECK (version > 0),
    CONSTRAINT ck_partner_m_marketplace_listing_validity_44b3a016 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_partner_m_marketplace_listing_canonica_06925d96 ON partner_marketplace.marketplace_listing (canonical_id);
CREATE INDEX IF NOT EXISTS ix_partner_m_marketplace_listing_status_10452ed5 ON partner_marketplace.marketplace_listing (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_partner_m_marketplace_listing_updated_2ef76f25 ON partner_marketplace.marketplace_listing (updated_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_marketplace_listing_source_dd528929 ON partner_marketplace.marketplace_listing (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_partner_m_marketplace_listing_attrgin_94d7bfcc ON partner_marketplace.marketplace_listing USING gin (attributes);
COMMENT ON TABLE partner_marketplace.marketplace_listing IS 'Starter table for Partner And Marketplace. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN partner_marketplace.marketplace_listing.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN partner_marketplace.marketplace_listing.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN partner_marketplace.marketplace_listing.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS partner_marketplace.partner_order_visibility_state (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_partner_m_partner_order_visibility_s_canonica_b6787797 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_partner_m_partner_order_visibility_s_version_5b94838f CHECK (version > 0),
    CONSTRAINT ck_partner_m_partner_order_visibility_s_validity_18e665ea CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_partner_m_partner_order_visibility_s_canonica_38f8a254 ON partner_marketplace.partner_order_visibility_state (canonical_id);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_order_visibility_s_status_69ff9fd8 ON partner_marketplace.partner_order_visibility_state (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_order_visibility_s_updated_59948ac7 ON partner_marketplace.partner_order_visibility_state (updated_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_order_visibility_s_source_69622f42 ON partner_marketplace.partner_order_visibility_state (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_order_visibility_s_attrgin_46fe0362 ON partner_marketplace.partner_order_visibility_state USING gin (attributes);
COMMENT ON TABLE partner_marketplace.partner_order_visibility_state IS 'Starter table for Partner And Marketplace. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN partner_marketplace.partner_order_visibility_state.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN partner_marketplace.partner_order_visibility_state.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN partner_marketplace.partner_order_visibility_state.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS partner_marketplace.open_gateway_flow_state (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_partner_m_open_gateway_flow_state_canonica_f76b55ff UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_partner_m_open_gateway_flow_state_version_4edabdc8 CHECK (version > 0),
    CONSTRAINT ck_partner_m_open_gateway_flow_state_validity_d534b316 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_partner_m_open_gateway_flow_state_canonica_73aec24c ON partner_marketplace.open_gateway_flow_state (canonical_id);
CREATE INDEX IF NOT EXISTS ix_partner_m_open_gateway_flow_state_status_55b4559e ON partner_marketplace.open_gateway_flow_state (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_partner_m_open_gateway_flow_state_updated_507092c7 ON partner_marketplace.open_gateway_flow_state (updated_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_open_gateway_flow_state_source_32bef056 ON partner_marketplace.open_gateway_flow_state (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_partner_m_open_gateway_flow_state_attrgin_7286fbc4 ON partner_marketplace.open_gateway_flow_state USING gin (attributes);
COMMENT ON TABLE partner_marketplace.open_gateway_flow_state IS 'Starter table for Partner And Marketplace. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN partner_marketplace.open_gateway_flow_state.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN partner_marketplace.open_gateway_flow_state.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN partner_marketplace.open_gateway_flow_state.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS partner_marketplace.open_gateway_usage_view (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_partner_m_open_gateway_usage_view_canonica_8ff5b38f UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_partner_m_open_gateway_usage_view_version_bc82ceb1 CHECK (version > 0),
    CONSTRAINT ck_partner_m_open_gateway_usage_view_validity_a3b6b3e7 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_partner_m_open_gateway_usage_view_canonica_e4da1fba ON partner_marketplace.open_gateway_usage_view (canonical_id);
CREATE INDEX IF NOT EXISTS ix_partner_m_open_gateway_usage_view_status_811555d0 ON partner_marketplace.open_gateway_usage_view (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_partner_m_open_gateway_usage_view_updated_8b861ac2 ON partner_marketplace.open_gateway_usage_view (updated_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_open_gateway_usage_view_source_7b5e92ef ON partner_marketplace.open_gateway_usage_view (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_partner_m_open_gateway_usage_view_attrgin_7c1ef55a ON partner_marketplace.open_gateway_usage_view USING gin (attributes);
COMMENT ON TABLE partner_marketplace.open_gateway_usage_view IS 'Starter table for Partner And Marketplace. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN partner_marketplace.open_gateway_usage_view.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN partner_marketplace.open_gateway_usage_view.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN partner_marketplace.open_gateway_usage_view.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS partner_marketplace.partner_support_record (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_partner_m_partner_support_record_canonica_8cb99445 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_partner_m_partner_support_record_version_00e3f125 CHECK (version > 0),
    CONSTRAINT ck_partner_m_partner_support_record_validity_0f6d857b CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_partner_m_partner_support_record_canonica_b96d9f77 ON partner_marketplace.partner_support_record (canonical_id);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_support_record_status_409b6e38 ON partner_marketplace.partner_support_record (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_support_record_updated_86bebef2 ON partner_marketplace.partner_support_record (updated_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_support_record_source_472a0390 ON partner_marketplace.partner_support_record (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_partner_m_partner_support_record_attrgin_1f5131ef ON partner_marketplace.partner_support_record USING gin (attributes);
COMMENT ON TABLE partner_marketplace.partner_support_record IS 'Starter table for Partner And Marketplace. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN partner_marketplace.partner_support_record.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN partner_marketplace.partner_support_record.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN partner_marketplace.partner_support_record.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS partner_marketplace.event_outbox (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    event_name text NOT NULL,
    event_version integer NOT NULL DEFAULT 1,
    event_key text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    payload jsonb NOT NULL,
    headers jsonb NOT NULL DEFAULT '{}'::jsonb,
    data_classification text NOT NULL DEFAULT 'internal',
    occurred_at timestamptz NOT NULL DEFAULT now(),
    published_at timestamptz,
    publish_status text NOT NULL DEFAULT 'pending',
    publish_attempt_count integer NOT NULL DEFAULT 0,
    last_error text,
    correlation_id text,
    causation_id text,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_partner_m_event_outbox_status_3b033bf2 CHECK (publish_status IN ('pending', 'published', 'failed', 'dead_letter'))
);

CREATE INDEX IF NOT EXISTS ix_partner_m_event_outbox_publish_b68e613b ON partner_marketplace.event_outbox (publish_status, occurred_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_event_outbox_eventkey_a358c715 ON partner_marketplace.event_outbox (event_key, occurred_at);
CREATE INDEX IF NOT EXISTS ix_partner_m_event_outbox_agg_46cc88a3 ON partner_marketplace.event_outbox (aggregate_type, aggregate_id);
COMMENT ON TABLE partner_marketplace.event_outbox IS 'Transactional event outbox for the owning app schema. Event contracts must be registered before publishing beyond the suite boundary.';

CREATE TABLE IF NOT EXISTS digital_network_components.selfcare_component_definition (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_digital_n_selfcare_component_definit_canonica_d2aa1a3d UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_digital_n_selfcare_component_definit_version_62c80b23 CHECK (version > 0),
    CONSTRAINT ck_digital_n_selfcare_component_definit_validity_541e28ea CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_digital_n_selfcare_component_definit_canonica_dac41251 ON digital_network_components.selfcare_component_definition (canonical_id);
CREATE INDEX IF NOT EXISTS ix_digital_n_selfcare_component_definit_status_424c3ac0 ON digital_network_components.selfcare_component_definition (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_digital_n_selfcare_component_definit_updated_44e029b0 ON digital_network_components.selfcare_component_definition (updated_at);
CREATE INDEX IF NOT EXISTS ix_digital_n_selfcare_component_definit_source_88a612f2 ON digital_network_components.selfcare_component_definition (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_digital_n_selfcare_component_definit_attrgin_aa1adb6f ON digital_network_components.selfcare_component_definition USING gin (attributes);
COMMENT ON TABLE digital_network_components.selfcare_component_definition IS 'Starter table for Digital And Network Component Operations. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN digital_network_components.selfcare_component_definition.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN digital_network_components.selfcare_component_definition.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN digital_network_components.selfcare_component_definition.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS digital_network_components.naas_component_state (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_digital_n_naas_component_state_canonica_c191b27d UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_digital_n_naas_component_state_version_75cdfe34 CHECK (version > 0),
    CONSTRAINT ck_digital_n_naas_component_state_validity_3c0c83bc CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_digital_n_naas_component_state_canonica_389c4532 ON digital_network_components.naas_component_state (canonical_id);
CREATE INDEX IF NOT EXISTS ix_digital_n_naas_component_state_status_bc6577e3 ON digital_network_components.naas_component_state (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_digital_n_naas_component_state_updated_636c4375 ON digital_network_components.naas_component_state (updated_at);
CREATE INDEX IF NOT EXISTS ix_digital_n_naas_component_state_source_ce8404ad ON digital_network_components.naas_component_state (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_digital_n_naas_component_state_attrgin_638fa503 ON digital_network_components.naas_component_state USING gin (attributes);
COMMENT ON TABLE digital_network_components.naas_component_state IS 'Starter table for Digital And Network Component Operations. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN digital_network_components.naas_component_state.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN digital_network_components.naas_component_state.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN digital_network_components.naas_component_state.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS digital_network_components.iot_agent_device_component_state (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_digital_n_iot_agent_device_component_canonica_baf4d3fb UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_digital_n_iot_agent_device_component_version_0dc44121 CHECK (version > 0),
    CONSTRAINT ck_digital_n_iot_agent_device_component_validity_8edaae25 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_digital_n_iot_agent_device_component_canonica_3937b2a0 ON digital_network_components.iot_agent_device_component_state (canonical_id);
CREATE INDEX IF NOT EXISTS ix_digital_n_iot_agent_device_component_status_0c93b888 ON digital_network_components.iot_agent_device_component_state (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_digital_n_iot_agent_device_component_updated_93c09fea ON digital_network_components.iot_agent_device_component_state (updated_at);
CREATE INDEX IF NOT EXISTS ix_digital_n_iot_agent_device_component_source_21fa6823 ON digital_network_components.iot_agent_device_component_state (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_digital_n_iot_agent_device_component_attrgin_e57bc5aa ON digital_network_components.iot_agent_device_component_state USING gin (attributes);
COMMENT ON TABLE digital_network_components.iot_agent_device_component_state IS 'Starter table for Digital And Network Component Operations. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN digital_network_components.iot_agent_device_component_state.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN digital_network_components.iot_agent_device_component_state.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN digital_network_components.iot_agent_device_component_state.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS digital_network_components.iot_service_component_state (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_digital_n_iot_service_component_stat_canonica_29cbbc12 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_digital_n_iot_service_component_stat_version_52886412 CHECK (version > 0),
    CONSTRAINT ck_digital_n_iot_service_component_stat_validity_4836cec4 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_digital_n_iot_service_component_stat_canonica_a6bc9811 ON digital_network_components.iot_service_component_state (canonical_id);
CREATE INDEX IF NOT EXISTS ix_digital_n_iot_service_component_stat_status_f50207f0 ON digital_network_components.iot_service_component_state (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_digital_n_iot_service_component_stat_updated_9461d691 ON digital_network_components.iot_service_component_state (updated_at);
CREATE INDEX IF NOT EXISTS ix_digital_n_iot_service_component_stat_source_bda1611d ON digital_network_components.iot_service_component_state (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_digital_n_iot_service_component_stat_attrgin_cbf600ca ON digital_network_components.iot_service_component_state USING gin (attributes);
COMMENT ON TABLE digital_network_components.iot_service_component_state IS 'Starter table for Digital And Network Component Operations. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN digital_network_components.iot_service_component_state.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN digital_network_components.iot_service_component_state.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN digital_network_components.iot_service_component_state.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS digital_network_components.component_operation (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_digital_n_component_operation_canonica_8c8b9435 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_digital_n_component_operation_version_d26567ea CHECK (version > 0),
    CONSTRAINT ck_digital_n_component_operation_validity_9e0bc4f5 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_digital_n_component_operation_canonica_d4506c5c ON digital_network_components.component_operation (canonical_id);
CREATE INDEX IF NOT EXISTS ix_digital_n_component_operation_status_13f36c8d ON digital_network_components.component_operation (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_digital_n_component_operation_updated_795d82e0 ON digital_network_components.component_operation (updated_at);
CREATE INDEX IF NOT EXISTS ix_digital_n_component_operation_source_60e65416 ON digital_network_components.component_operation (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_digital_n_component_operation_attrgin_be8932f4 ON digital_network_components.component_operation USING gin (attributes);
COMMENT ON TABLE digital_network_components.component_operation IS 'Starter table for Digital And Network Component Operations. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN digital_network_components.component_operation.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN digital_network_components.component_operation.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN digital_network_components.component_operation.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS digital_network_components.event_outbox (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    event_name text NOT NULL,
    event_version integer NOT NULL DEFAULT 1,
    event_key text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    payload jsonb NOT NULL,
    headers jsonb NOT NULL DEFAULT '{}'::jsonb,
    data_classification text NOT NULL DEFAULT 'internal',
    occurred_at timestamptz NOT NULL DEFAULT now(),
    published_at timestamptz,
    publish_status text NOT NULL DEFAULT 'pending',
    publish_attempt_count integer NOT NULL DEFAULT 0,
    last_error text,
    correlation_id text,
    causation_id text,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_digital_n_event_outbox_status_8799b9e9 CHECK (publish_status IN ('pending', 'published', 'failed', 'dead_letter'))
);

CREATE INDEX IF NOT EXISTS ix_digital_n_event_outbox_publish_1ad9a4ff ON digital_network_components.event_outbox (publish_status, occurred_at);
CREATE INDEX IF NOT EXISTS ix_digital_n_event_outbox_eventkey_891273c7 ON digital_network_components.event_outbox (event_key, occurred_at);
CREATE INDEX IF NOT EXISTS ix_digital_n_event_outbox_agg_3c86a785 ON digital_network_components.event_outbox (aggregate_type, aggregate_id);
COMMENT ON TABLE digital_network_components.event_outbox IS 'Transactional event outbox for the owning app schema. Event contracts must be registered before publishing beyond the suite boundary.';

CREATE TABLE IF NOT EXISTS developer_api_portal.developer_organization (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_developer_developer_organization_canonica_dddc0c86 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_developer_developer_organization_version_0d96d31b CHECK (version > 0),
    CONSTRAINT ck_developer_developer_organization_validity_157e17eb CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_developer_developer_organization_canonica_0bb5f65b ON developer_api_portal.developer_organization (canonical_id);
CREATE INDEX IF NOT EXISTS ix_developer_developer_organization_status_70a98909 ON developer_api_portal.developer_organization (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_developer_developer_organization_updated_1b345aed ON developer_api_portal.developer_organization (updated_at);
CREATE INDEX IF NOT EXISTS ix_developer_developer_organization_source_d536551d ON developer_api_portal.developer_organization (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_developer_developer_organization_attrgin_9c5e5ece ON developer_api_portal.developer_organization USING gin (attributes);
COMMENT ON TABLE developer_api_portal.developer_organization IS 'Starter table for Developer And API Portal. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN developer_api_portal.developer_organization.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN developer_api_portal.developer_organization.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN developer_api_portal.developer_organization.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS developer_api_portal.developer_application (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_developer_developer_application_canonica_d4bbe5c1 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_developer_developer_application_version_54d9b906 CHECK (version > 0),
    CONSTRAINT ck_developer_developer_application_validity_0be7c4cf CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_developer_developer_application_canonica_83218ece ON developer_api_portal.developer_application (canonical_id);
CREATE INDEX IF NOT EXISTS ix_developer_developer_application_status_c1eeed13 ON developer_api_portal.developer_application (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_developer_developer_application_updated_f1095669 ON developer_api_portal.developer_application (updated_at);
CREATE INDEX IF NOT EXISTS ix_developer_developer_application_source_861f146a ON developer_api_portal.developer_application (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_developer_developer_application_attrgin_332b6050 ON developer_api_portal.developer_application USING gin (attributes);
COMMENT ON TABLE developer_api_portal.developer_application IS 'Starter table for Developer And API Portal. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN developer_api_portal.developer_application.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN developer_api_portal.developer_application.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN developer_api_portal.developer_application.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS developer_api_portal.api_product_publication_metadata (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_developer_api_product_publication_me_canonica_af5c6fc8 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_developer_api_product_publication_me_version_6ba83506 CHECK (version > 0),
    CONSTRAINT ck_developer_api_product_publication_me_validity_cdf522a4 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_developer_api_product_publication_me_canonica_646ffe04 ON developer_api_portal.api_product_publication_metadata (canonical_id);
CREATE INDEX IF NOT EXISTS ix_developer_api_product_publication_me_status_f2f80330 ON developer_api_portal.api_product_publication_metadata (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_developer_api_product_publication_me_updated_2aa2ac60 ON developer_api_portal.api_product_publication_metadata (updated_at);
CREATE INDEX IF NOT EXISTS ix_developer_api_product_publication_me_source_8f38b475 ON developer_api_portal.api_product_publication_metadata (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_developer_api_product_publication_me_attrgin_5bf885a6 ON developer_api_portal.api_product_publication_metadata USING gin (attributes);
COMMENT ON TABLE developer_api_portal.api_product_publication_metadata IS 'Starter table for Developer And API Portal. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN developer_api_portal.api_product_publication_metadata.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN developer_api_portal.api_product_publication_metadata.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN developer_api_portal.api_product_publication_metadata.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS developer_api_portal.api_subscription (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_developer_api_subscription_canonica_5a68f053 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_developer_api_subscription_version_3083edcd CHECK (version > 0),
    CONSTRAINT ck_developer_api_subscription_validity_79931a8c CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_developer_api_subscription_canonica_c0d886f2 ON developer_api_portal.api_subscription (canonical_id);
CREATE INDEX IF NOT EXISTS ix_developer_api_subscription_status_9ec6a11b ON developer_api_portal.api_subscription (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_developer_api_subscription_updated_46247125 ON developer_api_portal.api_subscription (updated_at);
CREATE INDEX IF NOT EXISTS ix_developer_api_subscription_source_9de74835 ON developer_api_portal.api_subscription (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_developer_api_subscription_attrgin_3016ef0c ON developer_api_portal.api_subscription USING gin (attributes);
COMMENT ON TABLE developer_api_portal.api_subscription IS 'Starter table for Developer And API Portal. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN developer_api_portal.api_subscription.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN developer_api_portal.api_subscription.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN developer_api_portal.api_subscription.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS developer_api_portal.credential_request_reference (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_developer_credential_request_referen_canonica_fb4c068b UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_developer_credential_request_referen_version_8d0e0c30 CHECK (version > 0),
    CONSTRAINT ck_developer_credential_request_referen_validity_4b37513b CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_developer_credential_request_referen_canonica_5af4b874 ON developer_api_portal.credential_request_reference (canonical_id);
CREATE INDEX IF NOT EXISTS ix_developer_credential_request_referen_status_9c990b4c ON developer_api_portal.credential_request_reference (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_developer_credential_request_referen_updated_02f6ecee ON developer_api_portal.credential_request_reference (updated_at);
CREATE INDEX IF NOT EXISTS ix_developer_credential_request_referen_source_e5d3ae5e ON developer_api_portal.credential_request_reference (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_developer_credential_request_referen_attrgin_1dacae89 ON developer_api_portal.credential_request_reference USING gin (attributes);
COMMENT ON TABLE developer_api_portal.credential_request_reference IS 'Starter table for Developer And API Portal. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN developer_api_portal.credential_request_reference.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN developer_api_portal.credential_request_reference.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN developer_api_portal.credential_request_reference.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS developer_api_portal.sandbox_mock_scenario (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_developer_sandbox_mock_scenario_canonica_93dc71bc UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_developer_sandbox_mock_scenario_version_4f88cffc CHECK (version > 0),
    CONSTRAINT ck_developer_sandbox_mock_scenario_validity_4a22ff75 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_developer_sandbox_mock_scenario_canonica_47f4a20c ON developer_api_portal.sandbox_mock_scenario (canonical_id);
CREATE INDEX IF NOT EXISTS ix_developer_sandbox_mock_scenario_status_7ef9bcea ON developer_api_portal.sandbox_mock_scenario (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_developer_sandbox_mock_scenario_updated_94f741d0 ON developer_api_portal.sandbox_mock_scenario (updated_at);
CREATE INDEX IF NOT EXISTS ix_developer_sandbox_mock_scenario_source_e78cebe0 ON developer_api_portal.sandbox_mock_scenario (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_developer_sandbox_mock_scenario_attrgin_dbff72da ON developer_api_portal.sandbox_mock_scenario USING gin (attributes);
COMMENT ON TABLE developer_api_portal.sandbox_mock_scenario IS 'Starter table for Developer And API Portal. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN developer_api_portal.sandbox_mock_scenario.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN developer_api_portal.sandbox_mock_scenario.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN developer_api_portal.sandbox_mock_scenario.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS developer_api_portal.portal_api_analytics_summary (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_developer_portal_api_analytics_summa_canonica_e0e0a3b0 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_developer_portal_api_analytics_summa_version_2ac6b9d2 CHECK (version > 0),
    CONSTRAINT ck_developer_portal_api_analytics_summa_validity_ae115afc CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_developer_portal_api_analytics_summa_canonica_56a47b4d ON developer_api_portal.portal_api_analytics_summary (canonical_id);
CREATE INDEX IF NOT EXISTS ix_developer_portal_api_analytics_summa_status_babf10a2 ON developer_api_portal.portal_api_analytics_summary (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_developer_portal_api_analytics_summa_updated_f6294b09 ON developer_api_portal.portal_api_analytics_summary (updated_at);
CREATE INDEX IF NOT EXISTS ix_developer_portal_api_analytics_summa_source_08e35453 ON developer_api_portal.portal_api_analytics_summary (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_developer_portal_api_analytics_summa_attrgin_4f676138 ON developer_api_portal.portal_api_analytics_summary USING gin (attributes);
COMMENT ON TABLE developer_api_portal.portal_api_analytics_summary IS 'Starter table for Developer And API Portal. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN developer_api_portal.portal_api_analytics_summary.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN developer_api_portal.portal_api_analytics_summary.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN developer_api_portal.portal_api_analytics_summary.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS developer_api_portal.certification_state (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_developer_certification_state_canonica_a020925d UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_developer_certification_state_version_58446f7a CHECK (version > 0),
    CONSTRAINT ck_developer_certification_state_validity_55edda6e CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_developer_certification_state_canonica_67753183 ON developer_api_portal.certification_state (canonical_id);
CREATE INDEX IF NOT EXISTS ix_developer_certification_state_status_a4ba96a5 ON developer_api_portal.certification_state (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_developer_certification_state_updated_c3ac2e1c ON developer_api_portal.certification_state (updated_at);
CREATE INDEX IF NOT EXISTS ix_developer_certification_state_source_81584d8a ON developer_api_portal.certification_state (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_developer_certification_state_attrgin_759cebd1 ON developer_api_portal.certification_state USING gin (attributes);
COMMENT ON TABLE developer_api_portal.certification_state IS 'Starter table for Developer And API Portal. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN developer_api_portal.certification_state.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN developer_api_portal.certification_state.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN developer_api_portal.certification_state.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS developer_api_portal.event_outbox (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    event_name text NOT NULL,
    event_version integer NOT NULL DEFAULT 1,
    event_key text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    payload jsonb NOT NULL,
    headers jsonb NOT NULL DEFAULT '{}'::jsonb,
    data_classification text NOT NULL DEFAULT 'internal',
    occurred_at timestamptz NOT NULL DEFAULT now(),
    published_at timestamptz,
    publish_status text NOT NULL DEFAULT 'pending',
    publish_attempt_count integer NOT NULL DEFAULT 0,
    last_error text,
    correlation_id text,
    causation_id text,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_developer_event_outbox_status_f1b2422f CHECK (publish_status IN ('pending', 'published', 'failed', 'dead_letter'))
);

CREATE INDEX IF NOT EXISTS ix_developer_event_outbox_publish_5c33e3d1 ON developer_api_portal.event_outbox (publish_status, occurred_at);
CREATE INDEX IF NOT EXISTS ix_developer_event_outbox_eventkey_638f886d ON developer_api_portal.event_outbox (event_key, occurred_at);
CREATE INDEX IF NOT EXISTS ix_developer_event_outbox_agg_0187cee6 ON developer_api_portal.event_outbox (aggregate_type, aggregate_id);
COMMENT ON TABLE developer_api_portal.event_outbox IS 'Transactional event outbox for the owning app schema. Event contracts must be registered before publishing beyond the suite boundary.';

CREATE TABLE IF NOT EXISTS ecosystem_shared.notification_template (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_ecosystem_notification_template_canonica_ef072e40 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_ecosystem_notification_template_version_12ee90f8 CHECK (version > 0),
    CONSTRAINT ck_ecosystem_notification_template_validity_a61149c5 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_ecosystem_notification_template_canonica_9cb8c88f ON ecosystem_shared.notification_template (canonical_id);
CREATE INDEX IF NOT EXISTS ix_ecosystem_notification_template_status_5d79b10f ON ecosystem_shared.notification_template (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_ecosystem_notification_template_updated_3f0a3057 ON ecosystem_shared.notification_template (updated_at);
CREATE INDEX IF NOT EXISTS ix_ecosystem_notification_template_source_aadf21eb ON ecosystem_shared.notification_template (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_ecosystem_notification_template_attrgin_586e8cbb ON ecosystem_shared.notification_template USING gin (attributes);
COMMENT ON TABLE ecosystem_shared.notification_template IS 'Starter table for Ecosystem Shared Modules. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN ecosystem_shared.notification_template.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN ecosystem_shared.notification_template.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN ecosystem_shared.notification_template.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS ecosystem_shared.channel_preference_overlay (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_ecosystem_channel_preference_overlay_canonica_db9f531c UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_ecosystem_channel_preference_overlay_version_5ac8327b CHECK (version > 0),
    CONSTRAINT ck_ecosystem_channel_preference_overlay_validity_ee10a2ca CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_ecosystem_channel_preference_overlay_canonica_46e4b47d ON ecosystem_shared.channel_preference_overlay (canonical_id);
CREATE INDEX IF NOT EXISTS ix_ecosystem_channel_preference_overlay_status_324fb52c ON ecosystem_shared.channel_preference_overlay (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_ecosystem_channel_preference_overlay_updated_e0db65c9 ON ecosystem_shared.channel_preference_overlay (updated_at);
CREATE INDEX IF NOT EXISTS ix_ecosystem_channel_preference_overlay_source_b54322ca ON ecosystem_shared.channel_preference_overlay (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_ecosystem_channel_preference_overlay_attrgin_3e524fe0 ON ecosystem_shared.channel_preference_overlay USING gin (attributes);
COMMENT ON TABLE ecosystem_shared.channel_preference_overlay IS 'Starter table for Ecosystem Shared Modules. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN ecosystem_shared.channel_preference_overlay.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN ecosystem_shared.channel_preference_overlay.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN ecosystem_shared.channel_preference_overlay.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS ecosystem_shared.channel_route (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_ecosystem_channel_route_canonica_625c69c3 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_ecosystem_channel_route_version_e814d2a0 CHECK (version > 0),
    CONSTRAINT ck_ecosystem_channel_route_validity_16e7a6a7 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_ecosystem_channel_route_canonica_16e37b90 ON ecosystem_shared.channel_route (canonical_id);
CREATE INDEX IF NOT EXISTS ix_ecosystem_channel_route_status_1e7186b9 ON ecosystem_shared.channel_route (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_ecosystem_channel_route_updated_1e8c8394 ON ecosystem_shared.channel_route (updated_at);
CREATE INDEX IF NOT EXISTS ix_ecosystem_channel_route_source_dd93ea0b ON ecosystem_shared.channel_route (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_ecosystem_channel_route_attrgin_25c3fda1 ON ecosystem_shared.channel_route USING gin (attributes);
COMMENT ON TABLE ecosystem_shared.channel_route IS 'Starter table for Ecosystem Shared Modules. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN ecosystem_shared.channel_route.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN ecosystem_shared.channel_route.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN ecosystem_shared.channel_route.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS ecosystem_shared.feature_flag (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_ecosystem_feature_flag_canonica_df902241 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_ecosystem_feature_flag_version_74ea95e7 CHECK (version > 0),
    CONSTRAINT ck_ecosystem_feature_flag_validity_f82bd289 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_ecosystem_feature_flag_canonica_e1a437cf ON ecosystem_shared.feature_flag (canonical_id);
CREATE INDEX IF NOT EXISTS ix_ecosystem_feature_flag_status_fc203a62 ON ecosystem_shared.feature_flag (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_ecosystem_feature_flag_updated_85413351 ON ecosystem_shared.feature_flag (updated_at);
CREATE INDEX IF NOT EXISTS ix_ecosystem_feature_flag_source_7c9d506d ON ecosystem_shared.feature_flag (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_ecosystem_feature_flag_attrgin_67d37a6e ON ecosystem_shared.feature_flag USING gin (attributes);
COMMENT ON TABLE ecosystem_shared.feature_flag IS 'Starter table for Ecosystem Shared Modules. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN ecosystem_shared.feature_flag.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN ecosystem_shared.feature_flag.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN ecosystem_shared.feature_flag.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS ecosystem_shared.portal_content (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_ecosystem_portal_content_canonica_772b8a3c UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_ecosystem_portal_content_version_192a2a59 CHECK (version > 0),
    CONSTRAINT ck_ecosystem_portal_content_validity_aa8cf585 CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_ecosystem_portal_content_canonica_ef177d73 ON ecosystem_shared.portal_content (canonical_id);
CREATE INDEX IF NOT EXISTS ix_ecosystem_portal_content_status_1476e5c6 ON ecosystem_shared.portal_content (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_ecosystem_portal_content_updated_afd53b57 ON ecosystem_shared.portal_content (updated_at);
CREATE INDEX IF NOT EXISTS ix_ecosystem_portal_content_source_9e95486d ON ecosystem_shared.portal_content (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_ecosystem_portal_content_attrgin_2f33df65 ON ecosystem_shared.portal_content USING gin (attributes);
COMMENT ON TABLE ecosystem_shared.portal_content IS 'Starter table for Ecosystem Shared Modules. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN ecosystem_shared.portal_content.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN ecosystem_shared.portal_content.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN ecosystem_shared.portal_content.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS ecosystem_shared.notification_delivery_reference_view (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    canonical_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    lifecycle_state text NOT NULL DEFAULT 'draft',
    status text NOT NULL DEFAULT 'active',
    version integer NOT NULL DEFAULT 1,
    valid_from timestamptz,
    valid_to timestamptz,
    source_suite text,
    source_app text,
    source_entity text,
    source_id text,
    source_version text,
    tmf_api text,
    tmf_resource text,
    tmf_version text,
    tmf_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    extension_attributes jsonb NOT NULL DEFAULT '{}'::jsonb,
    retention_class text,
    data_classification text NOT NULL DEFAULT 'internal',
    legal_hold boolean NOT NULL DEFAULT false,
    residency_region text,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    updated_at timestamptz NOT NULL DEFAULT now(),
    updated_by text,
    deleted_at timestamptz,
    CONSTRAINT uk_ecosystem_notification_delivery_refe_canonica_9e4ce346 UNIQUE (tenant_id, canonical_id),
    CONSTRAINT ck_ecosystem_notification_delivery_refe_version_24584265 CHECK (version > 0),
    CONSTRAINT ck_ecosystem_notification_delivery_refe_validity_8abca35f CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE INDEX IF NOT EXISTS ix_ecosystem_notification_delivery_refe_canonica_1b56cae8 ON ecosystem_shared.notification_delivery_reference_view (canonical_id);
CREATE INDEX IF NOT EXISTS ix_ecosystem_notification_delivery_refe_status_824bb406 ON ecosystem_shared.notification_delivery_reference_view (tenant_id, lifecycle_state, status);
CREATE INDEX IF NOT EXISTS ix_ecosystem_notification_delivery_refe_updated_fa7bd58a ON ecosystem_shared.notification_delivery_reference_view (updated_at);
CREATE INDEX IF NOT EXISTS ix_ecosystem_notification_delivery_refe_source_5a985978 ON ecosystem_shared.notification_delivery_reference_view (source_suite, source_app, source_entity, source_id) WHERE source_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_ecosystem_notification_delivery_refe_attrgin_3768cdd0 ON ecosystem_shared.notification_delivery_reference_view USING gin (attributes);
COMMENT ON TABLE ecosystem_shared.notification_delivery_reference_view IS 'Starter table for Ecosystem Shared Modules. Refine typed domain columns and TMF field mappings before production implementation.';
COMMENT ON COLUMN ecosystem_shared.notification_delivery_reference_view.tmf_payload IS 'TMF-aligned payload fragment or snapshot validated against the local TMF reference set before API exposure.';
COMMENT ON COLUMN ecosystem_shared.notification_delivery_reference_view.attributes IS 'Typed domain attributes should graduate to first-class columns when stable or frequently queried.';
COMMENT ON COLUMN ecosystem_shared.notification_delivery_reference_view.extension_attributes IS 'TMF characteristics, non-TMF extensions, or implementation metadata with documented compatibility status.';

CREATE TABLE IF NOT EXISTS ecosystem_shared.event_outbox (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    event_name text NOT NULL,
    event_version integer NOT NULL DEFAULT 1,
    event_key text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    tenant_id text NOT NULL DEFAULT 'default',
    brand text,
    market text,
    payload jsonb NOT NULL,
    headers jsonb NOT NULL DEFAULT '{}'::jsonb,
    data_classification text NOT NULL DEFAULT 'internal',
    occurred_at timestamptz NOT NULL DEFAULT now(),
    published_at timestamptz,
    publish_status text NOT NULL DEFAULT 'pending',
    publish_attempt_count integer NOT NULL DEFAULT 0,
    last_error text,
    correlation_id text,
    causation_id text,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_ecosystem_event_outbox_status_ee435f3c CHECK (publish_status IN ('pending', 'published', 'failed', 'dead_letter'))
);

CREATE INDEX IF NOT EXISTS ix_ecosystem_event_outbox_publish_6802a815 ON ecosystem_shared.event_outbox (publish_status, occurred_at);
CREATE INDEX IF NOT EXISTS ix_ecosystem_event_outbox_eventkey_cea61a13 ON ecosystem_shared.event_outbox (event_key, occurred_at);
CREATE INDEX IF NOT EXISTS ix_ecosystem_event_outbox_agg_cd149b73 ON ecosystem_shared.event_outbox (aggregate_type, aggregate_id);
COMMENT ON TABLE ecosystem_shared.event_outbox IS 'Transactional event outbox for the owning app schema. Event contracts must be registered before publishing beyond the suite boundary.';


GRANT USAGE ON SCHEMA customer_self_care TO telcosuite_app, telcosuite_readonly;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA customer_self_care TO telcosuite_app;
GRANT SELECT ON ALL TABLES IN SCHEMA customer_self_care TO telcosuite_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA customer_self_care GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO telcosuite_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA customer_self_care GRANT SELECT ON TABLES TO telcosuite_readonly;
GRANT USAGE ON SCHEMA partner_marketplace TO telcosuite_app, telcosuite_readonly;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA partner_marketplace TO telcosuite_app;
GRANT SELECT ON ALL TABLES IN SCHEMA partner_marketplace TO telcosuite_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA partner_marketplace GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO telcosuite_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA partner_marketplace GRANT SELECT ON TABLES TO telcosuite_readonly;
GRANT USAGE ON SCHEMA digital_network_components TO telcosuite_app, telcosuite_readonly;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA digital_network_components TO telcosuite_app;
GRANT SELECT ON ALL TABLES IN SCHEMA digital_network_components TO telcosuite_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA digital_network_components GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO telcosuite_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA digital_network_components GRANT SELECT ON TABLES TO telcosuite_readonly;
GRANT USAGE ON SCHEMA developer_api_portal TO telcosuite_app, telcosuite_readonly;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA developer_api_portal TO telcosuite_app;
GRANT SELECT ON ALL TABLES IN SCHEMA developer_api_portal TO telcosuite_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA developer_api_portal GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO telcosuite_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA developer_api_portal GRANT SELECT ON TABLES TO telcosuite_readonly;
GRANT USAGE ON SCHEMA ecosystem_shared TO telcosuite_app, telcosuite_readonly;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ecosystem_shared TO telcosuite_app;
GRANT SELECT ON ALL TABLES IN SCHEMA ecosystem_shared TO telcosuite_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA ecosystem_shared GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO telcosuite_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA ecosystem_shared GRANT SELECT ON TABLES TO telcosuite_readonly;
