record.proof — Verification Instructions (FINALIZE pack v1.0)

This verification confirms integrity only.
It does not assert truth, endorsement, or authority.

Steps:
1) Download the hash manifest:
   finalize_pack_v1.0.sha256

2) Download the referenced files:
   proofs/proof_object_finalize_v1.0.json
   proofs/inputs/finalize_payload.json
   proofs/inputs/finalize_receipt.json

3) Verify (fail-closed):
   sha256sum -c finalize_pack_v1.0.sha256

Optional:
Run verify/verify_finalize_pack.sh (equivalent to manual steps).
