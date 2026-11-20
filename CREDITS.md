# Credits

Third-party skills in this library are copied unchanged from their upstream
repositories (except where noted) and keep their original licenses. Each copied
skill folder contains the upstream `LICENSE` file.

| Source | Commit | License | Skills |
|---|---|---|---|
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | `6ae86f61f520d6ca229d2f40e070410638c908c5` (v2.15.0) | MIT, © 2024 Next Level Builder | `ui-ux-pro-max` |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) | `0f2e23b32bb1265e84cff8d3e75785fec953fb1b` | MIT, © 2026 Emil Kowalski | `animate`, `animate-expo`, `animation-performance`, `animation-vocabulary`, `apple-design`, `ask-sonner`, `break-ui`, `choreograph`, `emil-design-eng`, `find-animation-opportunities`, `gestures`, `improve-animations`, `learn-taste`, `mobile-native`, `pick-ui-library`, `prototype`, `remove-animations`, `review-animations`, `write-swift` |
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | `026b6e172c47fa09246b89b6e1d414b8e15f1057` (2026-10-12, skill.json 2.13.0) | MIT, © 2024 Next Level Builder | `banner-design`, `brand`, `design`, `design-system`, `slides`, `ui-styling` |
| [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) | `8da1f030185bdfe8471220585162991eaeb970e9` | MIT, © 2025 Hardik Pandya | `stop-slop` |
| [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | `c7d7dfb6b460fc376b4b2204b78a9c9fd5ca6467` | MIT, © 2025 Corey Haines | `ab-testing`, `ad-creative`, `ads`, `ai-seo`, `analytics`, `aso`, `attribution`, `churn-prevention`, `co-marketing`, `cold-email`, `community-marketing`, `competitor-profiling`, `competitors`, `content-strategy`, `copy-editing`, `copywriting`, `cro`, `customer-research`, `directory-submissions`, `emails`, `events`, `free-tools`, `image`, `influencer-marketing`, `launch`, `lead-magnets`, `marketing-council`, `marketing-ideas`, `marketing-loops`, `marketing-plan`, `marketing-psychology`, `offers`, `onboarding`, `paywalls`, `popups`, `pricing`, `product-marketing`, `programmatic-seo`, `prospecting`, `public-relations`, `referrals`, `revops`, `sales-enablement`, `schema`, `seo-audit`, `signup`, `site-architecture`, `sms`, `social`, `video` |
| [muratcankoylan/Agent-Skills-for-Context-Engineering](https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering) | `9ff0c99108b36d3b886defd825d8ac1f47dba374` | MIT, © 2025 Context Engineering Agent Skills Contributors | `advanced-evaluation`, `bdi-mental-states`, `context-compression`, `context-degradation`, `context-fundamentals`, `context-optimization`, `evaluation`, `filesystem-context`, `harness-engineering`, `hosted-agents`, `latent-briefing`, `long-horizon-prompting`, `memory-systems`, `multi-agent-patterns`, `project-development`, `self-improvement-loops`, `self-managed-context`, `tool-design` |
| [remotion-dev/skills](https://github.com/remotion-dev/skills) | `7ba4dcf8ebe1626b00baa41e1f2478113719b60b` (skills v4.0.535) | Remotion License (source-available, not OSI; free for individuals and companies up to 3 people), © 2026 Remotion | `remotion-best-practices`, `remotion-captions`, `remotion-create`, `remotion-docs`, `remotion-interactivity`, `remotion-maps`, `remotion-markup`, `remotion-multimedia`, `remotion-render`, `remotion-saas`, `remotion-studio`, `remotion-upgrade` |
| [benjitaylor/skills](https://github.com/benjitaylor/skills) | `299140fafd08df55a9c234e610c3f64af3f45531` | MIT, © 2026 Benji Taylor | `stageshow` |
| [enesozturk/dimensional-drawing](https://github.com/enesozturk/dimensional-drawing) | `5c457437c8c83524308aad3b7443e81adcc13153` | MIT, © 2026 Enes Ozturk | `dimensional-drawing`, `dimensional-drawing-motion` |
| [oil-oil/oil-ui](https://github.com/oil-oil/oil-ui) | `c21ba65a2174541cabf028afb4f35f80c47d39d9` | MIT, © 2026 oil-oil | `oil-ui` |
| [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | `f6b76575f949707b4e3c37cd86cb44b0b98643e8` | MIT, © 2026 Leonxlnx | `design-taste-frontend` (upstream folder `taste-skill`) |
| [pbakaus/impeccable](https://github.com/pbakaus/impeccable) (`plugin/skills/impeccable`) | `2b86d9c07b97d4bed7de23583e1bd1e58dd2baae` | Apache-2.0 (see its `LICENSE` and `NOTICE.md`) | `impeccable` |

`remotion-dev/skills` has no LICENSE file of its own. It is generated from
`packages/skills` in [remotion-dev/remotion](https://github.com/remotion-dev/remotion),
so each Remotion skill folder holds that repo's `LICENSE.md` (from commit
`c86fc72b2bfe99bd5177f61240ee64d9c1c45d2f`).

`ui-styling` also keeps the Apache-2.0 `LICENSE.txt` it ships with upstream,
and each font in `ui-styling/canvas-fonts/` keeps its own `*-OFL.txt` license.

## Local changes

- `ui-ux-pro-max/SKILL.md`: script paths changed from
  `${CLAUDE_PLUGIN_ROOT}/.claude/skills/ui-ux-pro-max/...` (the upstream repo's
  own layout) to `${CLAUDE_SKILL_DIR}/...`, so the commands work both inside
  this plugin and when the skill is copied into a project's `.claude/skills/`.
- `brand/SKILL.md`: adds an "Existing brand context wins" rule (project
  `product-marketing.md` / `CLAUDE.md` brand rules such as CADARHOUSE take
  priority; this skill handles only the visual identity layer).
- `ad-creative/SKILL.md`, `copywriting/SKILL.md`, `sms/SKILL.md`,
  `social/SKILL.md`: Haykal's edits for CADARHOUSE / Malaysian marketing.
- `copywriting/references/bahasa-melayu-copy.md` and
  `social/references/malaysia-platforms.md`: added by Haykal (not upstream).

## Haykal's own skills

`math-tutorial-solutions`, `scratch` and `ui-elevate` were written by Haykal.
