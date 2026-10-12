# AWS Security Services Baseline (Lab 5.2)

| Service | Purpose | NIST 800-53 controls |
|---|---|---|
| CloudTrail (multi-region, log-file validation) | Records account activity; tamper-evident logs | AU-2, AU-12, AU-10 |
| Security Hub CSPM (NIST 800-53 Rev 5 + FSBP) | Aggregates findings continuously | RA-5, SI-4 |
| AWS Config (recorder + delivery channel) | Records resource configuration over time | CM-2, CM-6, CM-8 |

## Notes

- Config was added after the first apply: the Security Hub standards showed
  INCOMPLETE with NO_AVAILABLE_CONFIGURATION_RECORDER until a recorder existed.
  The standards were then re-subscribed so Security Hub re-checked.
- The account was initially on the AWS free plan, which blocked Security Hub
  (SubscriptionRequiredException) until the plan was upgraded.
- Everything was destroyed with `terraform destroy` after evidence capture.

## Evidence

`evidence/lab-5-2/security-hub-findings.json` (25 findings).
Note: AWS account ID redacted in the evidence file before commit.
