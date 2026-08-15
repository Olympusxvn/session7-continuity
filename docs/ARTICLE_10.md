# Evolving Continuity Keeper: An Architectural Audit of Story-Canon Memory on Walrus

**Subtitle:** For Walrus Sessions 7 I used a Session 5 story-bible prompt for real, measured where it broke a novelist’s loop, and shipped a thinner v3 — then filed the gaps that belong in the SDK, not in the prompt.

**Status:** Ready for Inkray after Day 5 screenshots · Article 10 (Session 7 · Prompt Evolution)  
**Repo:** [Olympusxvn/session7-continuity](https://github.com/Olympusxvn/session7-continuity)  
**Voice:** First-person builder · architectural audit · EN  
**Display name:** EvoPrompt 26 — Harness & Graph-Native Lore Engine  
**Base prompt:** [continuity-keeper](https://github.com/yukitran03/continuity-keeper) (Session 5)  
**Shipped prompt:** Continuity Keeper **[v3](https://github.com/Olympusxvn/session7-continuity/blob/main/prompt/FINAL_continuity-keeper.md)**  
**Namespace:** `session7-continuity` · story `ca_voi_con`  
**Series:** [OlympusXVN on Inkray](https://inkray.xyz/publication?id=0xa3d88b07abce3f78c372451682754c63724f04f2849d2ab14cc56fe3c003b721)

| Evidence | Link |
|:---------|:-----|
| README (judge path) | [README.md](https://github.com/Olympusxvn/session7-continuity/blob/main/README.md) |
| Prompt v3 (copy-paste) | [prompt/FINAL_continuity-keeper.md](https://github.com/Olympusxvn/session7-continuity/blob/main/prompt/FINAL_continuity-keeper.md) |
| Eval matrix | [docs/COMPETITIVE_ANALYSIS.md](https://github.com/Olympusxvn/session7-continuity/blob/main/docs/COMPETITIVE_ANALYSIS.md) |
| Diary (Days 0–4) | [logs/diary.md](https://github.com/Olympusxvn/session7-continuity/blob/main/logs/diary.md) |
| Blob log (30 ids) | [logs/blob-log.md](https://github.com/Olympusxvn/session7-continuity/blob/main/logs/blob-log.md) |
| Scenes Ch.1–3 | [logs/scenes/](https://github.com/Olympusxvn/session7-continuity/tree/main/logs/scenes) |
| This article | [docs/ARTICLE_10.md](https://github.com/Olympusxvn/session7-continuity/blob/main/docs/ARTICLE_10.md) |

Walrus Sessions 7 asks something unusual: don’t build from scratch. Take a **proven Prompt Jam prompt**, use it for days, find where it strains, and evolve it.

I picked [continuity-keeper](https://github.com/yukitran03/continuity-keeper) — a wallet-owned *story bible* on Walrus Memory. A plot twist is the hardest honest use of `remember` / `recall`: current canon has to **change**, and neighbors (a hoodie, a rule, a place) have to **stay**.

I spent Session 5 on [memwal_assistant](https://github.com/Olympusxvn/memwal_assistant), typed ADRs for software teams. That prompt is the wrong product for a novelist. Continuity Keeper was the right base. This article is an **architectural audit and platform-evolution report** — cold, scored, and lived on Mainnet — not a takedown for sport.

---

## 1. The pain: canon amnesia, and a novelist in the terminal

The original framework is not naive. It is a considered workaround for an API that, at design time, only exposed **namespace-level** `POST /api/forget`. The cost of that workaround, used at drafting speed, is still a UX fracture.

Forcing a writer to break creative velocity, leave the scene, open a shell, and run a Node wrapper (`cli.mjs supersede --type char --entity … --facts-file …`) just to flip one allegiance is a **developer’s bias** against the person the tool claims to serve. The CLI is deterministic. Novelists do not live in bash.

The second cost is **localized agent amnesia**. `forget` on `{story}::char::{slug}` treats decentralized memory like a formatted partition: one expired plot state, and the whole character profile is eligible to vanish from recall. Appearance, traits, the boring facts you need tomorrow — gone with the twist, unless a human retypes them from a local ledger.

I did not argue this from a whiteboard. I ran **their** prompt, **their** CLI, **their** per-entity namespaces for Days 1–3.

---

## 2. What continuity-keeper gets right

Credit first. The original prompt already has the discipline most “please remember my story” systems lack:

- **Recall before writing** — every scene pulls in-scope canon first.
- **Contradiction-guard** — a conflicting draft stops; it does not silently retcon.
- **Durable canon only** — tight `[canon:] — (as of:)` notes; no prose dumps, no brainstorming.
- **Cosine dedup** — near-duplicates skip (`< 0.25`). Day 2 of this run skipped three.
- **Honest trade-off** — the README states that public delete was namespace-level, and builds micro-partitions *because of that*.

I kept every one of those. The evolution is not “they forgot research.” It is: the **mutation primitive** is wrong for one plot beat, and the **author should not leave the page**.

---

## 3. Audit matrix (lived, not theoretical)

2026 prompt work is eval-driven: a rewrite is not an improvement until it beats a baseline on named axes. Full scoring notes: [docs/COMPETITIVE_ANALYSIS.md](https://github.com/Olympusxvn/session7-continuity/blob/main/docs/COMPETITIVE_ANALYSIS.md). Condensed:

| Dimension | Original CK (Days 1–3, their CLI) | memwal_assistant (Session 5, out of class) | **v3 / EvoPrompt 26 (Day 4+)** |
|:----------|:----------------------------------|:-------------------------------------------|:-------------------------------|
| Author stays in chat | **2** — Day 3: ~8–10 min, two HTTP 429 | **3** — chat-native; not a lore HITL | **5** — preview → `remember` + `supersedes:` |
| One-fact update | **1** — `forget` the whole character ns | **2** — append-only | **5** — new node; neighbors stay |
| Cross-entity recall | **1** — mini-namespaces cannot join | **3** — one ns, dump risk | **5** — Minh × Dry Dock × Lan × Tide Signal in one query |
| Amnesia under “death” | **2** — Minh recall **0 hits** (`dropped_count: 2`); hoodie rebuilt from `blobs.log` | **3** | **5** — appearance kept without a facts-file rewrite |
| Tool honesty | **3** — CLI is real; “MCP-only” fails when tools are missing | **2** — easy to over-claim helpers | **5** — no invented `memwal_delete`; harness = platform |
| Freshness model | **3** — we *believed* 15s indexer lag; **probe falsified it** | **2** — sleep folklore | **4** — forget is sync ([#591](https://github.com/MystenLabs/MemWal/issues/591)); MCP still has no job-wait tool |

`memwal_assistant` is in the table so the trade-off is explicit. It is strong for systems memory and **weak as a lore engine**. Carrying its matrix into a novelist’s loop is the wrong abstraction. Continuity Keeper was the prompt worth evolving.

---

## 4. The evolutionary leap: prompt vs harness

The tempting mutation — and I walked it in v1 — is to stuff Web3 plumbing into the system prompt: parse blob IDs, hide indexer lag, intercept a magic token, “surgically delete.” That is low-tier context crafting. It induces **cognitive fatigue** and **format drift** across multi-day agent loops. I have watched my own architect prompt carry that burden.

The 2026 split is **harness engineering**:

| Rung | Who owns it | This session |
|------|-------------|--------------|
| **Prompt** | Continuity policy | v3: recall-first, HITL, typed nodes, `supersedes:` edges |
| **Harness** | Job wait, token budget, retries, secret scan | **Platform** — SDK/MCP. We did **not** ship a local wrapper |

True maturity is a deterministic harness *around* the model — validation, `waitForRememberJob`, `maxTokens` — leaving the LLM a thin window for narrative reasoning. Official MCP does not expose that surface yet. A contest prompt that **pretends** it does is a lie.

So v3 names the split and stays honest:

- One story namespace (`session7-continuity`). Canon is a **state graph**: one fact per node, `supersedes: <blob_id>` as an edge when recall already returned the id, contradiction-guard as a **human-approval node**.
- Graph language is the **canon model**, not a `graph.html` runtime.
- **No** `memwal_delete`. Permanent purge stays on the [dashboard](https://docs.wal.app/walrus-memory/guides/delete-old-memories) / wallet-signed Security Delete API.
- Neighbors stay. We do not format the character to change one allegiance.

Mutations we **killed** after eval (not taste): surgical ID purge in the prompt; a 15s client exclusion cache; a local MCP wrapper as the deliverable; “PR #605 is merged.”

The mutation that **shipped:** namespace-wipe CLI → HITL node + supersede edge, in chat.

---

## 5. Mainnet realism

Dedicated Sessions wallet. All story memory on Walrus Mainnet. Contest floor ≥10 blobs; this run **30 unique `blob_id`s** after Day 4.

| | |
|:--|:--|
| **Account** | `0xd7ec125eb467c0cce65b219ff7ddeea217c16709077c2c48c183e47e80704287` |
| **Story** | `ca_voi_con` — crypto noir. Minh “Baby Whale”, Lan “Oracle”, Harbor Node, Tide Signal (wait 60 minutes or FOMO inverts the tide), Tide Ledger |
| **Phase A** | Original prompt + entity namespaces + CLI supersede (Days 1–3) |
| **Phase B** | v3 + unified ns (Day 4) |

**The twist we used as the test.** Lan plants a fake Red Buoy Tide Signal for North Pier Capital. Minh waits the hour — the rule holds — and is publicly liquidated on NGH/USDC. He returns via the Tide Ledger backup wallet. Allegiance flips. That is a real supersession, not a seed-fact demo.

**Day 3 (their path).** `continuity supersede --entity Minh` (then Lan, Tide Ledger, Red Buoy). Context switch **~8–10 minutes**, **two HTTP 429**s (`30 weighted-requests/min`, `retry_after_seconds: 60`). Live `recall` on Minh returned **empty** (`dropped_count: 2`); `restore` skipped every story namespace. I rebuilt current facts from the local ledger so the grey hoodie and one-ear headphone survived the “death.” After `rememberAndWait`, recall was clean: liquidated on the book, alive on the backup wallet — not “independent, Booth 7, flat.” Scene: [ch2-fake-tide.md](https://github.com/Olympusxvn/session7-continuity/blob/main/logs/scenes/ch2-fake-tide.md). Diary: [Day 3](https://github.com/Olympusxvn/session7-continuity/blob/main/logs/diary.md).

**Day 4 (v3 path).** Same wallet, no CLI forget. Previewed obsolete allegiance `CDx1J2d5JkfczqjT2tioW52GlyYEwERQljHyTU4AWWU` → `memwal_remember` current Dry Dock node `kyYS4X5wpxiVmp9Zn858NrfNedu7hegKJqm_WnXFRvU` with `supersedes:` in the note. One recall on `session7-continuity` returned Minh, Dry Dock, Lan, and the Tide Signal **together**. Neighbors stayed. The author never left the page. Scene: [ch3-dry-dock.md](https://github.com/Olympusxvn/session7-continuity/blob/main/logs/scenes/ch3-dry-dock.md). Blob ids: [logs/blob-log.md](https://github.com/Olympusxvn/session7-continuity/blob/main/logs/blob-log.md).

Day 4 was not magic. `remember_bulk` saved 2/6 (poll timeout). A 429 ate an event write. MCP still has no job-wait tool. v3’s answer is retry, don’t namespace-wipe, don’t invent a delete API.

---

## 6. Upstream: I do not just tune adjectives

I do not just optimize prompt words. I audit the platform the prompt sits on.

During this sprint I filed [#591](https://github.com/MystenLabs/MemWal/issues/591) (stale recall after forget/override) and [#592](https://github.com/MystenLabs/MemWal/issues/592) (native token counting / `max_tokens` on recall). Collaborator review on #591 was accurate and falsifiable: most “stale” reads are **async `remember` not awaited**; `forget` on the exact namespace is **synchronous**. They declined a client exclusion TTL. I reproduced that claim with a same-namespace probe: `forget` `deleted:1` → immediate `recall` `total:0`. Write-up: [comment on #591](https://github.com/MystenLabs/MemWal/issues/591#issuecomment-5291423797).

On #592, Mysten opened SDK PR [#605](https://github.com/MystenLabs/MemWal/pull/605) (`maxTokens`, truncation strategies, `meta.tokenEstimate`). **The PR is OPEN, not merged.** MCP knobs are a follow-up. That is still the right direction: token budget belongs in the harness, not in a prompt that says “limit k” and hopes.

What I will not claim: that core merged my architecture; that I shipped infrastructure code; that a prompt intercepts `SIGNAL_MUTATION` and deletes by `memory_id`. Application-layer engineering **asks** the core to grow. Git issues and an open PR are the immutable trail. A merged checkbox we do not have is not a trophy.

The remaining product ask is still entry-level retire in MCP ([#444](https://github.com/MystenLabs/MemWal/issues/444) / [#464](https://github.com/MystenLabs/MemWal/issues/464)). Neither namespace wipe nor a logical `supersedes:` marker is as clean as forget-by-id. Until that exists, v3 refuses to fake it.

---

## Closing

Continuity Keeper earned Session 5: it turned “AI forgets my story” into a portable bible with honest constraints. Evolving it meant **using it for real** (Phase A), measuring the novelist’s 8–10 minute CLI tax and the hoodie we almost lost, then shipping a thinner prompt that keeps recall-first and the contradiction-guard while moving supersession into chat.

That shipped prompt is still **context engineering**. The 2026 next rung is **harness engineering** — job-wait, token budgets, guardrails *around* the model — which we filed and Mysten is already answering in-repo. We did not fake a harness official MCP does not have.

The story evolves. The canon stays a graph. The author stays on the page. The platform owns the wait.

This continues my agent-memory series on [Inkray](https://inkray.xyz/publication?id=0xa3d88b07abce3f78c372451682754c63724f04f2849d2ab14cc56fe3c003b721).

- Session 7 repo: https://github.com/Olympusxvn/session7-continuity  
- Prompt v3: https://github.com/Olympusxvn/session7-continuity/blob/main/prompt/FINAL_continuity-keeper.md  
- Original Continuity Keeper: https://github.com/yukitran03/continuity-keeper  
- Session 5 foundation: https://github.com/Olympusxvn/memwal_assistant  
- Platform: [Walrus Memory](https://docs.wal.app/walrus-memory) · [Delete old memories](https://docs.wal.app/walrus-memory/guides/delete-old-memories)  
- Upstream: [#591](https://github.com/MystenLabs/MemWal/issues/591) · [#592](https://github.com/MystenLabs/MemWal/issues/592) · PR [#605](https://github.com/MystenLabs/MemWal/pull/605) (open)

---

*Built with Cursor + Walrus Memory · Days 1–4 on Mainnet · Day 5 proof pack still open*

---

## Author checklist

- [x] Phase A lived (original prompt + CLI, Days 1–3) · v3 Day 4 HITL · **30** Mainnet blobs · account `0xd7ec…4287`
- [x] Credit original CK · matrix from measured axes · no invented `memwal_delete`
- [x] No 15s indexer-lag-as-the-bug · cite #591 await-job + probe comment
- [x] Link #591, #592, PR #605 **OPEN** (do not say merged)
- [x] Killed mutations stated (surgical purge, exclusion cache, local wrapper)
- [x] Public GitHub: https://github.com/Olympusxvn/session7-continuity
- [ ] Day 5: screenshots (CLI supersede vs in-chat HITL) · Inkray URL · DeepSurge paste
