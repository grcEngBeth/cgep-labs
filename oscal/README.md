# OSCAL artifacts (Lab 6.1)

## components/compliant-s3.json
OSCAL component definition for the `compliant-s3` Terraform module
(`terraform/primitives/compliant-s3`). It claims four NIST 800-53 Rev 5 controls
(sc-28, ac-3, au-3, cm-6), each naming the Terraform resource that enforces it.

## profiles/cge-p-minimum.json
OSCAL profile selecting those same four controls from the NIST 800-53 Rev 5 catalog.

## Evidence
Each implemented requirement links to the signed pipeline bundle for run 37241913272
in the vault bucket `cgep-lab-grc-evidence-vault-853f189f`. `verify-evidence.sh`
reported `Verified OK` on the signature. It also reported `FAIL: retention expired`,
because the bundle (uploaded 2026-10-04) is past the vault's retention window.
The links will be pointed at a fresh signed bundle before the capstone.

## Validation
`trestle validate` output is in `evidence/lab-6-1/trestle-validate.txt`.
