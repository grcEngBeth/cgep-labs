# Compliance Policies (Rego, GCP)

| Policy file | Control | Severity | Remediation |
|---|---|---|---|
| `sc28_encryption.rego` | SC-28 (nist-800-53) | high | Add an `encryption { default_kms_key_name = ... }` block referencing a CMEK you control. |
| `ac3_no_public.rego` | AC-3 (nist-800-53) | critical | Set `uniform_bucket_level_access = true` and `public_access_prevention = "enforced"`; narrow or remove firewall rules open to 0.0.0.0/0 on ports 22/3389. |
| `cm6_required_tags.rego` | CM-6 (nist-800-53) | medium | Add the labels `project`, `environment`, `managed_by`, `compliance_scope`. |

## Running

    opa test -v policies/
    opa eval -d policies -i <plan.json> data.compliance.<pkg>.deny --format=pretty

Tests live in `policies/tests/`. Each policy has compliant and non-compliant cases.
