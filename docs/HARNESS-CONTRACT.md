# Walrus Harness Contract (Session 7)

**Status:** Next rung — **not** shipping as a local MCP wrapper this session.  
**What ships in the contest:** [`prompt/FINAL_continuity-keeper.md`](../prompt/FINAL_continuity-keeper.md) (v3).  
**Locked 2026-08-14:** v3 = submission · harness = platform (issues + open PR #605) · Phase A entity namespaces until **Day 3 CLI supersede** is done.

**Upstream:** [#591](https://github.com/MystenLabs/MemWal/issues/591) · [#592](https://github.com/MystenLabs/MemWal/issues/592) · PR [#605](https://github.com/MystenLabs/MemWal/pull/605) · status log [`ISSUES-591-592.md`](./ISSUES-591-592.md)

## The 2026 split

| Rung | Essence | This session |
|------|---------|--------------|
| **Prompt** | What you *say* | Phase A: original Continuity Keeper (Days 1–3, their CLI + per-entity ns) |
| **Context** | What you *load* | **v3 ships:** one-namespace typed nodes, HITL supersede, thin fallbacks |
| **Harness** | System *around* the model | **Next.** Mysten: await `remember` jobs; SDK `maxTokens` (PR #605 **open**). We do not fork MCP. Do not claim exclusion cache or surgical MCP delete. |

Lived evidence: Day 1 MCP green but tools missing from the agent → CLI `rememberAndWait`. Tool surface / job-wait is harness, not prompt wording.

## What official MCP does *not* do (do not overclaim)

- No `memwal_delete` / surgical ID purge in chat
- No agent-visible `waitForRememberJob` on the MCP tool surface (SDK has it; CLI uses `rememberAndWait`)
- No `max_tokens` on MCP `memwal_recall` yet (SDK PR #605 **still OPEN**; MCP follow-up)
- No intercept of `override canon:` as a state machine

Do **not** claim a 15s “indexer lag” as the general bug after [#591](https://github.com/MystenLabs/MemWal/issues/591) team reply: most “stale” reads are **async write not awaited**. `forget` is sync on the same namespace. Dashboard delete is the narrow reactive-cleanup case.

## Platform should own (not our wrapper)

1. **Wait-for-job on MCP remember** — contradiction-guard recall only after `done` (team’s documented path).
2. **Eager cleanup** after dashboard Security Delete.
3. Optional `exclude_ids` on recall (team: convenience, not the #591 fix).
4. **Token budget on MCP recall** — mirror PR #605 knobs.
5. **Secret scan** before relayer write.
6. Never namespace-wipe to fix one fact.

Until MCP grows those, v2 fallbacks: in-session superseded ids, refuse secrets, dashboard for permanent delete, wait ~10–15s or restore+retry if a just-written fact is missing from recall.
