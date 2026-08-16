# Diary — Session 7 real use

## Day 0 — Setup
- Repo scaffolded; CLI help works; MCP config written.
- Dedicated Session 7 wallet logged in → `~/.memwal/credentials.json` (account `0xd7ec…4287`, pub `e69bc7…ff59`). CLI health ok.
- Friction: project `.cursor/mcp.json` not loading in Cursor (only plugin MCPs). Fixed by writing `memwal` into user `~/.cursor/mcp.json` + Windows `cmd /c npx` wrapper.
- MCP green confirmed. Story slug locked: `ca_voi_con`.
- Story filled (EN): crypto noir — Minh “Baby Whale” / Lan “Oracle” / Harbor Node / Tide Signal / Tide Ledger; Day 3 = fake signal + public liquidation + backup wallet.
- Bug Bounty issues filed on MystenLabs/MemWal:
  - #591 race: stale recall after forget/override (indexer lag)
  - #592 feature: native token counting + max_tokens on recall

## Day 1
- Smooth: Seeded 7 Mainnet blobs for `ca_voi_con` via Continuity CLI (`rememberAndWait`).
- Friction: Official `user-memwal` green in Settings but tools not exposed to this agent chat — had to use CLI for Phase A writes (same credentials).
- Idea for evolved prompt: agent must have MCP tools in-session or Day 1 “MCP-only” claim fails; CLI fallback works but is the exact pain Phase B should avoid for supersede.

## Day 2
- Smooth: Ch.1 at Harbor Node Booth 7 — Minh waits 60m on Red Buoy / NGH/USDC; tide holds; still flat/alive. Scene: `logs/scenes/ch1-harbor-node.md`. 6 new Mainnet blobs (~13 total). Dedup skipped 3 near-duplicates (place, Tide Ledger, Ch.0-shaped timeline).
- Friction: Still CLI not MCP for remember; cosine <0.25 ate Booth 7 as a place fact (had to park it on Minh + event). Timeline needed a rewrite to clear 0.06 false-dup vs Ch.0.
- Idea: Harness engineering (Femke / 2026 frame) — do **not** ship Continuity Keeper 3.0 that pretends MCP intercepts SIGNAL_MUTATION. v1 archived; v2 archived 2026-08-14; **v3 final** in `prompt/FINAL_continuity-keeper.md` (graph as canon model + HITL; honest MCP). Harness = platform. **No local MCP wrapper.** Phase A stays on original prompt + `ca_voi_con::*` until Day 3 CLI supersede.
- Issue check 2026-08-13: #591 collaborator — stale recall mostly = async remember not awaited; they **decline** client exclusion TTL. #592 → PR #605 (SDK maxTokens; **still OPEN** 2026-08-14, not merged). Log: `docs/ISSUES-591-592.md`.

## Day 3 (CLI supersede)
- Command run: `node vendor/continuity-keeper/tools/continuity/cli.mjs supersede --story ca_voi_con --type char --entity "Minh" --facts-file .continuity/day3/minh.txt` (then Lan, Tide Ledger, Red Buoy). Accretive remember for events/timeline/relationships.
- Context-switch time: ~8–10 min including two **429** (`30 weighted-requests/min`, `retry_after_seconds: 60`). Left chat → CLI → wait → CLI. This is the Phase A pain.
- Almost forgot a fact when rewriting?: Yes — live `recall` returned **0 hits** (`dropped_count: 2` on Minh; `restore` skipped every namespace). Rebuilt current fact sets from `.continuity/blobs.log` so appearance (hoodie, one-ear) survived Minh’s death. Lan first supersede 429; retry **retired 0** old rows (index/decrypt skip) then wrote 2 current facts.
- Index lag observed?: Pre-twist recall empty despite 13 logged blobs (`dropped_count`). Post-`rememberAndWait` Ch.2 facts recall clean: Minh liquidated+backup, not “independent alive.”
- #591 probe (same ns): forget `deleted:1` → immediate recall `total:0` — **not stale**. Reply: https://github.com/MystenLabs/MemWal/issues/591#issuecomment-5291423797
- Scene: `logs/scenes/ch2-fake-tide.md`. Count: **23** unique Mainnet blob_ids.

## Day 4 (evolved — v3 + unified ns)
- Smooth: Official MCP tools were in this chat. Inline HITL supersede (no CLI forget): previewed Ch.2 allegiance blob `CDx1J2d5…` → `memwal_remember` current Dry Dock node with `supersedes:` in the note. One recall on `session7-continuity` returned Minh + Dry Dock + Lan + Tide Signal together (the shared-state point). Scene: `logs/scenes/ch3-dry-dock.md`.
- Friction: `memwal_remember_bulk` saved **2/6** (4× poll timeout 120s). Single `remember` then returned blob_ids. One **429** (`30 weighted-requests/min`) on the Ch.3 event write; a retry job timed out — event content already lives on the Minh Dry Dock node, so we did not namespace-wipe or spam a third write. CLI `count` only sees `.continuity/blobs.log` (MCP writes were missing until we appended).
- Idea: v3 was right not to invent `waitForRememberJob` in the prompt — MCP still times out while the relayer may or may not finish. Stay in chat; retry singles; do not CLI-forget. Neighbors (hoodie / one-ear / liquidated+backup) stayed without rewriting a facts file.
- Proof: post-await recall prefers Dry Dock current node (`kyYS4X5w…`) over “Harbor Node Booth 7 regular.” Phase A Minh ns still holds Ch.2 `CDx1J2d5…` (immutable history; v3 does not wipe it).

## Day 5 (proof pack — 2026-08-16)
- Smooth: Overnight `memwal_recall` on `session7-continuity` still ranked Dry Dock + `supersedes: CDx1J2d5…` first; hoodie / one-ear / Tide Signal 60m still in the same query. `memwal_health` ok. PR #605 still **OPEN**. Scene coda: `logs/scenes/ch4-day5-proof.md`. Pack: `docs/DAY5_PROOF.md` · dump: `logs/day5-recall.md`.
- Friction: `memwal_restore` on the unified ns: `restored: 0, skipped: 5, truncated: true` at limit 100 (same decrypt/skip class as Day 3). Day 5 timeline `remember` **timed out twice**; post-wait recall did not show the new line — did not third-write or forget. Count stays **30**.
- Idea: Day 5 proof is **recall that survived a night**, not more blobs. DeepSurge blog field still needs the Inkray URL after publish; repo Article 10 is the interim link. X / chat screenshots are author-only.
