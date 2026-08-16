# Day 5 — Proof pack (2026-08-16)

Overnight recall on official MCP. No CLI forget. No namespace wipe. PR [#605](https://github.com/MystenLabs/MemWal/pull/605) still **OPEN**.

## DeepSurge collect

| Field | Value |
|:------|:------|
| **MemWal account / agent ID** | `0xd7ec125eb467c0cce65b219ff7ddeea217c16709077c2c48c183e47e80704287` |
| **Delegate pub** | `e69bc719e01d0582d7ff75a7e962a1f9a740a28ab76a4b4bb3aa63761ac8ff59` |
| **Blob count** | **30** unique in ledger (29 story + forgotten #591 probe). Contest floor ≥10. |
| **Namespace** | Phase B: `session7-continuity`. Phase A: `ca_voi_con::char::minh` etc. |
| **Full prompt** | [prompt/FINAL_continuity-keeper.md](https://github.com/Olympusxvn/session7-continuity/blob/main/prompt/FINAL_continuity-keeper.md) |
| **Blog** | Article 10 in-repo: [docs/ARTICLE_10.md](https://github.com/Olympusxvn/session7-continuity/blob/main/docs/ARTICLE_10.md). Inkray **URL after you publish** (series: [OlympusXVN](https://inkray.xyz/publication?id=0xa3d88b07abce3f78c372451682754c63724f04f2849d2ab14cc56fe3c003b721)). |
| **GitHub** | https://github.com/Olympusxvn/session7-continuity |
| **Issues** | [#591](https://github.com/MystenLabs/MemWal/issues/591) · [#592](https://github.com/MystenLabs/MemWal/issues/592) · PR [#605](https://github.com/MystenLabs/MemWal/pull/605) **OPEN** · related [#444](https://github.com/MystenLabs/MemWal/issues/444) |
| **X / screenshots** | Author: post `#Walrus` + hero `docs/images/article-10-hero.png`. Chat screenshots still optional. |
| **Evidence of use** | This file + [logs/day5-recall.md](../logs/day5-recall.md) + [logs/diary.md](../logs/diary.md) |

## Overnight recall (the test)

`memwal_health`: `status=ok version=0.1.0`  
Query: `canon story ca_voi_con Minh Dry Dock Lan Tide Signal Harbor Node` · ns `session7-continuity` · limit 15

**Current nodes only.** Dry Dock + `supersedes: CDx1J2d5…` rank first. Hoodie / one-ear still present. Tide Signal 60m still present. No “independent Booth 7 regular.”

See [logs/day5-recall.md](../logs/day5-recall.md).

## Restore note (same class as Day 3)

`memwal_restore` ns `session7-continuity` `limit=100`:

`total=5  restored=0  skipped=5  truncated=true`

Recall still returned **6** current facts. Restore-skip ≠ empty bible. Do not namespace-wipe to “fix” it.

## Day 5 write attempt

One timeline node (Ch.4 still-at-Dry-Dock). MCP `remember` **timed out twice** (`job_id=90a96318-…`, `f1692e49-…`). Post-wait recall did **not** show the new line. **Did not** third-write or CLI-forget. Count stays **30**. Scene only: [logs/scenes/ch4-day5-proof.md](../logs/scenes/ch4-day5-proof.md).

## Author still does

1. Publish Article 10 on Inkray → paste URL into DeepSurge **Blog**.
2. Optional: X screenshot + `#Walrus`.
3. Paste §3 / §4 below into the form (already in [submission-DRAFT.md](./submission-DRAFT.md)).

---

## Paste — §3 Before / After

```
Before (Days 1–3, original Continuity Keeper): per-entity namespaces + CLI supersede (forget whole {story}::char::{slug}, rewrite a facts file). Day 3: ~8–10 min, two HTTP 429 (30 weighted-requests/min). Minh recall 0 hits (dropped_count: 2); restore skipped every story ns; hoodie rebuilt from local blobs.log.

After (v3 / EvoPrompt 26, Day 4+): one namespace session7-continuity; HITL in chat; memwal_remember + supersedes: <blob_id>. Day 4: CDx1J2d5… → kyYS4X5w… (Dry Dock). Overnight Day 5 recall still prefers Dry Dock + Lan + Tide Signal + appearance together. No memwal_delete. No 15s index-wipe (probe: forget then immediate recall total 0). PR #605 OPEN, not merged.
```

## Paste — §4 Walrus Memory feedback

```
Worked: 30 unique Mainnet blob_ids on 0xd7ec…4287. rememberAndWait + MCP remember landed. Day 2 cosine skip ×3. Day 3 post-await recall = current Ch.2 only. #591 collaborator was right: same-ns forget is sync (our probe total 0). #592 → SDK PR #605 (OPEN).

Hurt: MCP green but tools often missing from the agent (Days 1–3 used CLI). 429 / 60s retry. dropped_count + restore skipped=N (Day 3 entity ns; Day 5 unified ns restore 0/5 skip). MCP has no memwal_delete and no waitForRememberJob (Day 4 bulk 2/6 timeout; Day 5 remember timed out twice). Namespace forget is too coarse for one plot beat.

Will not claim: SIGNAL_MUTATION intercept; surgical MCP delete; PR #605 merged; 15s forget-lag as the general bug.
```
