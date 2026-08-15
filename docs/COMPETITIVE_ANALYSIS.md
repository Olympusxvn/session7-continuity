# Technical Evaluation Matrix — Session 7

**Status:** Lived scores from Days 1–4 on Walrus Mainnet. Not marketing.  
**Unit under test:** [Continuity Keeper](https://github.com/yukitran03/continuity-keeper) (Session 5 original) vs this repo’s **v3**.  
**Out-of-class reference:** `memwal_assistant` (our prior architect-memory prompt) — included so the trade-off is explicit, not so fiction and infra prompts are ranked as the same product.

Scale: **1 = fails the job** · **3 = works with pain** · **5 = measured, honest, usable**.  
A “5” is not “perfect product.” It means *this prompt did not lie about the tools and the story bible survived a real twist.*

---

## Why this matrix exists

2026 prompt work is eval-driven: a rewrite is not an improvement until it beats a baseline on named axes. We used the original Continuity Keeper for real (Days 1–3, CLI supersede, entity namespaces), then shipped v3 (Days 4+). Scores below cite diary / blob log / GitHub — not vibes.

We also audited **our own** `memwal_assistant` line: strong as a systems-memory prompt, **weak as a lore engine**. Carrying its matrix into a novelist’s loop is the wrong abstraction. Continuity Keeper was the right base to evolve.

---

## Matrix

| Axis | What we measured | Original CK (Phase A) | memwal_assistant (prior) | **EvoPrompt 26 / CK v3** |
|:-----|:-----------------|:---------------------:|:------------------------:|:------------------------:|
| **Stay in chat for retcon** | Leave IDE → CLI → paste facts? | **2** — Day 3: ~8–10 min, two HTTP 429 | **3** — chat-native remember; no lore HITL | **5** — Day 4: preview → `memwal_remember` + `supersedes:` |
| **One-fact update** | Change allegiance without wiping the character | **1** — `forget` whole `{story}::char::{slug}` | **2** — append-only; no typed retire | **5** — new node; neighbors stay; no `memwal_delete` invented |
| **Cross-entity recall** | Minh × place × rule in one query | **1** — mini-namespaces cannot join | **3** — one ns, untyped dump risk | **5** — Day 4 unified `session7-continuity` returned Minh + Dry Dock + Lan + Tide Signal |
| **Amnesia under “death”** | Appearance survive public liquidation | **2** — recall 0 hits (`dropped_count: 2`); rebuilt from local `blobs.log` | **3** — depends on what was stored | **5** — hoodie / one-ear kept without a facts-file rewrite |
| **Tool honesty** | Prompt matches official MCP | **3** — CLI `supersede` is real; MCP-only claim fails when tools missing | **2** — easy to over-claim helper APIs | **5** — lists real tools; **no** `memwal_delete`; harness = platform |
| **Freshness model** | Stale recall after forget / write | **3** — we *believed* 15s indexer lag; **probe falsified it** | **2** — sleep/retry folklore | **4** — forget is sync ([#591](https://github.com/MystenLabs/MemWal/issues/591)); MCP still has no job-wait tool |
| **Secret refusal** | Keys / `.env` / seeds | **4** — original bans secrets | **4** | **5** — explicit refuse; Tide Ledger stores *state* not the phrase |
| **Dedup** | Cosine skip `< 0.25` | **4** — Day 2 skipped 3 near-duplicates | **2** — not lore-tuned | **4** — same rule, kept |
| **Prompt-as-code** | Versioned files, Cursor rule, MCP config | **2** — upstream prompt + CLI | **4** — rules/MCP in repo | **5** — `prompt/` v1–v3 changelog, `.cursor/rules`, `mcp.json` |
| **Eval artifact** | Numbers a judge can re-read | **1** — no matrix | **1** — no Session 7 matrix | **5** — this file + `logs/diary.md` + `logs/blob-log.md` |
| **Upstream loop** | Issues / PR, not prompt theater | **n/a** | **n/a** | **5** — [#591](https://github.com/MystenLabs/MemWal/issues/591) · [#592](https://github.com/MystenLabs/MemWal/issues/592) · PR [#605](https://github.com/MystenLabs/MemWal/pull/605) **OPEN** |

**Read the freshness 4 correctly:** v3 does **not** hide a 15-second index wipe. Team: missing *new* facts ≈ `remember` not awaited. We reproduced: same-ns `forget` → immediate `recall` `total: 0`. MCP agents still cannot `waitForRememberJob` on the tool surface — that is a **platform** gap, scored honestly.

---

## Mutations we killed (eval, not taste)

| Candidate mutation | Why it looked attractive | What eval did |
|:-------------------|:-------------------------|:--------------|
| Surgical `memory_id` purge in the prompt | Feels like a precise `DELETE` | Official MCP has **no** `memwal_delete`. Claiming intercept/`SIGNAL_MUTATION` is a lie. **Killed.** |
| 15s client exclusion cache | Feels like hiding indexer lag | Collaborator on #591 declined TTL cache; our probe: forget is **not** stale. **Killed.** |
| Local MCP wrapper | Feels like owning the harness | Contest ships a **prompt**. Job-wait / `maxTokens` belong in SDK/MCP (PR #605 open). **Killed.** |
| Keep per-entity namespaces in Phase B | Feels compatible | Cannot associate char × place × rule. Phase A kept them until Day 3 CLI was done; Phase B is one ns. |

The mutation that **shipped:** namespace-wipe CLI → **HITL node + `supersedes:` edge** on one namespace. Graph language = canon model (nodes/edges/approval), not a `graph.html` runtime.

---

## Trade-offs (cold)

| We accepted | Cost | Why |
|:------------|:-----|:----|
| Old blobs stay on Walrus | Recall can still surface a superseded line until the author prefers `supersedes:` | Immutable storage; permanent remove = dashboard / signed API |
| Phase A still uses original CLI | Two-namespace history (`ca_voi_con::*` + `session7-continuity`) | Honest before/after; Day 3 pain is the evidence |
| Scene-scoped recall | Not a token-accurate budget | MCP `maxTokens` is a follow-up to PR #605 (**not merged**) |
| No local wrapper | Day 1: MCP green, tools often missing from the agent | We used CLI with the same wallet; we did not fake MCP-only Days 1–3 |

---

## Evidence pointers

| Claim | Where |
|:------|:------|
| ≥10 Mainnet blobs (contest floor); **30** unique in ledger | [`logs/blob-log.md`](../logs/blob-log.md) · CLI `count` |
| Day 3 CLI pain (429, ~8–10 min, appearance almost lost) | [`logs/diary.md`](../logs/diary.md) |
| Day 4 HITL: `CDx1J2d5…` → `kyYS4X5w…` | Diary + blob log |
| Forget not stale | [#591 comment](https://github.com/MystenLabs/MemWal/issues/591#issuecomment-5291423797) |
| What v3 actually says | [`prompt/FINAL_continuity-keeper.md`](../prompt/FINAL_continuity-keeper.md) |

---

*Session 7 · Prompt Evolution · scored 2026-08-15 · Day 5 blog still open*
