# Day 0 checklist — session7-continuity

**Date:** 2026-08-11  
**Folder:** `C:\Users\Admin\session7-continuity`

| Step | Status | Notes |
|------|--------|-------|
| 0.1 `git init` + clone continuity-keeper → `vendor/` | ✅ Done | Upstream vendored |
| 0.2 `pnpm install` + CLI `help` | ✅ Done | `@mysten-incubation/memwal@0.0.7` |
| 0.3 Copy Phase A prompt | ✅ Done | `prompt/PHASE_A_continuity-keeper.md` |
| 0.4 Cursor rule Phase A | ✅ Done | `.cursor/rules/continuity-keeper.mdc` |
| 0.5 `.cursor/mcp.json` → namespace `session7-continuity` | ✅ Done | Also `.example` for git |
| 0.6 Story / blob / diary scaffolds | ✅ Done | Fill `STORY.md` |
| 0.7 MemWal credentials present | ✅ Done | Dedicated Session 7 account `0xd7ec…4287` · pub `e69bc7…ff59` · CLI `health` ok (2026-08-11) |
| 0.8 MCP green in Cursor | ✅ Done | Confirmed by author 2026-08-11 |
| 0.9 Fill `STORY.md` (slug + cast + twist) | ✅ Done | `ca_voi_con` — crypto noir · Minh / Lan / Harbor Node · Tide Signal · Day 3: fake signal + liquidation “death” |

## Commands you may need

```bash
# Re-login (dedicated Session 7 wallet recommended)
npx -y @mysten-incubation/memwal-mcp login

# CLI from this repo
node vendor/continuity-keeper/tools/continuity/cli.mjs help
node vendor/continuity-keeper/tools/continuity/cli.mjs health
```

## After MCP is green — smoke (optional, no story yet)

In Cursor chat:

```text
Call memwal_health or memwal_login if needed.
Do NOT write story canon until STORY.md is filled.
Confirm namespace session7-continuity is active.
```

## Next

→ Fill `STORY.md` → open new chat in this repo → Day 1 seed (see guide in `memory_story/docs/SESSION7_MAINNET_TEST_GUIDE.md`).
