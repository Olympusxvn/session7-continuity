# Session 7 — Prompt Evolution · submission DRAFT

> **Status:** Draft skeleton — finalize after Days 1–5 live use.  
> **Do not submit yet.** Fill `[TODO after Day N]` placeholders with lived evidence.  
> **Contest:** Walrus Sessions 7 · Prompt Evolution  
> **Base prompt:** [continuity-keeper](https://github.com/yukitran03/continuity-keeper) (Session 5)  
> **Story under test:** `ca_voi_con` (crypto noir) · namespace `session7-continuity`  
> **Account (Session 7):** `0xd7ec125eb467c0cce65b219ff7ddeea217c16709077c2c48c183e47e80704287`  
> **Delegate pub:** `e69bc719e01d0582d7ff75a7e962a1f9a740a28ab76a4b4bb3aa63761ac8ff59`

**Form shape:**
1. Refactored prompt (full text) — §1  
2. What does your prompt do? — §2  
3. What did you change from the original — and why? (Before / After) — §3  
4. Feedback on using Walrus Memory — §4

**Honesty note:** Official MCP has **no** `memwal_delete`. **v3 is the submission prompt.** v2 archived. Harness = platform: [#591](https://github.com/MystenLabs/MemWal/issues/591) (await remember jobs; forget is sync) · [#592](https://github.com/MystenLabs/MemWal/issues/592) / PR [#605](https://github.com/MystenLabs/MemWal/pull/605) (**OPEN**, not merged; MCP knobs follow-up). Do not claim `SIGNAL_MUTATION` intercepts, a 15s exclusion cache, or surgical ID purge. Phase A stays on original prompt + entity namespaces until Day 3 CLI supersede. Log: [`ISSUES-591-592.md`](./ISSUES-591-592.md).

**Prompt versions:** [v1](./changelog/PROMPT-v1-context-engineering.md) · [v2](./changelog/PROMPT-v2-harness-contract.md) · **v3 final** [`prompt/FINAL_continuity-keeper.md`](../prompt/FINAL_continuity-keeper.md) · contract [`HARNESS-CONTRACT.md`](./HARNESS-CONTRACT.md)

---

## 1. Refactored Prompt (Share your prompt)

> Source of truth: `prompt/FINAL_continuity-keeper.md` (same as Phase B v3).

```markdown
# Continuity Keeper — Session 7 final (v3)

You are a fiction co-writer. Canon lives on **Walrus Memory** (official MemWal MCP). You own **narrative continuity**. The SDK/MCP **harness** should own token budgets, write-job waits, secrets, and retries — do not pretend those tools exist if they are missing.

## Tools (honest)

`memwal_recall` · `memwal_remember` · `memwal_remember_bulk` · `memwal_analyze` · optional `memwal_restore` / `memwal_login`.

**No** `memwal_delete`. Never invent one. Never wipe a namespace to fix one fact. Permanent blob removal: Walrus dashboard Delete (or wallet-signed Security Delete API).

One story namespace: `session7-continuity` (or the author’s slug). Not per-entity mini-namespaces.

## Canon graph (one fact = one node)

Treat the bible as a **state graph**, not a pile of chat:

- **Nodes** — typed notes, one fact per memory:
  `[canon:<type>] <entity> — <current state> (as of: <ch/scene>)`
  `type` ∈ `char | place | object | rule | term | event | relationship | timeline`
- **Edges** — `relationship` / `timeline` notes, plus `supersedes: <blob_id>` when recall already returned that id. Do not hunt hashes as a reasoning task.
- **Shared state** — one namespace so a character, a place, and a rule can associate in one recall.
- **Routing** — contradiction-guard is a **human-approval node**. No silent retcon; no CLI for normal supersession.

If `memwal_recall` exposes `maxTokens` / truncation (SDK PR #605; MCP follow-up), pass them. Else keep recall **scene-scoped**.

## Loop

1. **Recall first** — entities in play → `memwal_recall`. Use **current** nodes (`supersedes` wins over the old line).
2. **Contradiction-guard** — conflict → STOP: `⚠️ Continuity conflict. Canon: «…». This scene: «…». Retcon or revise?`
3. **Write** — only durable canon, only after the author finalizes. Never prose, brainstorming, scene-only detail, speculation, or secrets.
4. **Supersede (HITL)** — on `override canon:` / a confirmed retcon: preview the obsolete node → explicit yes → `memwal_remember` the new current state (neighbors stay). `✓ canon: …` / `↻ superseded: …`

Signals: `canon:` · `recall canon:` / `resume story` · `override canon:`.

## Fallbacks (official MCP today)

- After remember: if a job/status is returned, wait until **done**; else wait ~10–15s or restore then recall. Missing *new* facts ≈ unawaited write (#591) — not a 15s “index wipe.”
- Prefer notes that `supersedes` a kept `blob_id`. Skip writes at cosine distance **< 0.25**.
- Refuse keys / `.env` / seeds. On **429**, wait ~60s, retry once.

## Do not

- Claim the harness intercepts a magic token and surgically deletes by `memory_id`.
- Run Continuity CLI for normal Phase B supersession.
- Dump unbounded recall into the draft.
```

---

## 2. What does your prompt do?

**(What it remembers · when · how)**

This prompt turns the agent into a **canon policy** for long-form co-writing on Walrus Memory — not a vague “please remember.” Canon is modeled as a small **state graph** (typed nodes, supersede edges, HITL routing) on **one** namespace.

| Axis | Instruction |
|------|-------------|
| **What it remembers** | Only durable, typed canon: chars, places, objects, rules (+ cost), events, relationships, terms, timeline. Structured `[canon:…]` notes. Bans prose dumps, brainstorming, secrets. |
| **When it acts** | **Recall** before every scene. **Contradiction-guard** before finalize. **Write** only after the author finalizes a scene. **Supersede** only when plot state truly changes and the author confirms. |
| **How it acts** | Official MemWal MCP. Unified namespace. Human-gated supersede (preview → confirm → new fact with `supersedes:` when `blob_id` is already in recall). Use `maxTokens` if the tool exposes it (PR #605); else scene-scope. Permanent removal stays on dashboard / signed API. Job-wait and token budget belong in SDK/MCP, not ID surgery in the LLM. |

**Live test story (Session 7):** `ca_voi_con` — crypto noir. Minh “Baby Whale”, Lan “Oracle”, Harbor Node, Tide Signal rule, Tide Ledger. Day 3 twist: fake signal → public liquidation → backup-wallet return / allegiance flip — chosen specifically to force a supersession under both Phase A (CLI) and Phase B (inline).

**Proof (Days 1–4, Mainnet — Day 5 still open):**

| Field | Value |
|-------|--------|
| MemWal account | `0xd7ec125eb467c0cce65b219ff7ddeea217c16709077c2c48c183e47e80704287` |
| Delegate public key | `e69bc719e01d0582d7ff75a7e962a1f9a740a28ab76a4b4bb3aa63761ac8ff59` |
| Story namespaces | Phase A: `ca_voi_con::char::minh` etc. MCP env default: `session7-continuity` |
| Unique Mainnet blob_ids (CLI `count`) | **30** (Days 1–4 ledger; incl. forgotten #591 probe blob). Story facts ≈ **29**. |
| Phase A supersede (CLI) | 2026-08-14: `supersede --story ca_voi_con --type char --entity "Minh"` (+ Lan, Tide Ledger, Red Buoy). After await: recall = liquidated+backup, **not** independent-alive. |
| Phase B inline supersede | 2026-08-15: one ns `session7-continuity`; no CLI forget. Previewed obsolete Minh allegiance `CDx1J2d5JkfczqjT2tioW52GlyYEwERQljHyTU4AWWU` → `memwal_remember` current Dry Dock node `kyYS4X5wpxiVmp9Zn858NrfNedu7hegKJqm_WnXFRvU` with `supersedes: CDx1J2d5…`. Unified recall returned Minh + Dry Dock + Lan + Tide Signal in one query. |
| Diary | `logs/diary.md` |

---

## 3. What did you change from the original — and why?

### Before / After (lived, not theoretical)

| | **Before — original Continuity Keeper (Phase A, Days 1–3)** | **After — v3 prompt (this submission)** |
|--|--------------------------------------------------------------|----------------------------------------|
| **What we ran** | Their prompt + `continuity` CLI + **per-entity** namespaces | One story namespace; HITL supersede **in chat**; no CLI for normal retcon |
| **Canon change** | `forget` whole entity ns, then rewrite a facts file | Preview → author confirm → `memwal_remember` current node + `supersedes:` if `blob_id` already in recall |
| **Author flow** | Leave chat → terminal → wait 429 → paste facts back | Stay on the page (Days 4+). Day 3 measured the old path: **~8–10 min**, **two HTTP 429** (`30 weighted-requests/min`, `retry_after_seconds: 60`) |
| **Amnesia risk** | Real. Live `recall` on Minh was **0 hits** (`dropped_count: 2`); `restore` **skipped** every story ns. We rebuilt Minh’s current sheet from `.continuity/blobs.log` so hoodie / one-ear survived the “death.” | v3 keeps neighbors by **not** namespace-wiping; appearance stays unless the author retires that node |
| **Freshness** | We *thought* forget leaked stale vectors for 15s. **Measured:** same-ns `forget` then immediate `recall` → `deleted:1`, `total:0` — **not stale.** Team was right on [#591](https://github.com/MystenLabs/MemWal/issues/591). | Prompt says: await remember job if exposed; do not invent a 15s index-wipe. MCP still lacks `waitForRememberJob` on the tool surface |
| **Proof recall (Minh)** | Ch.0/Ch.1: alive, independent, Booth 7, flat | After CLI supersede + `rememberAndWait`: only Ch.2 — liquidated on the book, alive on backup wallet, allegiance flipped. Retired “independent alive” **did not** return |

**Story beat used as the test:** `ca_voi_con` Ch.2 — Lan plants a fake Red Buoy signal for North Pier Capital; Minh waits 60 minutes (rule held), is publicly liquidated, returns via Tide Ledger backup seed; mentor bond broken.

| Component | Original | v3 |
|-----------|----------|-----|
| Storage | `{story}::char::{slug}` mini-namespaces | One namespace; typed `[canon:]` **nodes**; `supersedes:` / relationships as **edges** |
| Routing | CLI `supersede` | Contradiction-guard = **human-approval node** |
| Token budget | Prompt “limit k” | Scene-scoped recall; use `maxTokens` **if** MCP grows PR [#605](https://github.com/MystenLabs/MemWal/pull/605) knobs (**PR still OPEN**, not merged) |
| Delete | Namespace `forget` | Never invent `memwal_delete`; dashboard / signed API for permanent blob removal |

### Why (engineering — from the run)

1. **CLI supersede works, and it hurts.** Forget+rewrite on `ca_voi_con::char::minh` retired 2 rows, wrote 3 current facts, and later recall was clean. The cost was context-switch, **429**, and rewriting from a **local ledger** when live recall dropped. Novelists should not need that. v3 moves the *policy* into chat; it does not fake an MCP delete.
2. **Namespace wipe is the wrong primitive for one plot beat.** Minh’s appearance had to be re-typed by hand. That is the amnesia the original README already warned about. Typed nodes + HITL beat forget-the-whole-character.
3. **We were wrong about forget-lag; we keep that in the prompt.** Probe `ca_voi_con::probe::bug591`: rememberAndWait → 1 hit → forget → immediate same-ns recall **empty**. Posted: [comment on #591](https://github.com/MystenLabs/MemWal/issues/591#issuecomment-5291423797). The harness gap that remains is **MCP-visible wait-for-remember-job**, not a client exclusion cache (team declined that).
4. **Cross-entity recall** — mini-namespaces cannot associate Minh × Harbor Node × Tide Signal in one query. One shared namespace is the v3 storage change. We do **not** claim a `graph.html` runtime.

### What we kept from the original (credit)

Recall-first · contradiction-guard · durable-canon-only · cosine dedup (`< 0.25` skip; Day 2 skipped 3 near-duplicates) · `[canon:<type>]` notes.

---

## 4. Feedback on using Walrus Memory

Copy-paste for the Session 7 / DeepSurge feedback field. Issues: [#591](https://github.com/MystenLabs/MemWal/issues/591) · [#592](https://github.com/MystenLabs/MemWal/issues/592) · PR [#605](https://github.com/MystenLabs/MemWal/pull/605).

**What worked**

- Production relayer + `@mysten-incubation/memwal` CLI `rememberAndWait` / `rememberBulkAndWait` landed durable Mainnet blobs. **30 unique blob_ids** on account `0xd7ec…4287` after Days 1–5 of a real story (`ca_voi_con`). Day 4–5 also used official MCP `memwal_remember` / `memwal_recall` on `session7-continuity`. Overnight Day 5 recall still preferred current Dry Dock + neighbors.
- After a successful wait, semantic recall is good enough for canon: cosine dedup fired correctly on Day 2; Day 3 post-supersede recall returned **only current** Minh/Lan/Tide Ledger facts.
- Collaborator review on #591 was accurate and falsifiable. We reproduced their claim: **`forget` on an exact namespace is synchronous** — immediate recall does not return the deleted marker. Thank you for pushing back on the 15s “indexer lag” story.
- #592 was not ignored: SDK PR #605 implements `maxTokens` / truncation client-side. MCP knobs are still a follow-up.

**What hurt (DX, not a prompt trick)**

- **Official MCP in Cursor:** Settings showed `memwal` green; this agent chat often had **no** `memwal_*` tools. Phase A writes went through the Continuity CLI (same credentials). “MCP-only” prompts fail if the tool surface is missing.
- **429** on `delegate_key`, 30 weighted-requests/min, 60s retry. Day 3 supersede of four entities + accretive writes took **~8–10 minutes** with two hard 429s. CLI retries of 1–2s are too short vs `retry_after_seconds: 60`.
- **Empty recall / `dropped_count`:** After blobs had been awaited days earlier, `recall` on `ca_voi_con::char::minh` returned `results: []` with `dropped_count: 2`. `restore(ns)` reported `restored: 0, skipped: N, total: N` on every story namespace. Lan `supersede` then **retired 0** old rows. Separate from forget-staleness — looks like decrypt/skip of index rows. Filed on #591 as an adjacent note.
- **MCP has no `memwal_delete` and no job-wait tool.** Agents that `remember` then `recall` in the next turn will read pre-`done` state. That belongs in the MCP harness (`waitForRememberJob` / status), not in a 15s sleep myth.
- **Namespace `forget` is too coarse** for one character beat (appearance almost lost). Entry-level retire is still the product ask (#444 / #464).

**What we will not claim**

- That a prompt intercepts `SIGNAL_MUTATION` and surgically deletes by `memory_id`.
- That PR #605 is merged or that MCP `memwal_recall` already takes `maxTokens`.
- That forget leaks stale vectors for 15s on the same namespace (our probe: **total 0**).

---

## After Day 5 — finish checklist

- [x] v3 final in `prompt/FINAL_continuity-keeper.md` (v1–v2 under `docs/changelog/`)
- [x] Before/After + Walrus Memory feedback from Days 1–3 (#591 probe: forget not stale; 429; dropped_count)
- [x] Day 4 inline supersede evidence (Dry Dock `kyYS4X5w…` supersedes `CDx1J2d5…`; unified ns recall) · blob count **30**
- [x] Article 10 rewritten (lived Days 1–4; honest #605 OPEN) — `docs/ARTICLE_10.md`
- [x] Day 5 proof pack — [`docs/DAY5_PROOF.md`](./DAY5_PROOF.md) · overnight recall [`logs/day5-recall.md`](../logs/day5-recall.md)
- [x] DeepSurge paste §3 / §4 ready in DAY5_PROOF + this file
- [x] Re-read: **no** invented `memwal_delete` · **no** “PR #605 merged” · **no** SIGNAL_MUTATION · **no** 15s forget-lag
- [ ] Inkray publish URL (interim blog = repo Article 10)
- [ ] Optional X `#Walrus` + chat screenshots
- [x] MemWal GitHub feedback: [#591](https://github.com/MystenLabs/MemWal/issues/591) · [#592](https://github.com/MystenLabs/MemWal/issues/592) → PR [#605](https://github.com/MystenLabs/MemWal/pull/605) (open)
- [x] Locked: no local MCP wrapper · Day 3 CLI before namespace switch

## Related local paths

- Story: `STORY.md`
- Day 0: `DAY0_CHECKLIST.md`
- Friction log: `logs/diary.md` · blobs: `logs/blob-log.md`
- Phase A prompt: `prompt/PHASE_A_continuity-keeper.md`
- Article: [`docs/ARTICLE_10.md`](./ARTICLE_10.md) (same text as `../memory_story/docs/ARTICLE_10_continuity_keeper_evolution.md`)
- Guide: `../memory_story/docs/SESSION7_MAINNET_TEST_GUIDE.md`
