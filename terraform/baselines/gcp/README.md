# Lab 5.4: GCP security baseline

Enforced Org Policy constraints (preventive, rejected at the API call):
- storage.uniformBucketLevelAccess
- iam.disableServiceAccountKeyCreation (verified: key creation fails with FAILED_PRECONDITION)
- compute.requireOsLogin

Workload Identity Federation: pool + provider trusting GitHub OIDC, restricted to one repo via attribute_condition, mapped to a read-only service account. No service-account keys anywhere.

Lesson: Data Access audit logs are OFF by default in GCP and must be enabled per service. Enabled here for storage, KMS, and IAM; evidence in evidence/lab-5-4/iam-policy.json.

Gotchas hit: Org Policy needs the project inside an Organization (roles/orgpolicy.policyAdmin is org-level only), and the Terraform provider needs user_project_override and billing_project set when using user ADC.
