# skills-collections-public

The public version of Haykal's Claude Code skills library (everything except
private business skills). It works as a Claude Code **plugin marketplace** (`haykal-public`) with one
plugin (`haykal-skills`), and can copy the skills into any project.

```
skills-src/<skill>/                 master copy of every skill (edit here)
plugins/haykal-skills/skills/       built copy the plugin ships (don't edit)
.claude-plugin/marketplace.json     marketplace "haykal-public"
plugins/haykal-skills/.claude-plugin/plugin.json   plugin "haykal-skills"
scripts/                            build.sh, install-into.sh, new-skill.sh
template/                           starter files for a new project
CREDITS.md                          third-party sources and licenses
```

## Install the plugin

In Claude Code:

```
/plugin marketplace add Lymion/skills-collections-public
/plugin install haykal-skills@haykal-public
```

The repo is public, so no GitHub sign-in is needed, and cloud sessions can
install the plugin too. To get updates later: `/plugin marketplace update haykal-public`.

## Add a new skill I write myself

1. Create it from the template:
   ```bash
   scripts/new-skill.sh my-skill "What it does and when Claude should use it."
   ```
2. Edit `skills-src/my-skill/SKILL.md` (add scripts or reference files next to it if needed).
3. Copy it into the plugin:
   ```bash
   scripts/build.sh
   ```
4. Commit and push:
   ```bash
   git add -A && git commit -m "Add my-skill" && git push
   ```
5. Add a row for it to the table below.

Always edit `skills-src/`, never `plugins/haykal-skills/skills/`: `build.sh`
replaces that folder with a fresh copy of `skills-src/`.

## Use the skills in a new project

**Option A: start from the template.** Copy everything in `template/` into the
new project. It has `.claude/settings.json` (turns on this plugin),
a starter `CLAUDE.md` (tells Claude to use my UI skills) and a `.gitignore`.

```bash
cp -R template/. /path/to/new-project/
```

**Option B: install into an existing project.**

```bash
scripts/install-into.sh /path/to/project
```

This copies every skill into the project's `.claude/skills/` (so cloud sessions
that can't load a private plugin still get them) and adds the marketplace and
plugin to `.claude/settings.json`, keeping anything already in that file.
Re-run it to refresh the skills after you change them. It needs `python3` or `node`.

## Skills

| Skill | What it does | Source |
|---|---|---|
| `math-tutorial-solutions` | Solves math tutorial questions as a paper-ready LaTeX PDF in my format. | Mine |
| `scratch` | Prototypes a screen as one `scratch.html` and iterates from notes left on the page. | Mine |
| `ui-elevate` | Improves an existing UI in focused passes (unslop, hierarchy, delight, style, nav, search). | Mine |
| `ui-ux-pro-max` | UI/UX design intelligence: searchable styles, palettes, fonts, charts and stack guides. | [nextlevelbuilder](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) (MIT) |
| `animate` | Builds an animation from scratch, making the decisions in the right order. | [Emil Kowalski](https://github.com/emilkowalski/skills) (MIT) |
| `animate-expo` | Builds animations in React Native and Expo. | Emil Kowalski (MIT) |
| `animation-performance` | Keeps web animations inside the frame budget. | Emil Kowalski (MIT) |
| `animation-vocabulary` | Turns a vague description of a motion effect into its exact name. | Emil Kowalski (MIT) |
| `apple-design` | Apple's approach to interface design and fluid motion, for the web. | Emil Kowalski (MIT) |
| `ask-sonner` | Guide to Sonner, the React toast library. | Emil Kowalski (MIT) |
| `break-ui` | Tries to break UI with worst-case data (long names, empty states, huge numbers). | Emil Kowalski (MIT) |
| `choreograph` | Coordinates several elements that animate together. | Emil Kowalski (MIT) |
| `emil-design-eng` | Emil's design-engineering philosophy for UI polish and animation decisions. | Emil Kowalski (MIT) |
| `find-animation-opportunities` | Finds places that should animate but don't (read-only). | Emil Kowalski (MIT) |
| `gestures` | Builds drag, swipe and sheet interactions that track the finger 1:1. | Emil Kowalski (MIT) |
| `improve-animations` | Audits a codebase's motion code and writes a prioritized plan. | Emil Kowalski (MIT) |
| `learn-taste` | Turns a session's design corrections into written rules. | Emil Kowalski (MIT) |
| `mobile-native` | Small CSS and meta-tag fixes that make a web app feel native on a phone. | Emil Kowalski (MIT) |
| `pick-ui-library` | Picks a frontend library for a task from a curated list. | Emil Kowalski (MIT) |
| `prototype` | Builds several different versions of a UI piece behind a visual picker. | Emil Kowalski (MIT) |
| `remove-animations` | Finds and removes animations an interface doesn't need. | Emil Kowalski (MIT) |
| `review-animations` | Reviews animation code against a high craft bar. | Emil Kowalski (MIT) |
| `write-swift` | How to write modern Swift well (value types, Swift 6 concurrency). | Emil Kowalski (MIT) |
| `stageshow` | Builds faux product UI (browser windows, dashboards, bento grids) as stills or animated cursor demos. | [Benji Taylor](https://github.com/benjitaylor/skills) (MIT) |
| `dimensional-drawing` | Turns your components into dimensional spec sheets. | [Enes Ozturk](https://github.com/enesozturk/dimensional-drawing) (MIT) |
| `dimensional-drawing-motion` | Animates a finished dimensional-drawing sheet. | Enes Ozturk (MIT) |
| `oil-ui` | Explores design directions, with a style explorer and design/UX/visual review. | [oil-oil](https://github.com/oil-oil/oil-ui) (MIT) |
| `design-taste-frontend` | Art direction with a component, motion and asset library, plus real-browser checks. | [Leonxlnx](https://github.com/Leonxlnx/taste-skill) (MIT) |
| `impeccable` | Design polish that kills AI slop; many commands (audit, animate, colorize, and more). | [Paul Bakaus](https://github.com/pbakaus/impeccable) (Apache-2.0) |
| `banner-design` | Designs banners for social media, ads, website heroes and print. | [nextlevelbuilder](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) (MIT) |
| `brand` | Brand voice, visual identity, messaging frameworks and brand consistency (with my CADARHOUSE rule). | nextlevelbuilder (MIT) |
| `design` | Logos, corporate identity, icons, social images and HTML slides. | nextlevelbuilder (MIT) |
| `design-system` | Three-layer design tokens, component specs and token-driven slides. | nextlevelbuilder (MIT) |
| `slides` | Strategic HTML presentations with Chart.js and design tokens. | nextlevelbuilder (MIT) |
| `ui-styling` | Accessible UIs with shadcn/ui, Tailwind and canvas-based visual design. | nextlevelbuilder (MIT; folder also has Apache-2.0 `LICENSE.txt`) |
| `stop-slop` | Removes AI writing patterns from prose. | [Hardik Pandya](https://github.com/hardikpandya/stop-slop) (MIT) |
| `ab-testing` | Plans and designs A/B tests and growth experiment programs. | [Corey Haines](https://github.com/coreyhaines31/marketingskills) (MIT) |
| `ad-creative` | Writes and iterates ad copy at scale for any ad platform (with my edits). | Corey Haines (MIT) |
| `ads` | Paid ad campaign strategy, targeting and optimization (Google, Meta, LinkedIn, X). | Corey Haines (MIT) |
| `ai-seo` | Gets content cited by AI search engines and LLMs (AEO/GEO). | Corey Haines (MIT) |
| `analytics` | Sets up and audits analytics tracking (GA4, GTM, events, UTMs). | Corey Haines (MIT) |
| `aso` | Audits and optimizes App Store and Google Play listings. | Corey Haines (MIT) |
| `attribution` | Works out which marketing drives revenue; attribution models, MMM, incrementality. | Corey Haines (MIT) |
| `churn-prevention` | Cancel flows, save offers, dunning and retention. | Corey Haines (MIT) |
| `co-marketing` | Finds co-marketing partners and plans joint campaigns. | Corey Haines (MIT) |
| `cold-email` | B2B cold outbound: emails, follow-ups, deliverability, cadences. | Corey Haines (MIT) |
| `community-marketing` | Builds communities (Discord, Slack, forums) that drive growth. | Corey Haines (MIT) |
| `competitor-profiling` | Researches competitors from their URLs into structured profiles. | Corey Haines (MIT) |
| `competitors` | Writes competitor comparison and alternative pages. | Corey Haines (MIT) |
| `content-strategy` | Plans what content to create and which topics to cover. | Corey Haines (MIT) |
| `copy-editing` | Edits and refreshes existing marketing copy. | Corey Haines (MIT) |
| `copywriting` | Writes marketing copy for any page (with my Bahasa Melayu reference and edits). | Corey Haines (MIT) |
| `cro` | Improves conversions on marketing pages and forms. | Corey Haines (MIT) |
| `customer-research` | Conducts and synthesizes customer and ICP research. | Corey Haines (MIT) |
| `directory-submissions` | Submits a product to startup, SaaS and AI directories. | Corey Haines (MIT) |
| `emails` | Email sequences, drip campaigns and lifecycle email. | Corey Haines (MIT) |
| `events` | Plans and runs events, webinars and conferences for pipeline. | Corey Haines (MIT) |
| `free-tools` | Plans and builds free tools for lead gen and SEO. | Corey Haines (MIT) |
| `image` | Creates and optimizes marketing images. | Corey Haines (MIT) |
| `influencer-marketing` | Runs influencer, creator and ambassador partnerships. | Corey Haines (MIT) |
| `launch` | Plans product launches and feature announcements. | Corey Haines (MIT) |
| `lead-magnets` | Creates lead magnets for email capture. | Corey Haines (MIT) |
| `marketing-council` | A simulated board of famous marketers giving several perspectives. | Corey Haines (MIT) |
| `marketing-ideas` | Marketing ideas and strategies for software products. | Corey Haines (MIT) |
| `marketing-loops` | Sets up recurring marketing workflows an agent runs on a cadence. | Corey Haines (MIT) |
| `marketing-plan` | Writes a full marketing plan. | Corey Haines (MIT) |
| `marketing-psychology` | Applies behavioural science and mental models to marketing. | Corey Haines (MIT) |
| `offers` | Designs and improves offers: value framing, bonuses, guarantees. | Corey Haines (MIT) |
| `onboarding` | Post-signup onboarding and user activation. | Corey Haines (MIT) |
| `paywalls` | In-app paywalls, upgrade screens and feature gates. | Corey Haines (MIT) |
| `popups` | Conversion popups, modals and slide-ins. | Corey Haines (MIT) |
| `pricing` | Pricing, packaging and monetization decisions. | Corey Haines (MIT) |
| `product-marketing` | Creates the product marketing context document other skills read. | Corey Haines (MIT) |
| `programmatic-seo` | SEO pages at scale from templates and data. | Corey Haines (MIT) |
| `prospecting` | Finds, qualifies and lists prospects to reach out to. | Corey Haines (MIT) |
| `public-relations` | PR, earned media and journalist outreach. | Corey Haines (MIT) |
| `referrals` | Referral, affiliate and word-of-mouth programs. | Corey Haines (MIT) |
| `revops` | Revenue operations, lead lifecycle and marketing-to-sales handoff. | Corey Haines (MIT) |
| `sales-enablement` | Sales collateral, pitch decks, objection handling and demo scripts. | Corey Haines (MIT) |
| `schema` | Adds and fixes schema markup and structured data. | Corey Haines (MIT) |
| `seo-audit` | Audits and diagnoses technical and on-page SEO. | Corey Haines (MIT) |
| `signup` | Optimizes signup and trial activation flows. | Corey Haines (MIT) |
| `site-architecture` | Plans page hierarchy, navigation, URLs and internal links. | Corey Haines (MIT) |
| `sms` | SMS, MMS and WhatsApp marketing flows (with my edits). | Corey Haines (MIT) |
| `social` | Social media content for LinkedIn, X, Instagram, TikTok and Facebook (with my Malaysia platforms reference and edits). | Corey Haines (MIT) |
| `video` | Produces video content with AI tools or code. | Corey Haines (MIT) |
| `advanced-evaluation` | LLM-as-judge, pairwise comparison, rubric calibration and evaluator bias. | [Context Engineering Agent Skills](https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering) (MIT) |
| `bdi-mental-states` | Models agent mental states with beliefs, desires and intentions (BDI). | Context Engineering (MIT) |
| `context-compression` | Compresses and summarizes long agent sessions into durable handoffs. | Context Engineering (MIT) |
| `context-degradation` | Diagnoses lost-in-middle, context poisoning and other degradation. | Context Engineering (MIT) |
| `context-fundamentals` | Foundational concepts of context engineering. | Context Engineering (MIT) |
| `context-optimization` | Context budgeting, observation masking and KV-cache strategy. | Context Engineering (MIT) |
| `evaluation` | Agent evaluation systems: checks, regression suites, rubrics, quality gates. | Context Engineering (MIT) |
| `filesystem-context` | File-backed agent context: scratchpads, offloading, just-in-time discovery. | Context Engineering (MIT) |
| `harness-engineering` | Designs autonomous agent harnesses: research loops, logs, rollback. | Context Engineering (MIT) |
| `hosted-agents` | Hosted and background agent infrastructure: sandboxes, warm pools, sessions. | Context Engineering (MIT) |
| `latent-briefing` | Shares memory between agents via KV-cache compaction. | Context Engineering (MIT) |
| `long-horizon-prompting` | Writes launch prompts for long-running autonomous agents. | Context Engineering (MIT) |
| `memory-systems` | Persistent semantic memory for agents. | Context Engineering (MIT) |
| `multi-agent-patterns` | Multi-agent design: supervisors, swarms, handoffs, context isolation. | Context Engineering (MIT) |
| `project-development` | Project-level decisions for LLM-powered systems. | Context Engineering (MIT) |
| `self-improvement-loops` | Optimizes the harness or workflow itself (recursive self-improvement). | Context Engineering (MIT) |
| `self-managed-context` | Gives a model read-write control over its own context window. | Context Engineering (MIT) |
| `tool-design` | Designs agent tool interfaces and descriptions. | Context Engineering (MIT) |
| `remotion-best-practices` | Router for all Remotion skills. | [Remotion](https://github.com/remotion-dev/skills) (Remotion License) |
| `remotion-captions` | Transcribes, displays and animates captions in Remotion. | Remotion (Remotion License) |
| `remotion-create` | Creates a new Remotion project or composition. | Remotion (Remotion License) |
| `remotion-docs` | Searches the Remotion documentation. | Remotion (Remotion License) |
| `remotion-interactivity` | Structures Remotion markup for interactivity. | Remotion (Remotion License) |
| `remotion-maps` | Map animations in Remotion. | Remotion (Remotion License) |
| `remotion-markup` | Content, animation and effects best practices for Remotion. | Remotion (Remotion License) |
| `remotion-multimedia` | Media handling in Remotion with Mediabunny. | Remotion (Remotion License) |
| `remotion-render` | Exports a Remotion video. | Remotion (Remotion License) |
| `remotion-saas` | Builds an app with Remotion. | Remotion (Remotion License) |
| `remotion-studio` | Previews a Remotion video in the Studio. | Remotion (Remotion License) |
| `remotion-upgrade` | Upgrades Remotion and related packages. | Remotion (Remotion License) |

Some of Emil's skills (`learn-taste`, `pick-ui-library`, `prototype`,
`review-animations`) only run when you call them by name, e.g. `/prototype`.
Licenses and exact upstream commits are in [CREDITS.md](CREDITS.md).
