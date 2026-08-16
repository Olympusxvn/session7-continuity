# Blob log — session7-continuity

**Target:** ~21 Mainnet blobs · **Namespace env:** `session7-continuity`  
**Story:** `ca_voi_con` · Phase A entity ns · Phase B unified `session7-continuity`

| Day | Date | ~new blobs | Notes |
|-----|------|------------|-------|
| 0 | 2026-08-11 | 0 | Setup only |
| 1 | 2026-08-12 | 7 | Seed bible via Continuity CLI (MCP tools not in agent tool list) |
| 2 | 2026-08-13 | 6 | Ch.1 scene; 3 candidates skipped (dedup <0.25: place Booth 7, Tide Ledger, near-copy timeline) |
| 3 | 2026-08-14 | 10 | CLI supersede Minh/Lan/Tide Ledger/Red Buoy + 3 accretive. 429 twice. Pre-recall dropped_count (restore skipped). |
| 4 | 2026-08-15 | 6 | v3 HITL + unified `session7-continuity`. Bulk 2/6 timeout; singles landed. Event write 429 then job timeout (skipped). |
| 5 | 2026-08-16 | 0 | Proof recall clean. Restore 0/5 skip. Timeline remember timed out ×2 (not retried). |
| **Total** | | **30** unique in ledger (29 story + forgotten #591 probe) | |

## Line items (one line per remember)

```
# Day1
# - [canon:char] Minh — Baby Whale / alive / Harbor Node regular → ca_voi_con::char::minh → ab3z-g7Qii1F_-NsmomPudnq1WduujP4PU6gvK5hYZQ
# - [canon:char] Lan — Oracle / researcher → ca_voi_con::char::lan → VNr-z6232X-whDAekM6uFr3dp127L0QcnL01wlnWYg0
# - [canon:place] Harbor Node → ca_voi_con::place::harbor-node → _x7IevytA-_xKMNBpucgJelJ9uICP4W_kVECn7SyrSs
# - [canon:rule] Tide Signal + 60m cost → ca_voi_con::rule::tide-signal → 8sPd_xsc9fDe24b1TDsUN9LrOdrk8zqc9VZevJxuWNw
# - [canon:object] Tide Ledger intact → ca_voi_con::object::tide-ledger → ZLz8milVMvAwwHNNTnH-KIvG75hfXJCYTaf1H-Ry6Mk
# - [canon:timeline] Ch.0 Harbor Node open → ca_voi_con::timeline → 5K4AVJn8FMF5NPXl8qY4lD91tHHE-QrsbQ5XOoRIbxs
# - [canon:relationship] Lan mentors Minh → ca_voi_con::relationships → XrNwu3DMpBhJKC46Ju1cjYMosX4qYJCW86epY5ow7rI
# Day2
# - [canon:char] Minh — Booth 7 / flat after wait (Ch.1) → ca_voi_con::char::minh → WFwcSmawRnE4i6wJYO7hNC-W_J2r7X08gyYi51KeDgw
# - [canon:char] Lan — cracked exchange tablet (Ch.1) → ca_voi_con::char::lan → YPsPM4jcLcJLphukWqPn0KiqLeupaOdsnfzJ7XhP8d4
# - [canon:term] baby whale slang → ca_voi_con::term::baby-whale → 1EKIkftT1VGWRvwhzPUqiwfKDSmQWlsKkpMjZl0ODsg
# - [canon:term] Red Buoy cluster NGH/USDC → ca_voi_con::term::red-buoy → LqNVxuBvNEb9cOH6sweAEK73AI9Ux9s3rt7Xzz3LSKI
# - [canon:event] First clean Tide Signal wait held → ca_voi_con::events → 28oN2xK8yxbNuZ-F4dhJ1i9rH-zsQL4q5zsWL6bcxbA
# - [canon:timeline] Ch.1 wait sixty minutes Booth 7 → ca_voi_con::timeline → LcjWfzueB-YV7UsxY-wsq6b6f4Tdqcyk9UX-l3l-6Eg
# Day3 supersede + accretive
# - [canon:char] Minh ×3 (appearance / liquidated+backup / allegiance flip) → VM7CSQpid8bW36mO2XFDnA8BByDMZM5lTQSl3qTAyBU · O9sGh5asVZTGdQ51VWFit26tfLQwkdEr354K3ARy8V0 · CDx1J2d5JkfczqjT2tioW52GlyYEwERQljHyTU4AWWU
# - [canon:char] Lan ×2 (Oracle tablet / fake signal North Pier) → _TU3v2IxofySmkaCLU9QERTZ9OFHoUin-nj5E7oFdic · piVxUFPkXU643QVRhxGGo8SPCsmKRV6aCilx4KVH5D0
# - [canon:object] Tide Ledger seed opened → f7783vWnhpw6t6WFpQRNDi5t8abmlca3H5izw7DIwM0
# - [canon:term] Red Buoy fake planted → B1jrZe9V4ZYLJlOETTh1w6ZAjrk7ljfVrJ4IhDO3RRQ
# - [canon:event] Fake Red Buoy liquidation → 9wvFg9ci0bQAVzzVKgC9zY-y2jWiz0xngAv-q5hIvfo
# - [canon:timeline] Ch.2 → pY0ehZVu3rT97wGmhK-VqlivVG-NJFHFswHuj---X30
# - [canon:relationship] Lan betrayed Minh → Ja93FY8Vi9_TEtwgA311Pa4Gx6R9fVFi79Ye86IbpVs
# Day4 MCP session7-continuity
# - [canon:char] Minh appearance (Ch.3) → ts7cYWoUUijlVERBHNBvNb5AnQqOudI9I23lE_cQA9M
# - [canon:char] Minh liquidated+backup (Ch.3) → QzFeVnkRobck6bUoWbV2NwOGxgwRuAFBz0OobLPT_OI
# - [canon:char] Minh Dry Dock / refused North Pier (HITL supersedes CDx1J2d5…) → kyYS4X5wpxiVmp9Zn858NrfNedu7hegKJqm_WnXFRvU
# - [canon:place] Dry Dock → 3Oj4xUVtu-b5f8zANA1hhHD8Scm0IVNlLQw_Fxr4ZWo
# - [canon:char] Lan fake signal (shared ns) → ktd0wePeWtzARa3WmeCA52T2y5AGteUSB0Sb6nO78ik
# - [canon:rule] Tide Signal 60m (shared ns) → LlwWFNjxHiYL41wf3oAXILRNWnYxRUAwcz9cWEsEe64
```
