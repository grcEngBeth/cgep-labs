
## Lab 4.4: Evidence Management and Chain of Custody

Each pull request now produces a signed, timestamped bundle of evidence that is stored in an immutable vault. An auditor can verify it with one command: `scripts/verify-evidence.sh <run_id>`.

| Property | What it means | Artifact that proves it |
|---|---|---|
| Authenticity | The evidence came from this repo's workflow | `cosign verify-blob` succeeds against the `.sig.bundle`, which holds a short-lived Fulcio certificate tied to the GitHub Actions identity |
| Integrity | The evidence hasn't changed since it was produced | The `.sha256` file stored beside the bundle; the verify script recomputes the hash and compares |
| Timeliness | There is a trustworthy record of when it was produced | The Rekor transparency log entry referenced inside the `.sig.bundle` |
| Preservation | The evidence is still there and protected | S3 Object Lock retention on the bundle in `cgep-lab-grc-evidence-vault-853f189f`, checked via `get-object-retention` |

**Verified run:** 37241913272. Output ended with `Verified OK` and `CHAIN INTACT for run 37241913272`. Receipt: `evidence/lab-4-4/receipt.json`.

**Tamper test:** I downloaded the bundle, appended one line, and re-hashed it. The SHA-256 changed from `13d6368d...` to `d7a6534c...` and no longer matched the stored hash, so verification fails at the integrity check. The vault copy was never modified, and Object Lock refuses overwrites.

**Design note:** The gate step records pass or fail without ending the job, signing and upload always run, and a final "Enforce gate" step fails the build afterward. A failing PR therefore still leaves signed evidence.
