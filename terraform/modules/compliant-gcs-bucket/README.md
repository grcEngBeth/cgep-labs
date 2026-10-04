# compliant-gcs-bucket

Deploys a GCS bucket with its own customer-managed KMS key. The baseline is hardcoded in the module, so consumers cannot disable it. Controls enforced: SC-12 (keyring and key we own), SC-13 and SC-28 (CMEK encryption at rest, 90-day rotation), AC-3 (uniform bucket-level access, public access prevention enforced), AU-11 (retention policy, at least 365 days in prod), and CM-6 (required labels merged over consumer labels). The `compliance_attestation` output reports these controls from live resource attributes.
