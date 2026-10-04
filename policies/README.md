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

## Policy files by cloud

| Control | GCP (Lab 3.3) | AWS (Lab 3.4) |
|---------|---------------|---------------|
| SC-28 Encryption at rest | `sc28_encryption.rego` (`compliance.sc28`) | `sc28_encryption_aws.rego` (`compliance.sc28_aws`) |
| AC-3 Access enforcement | `ac3_no_public.rego` (`compliance.ac3`) | `ac3_no_public_aws.rego` (`compliance.ac3_aws`) |
| CM-6 Required tags | `cm6_required_tags.rego` (`compliance.cm6`) | `cm6_required_tags_aws.rego` (`compliance.cm6_aws`) |

The control ID is portable across clouds; the resource types each rule checks are not. Running a GCP namespace against an AWS plan passes with zero coverage, so `scripts/policy-gate.sh` runs only the namespaces that match the cloud being planned.
