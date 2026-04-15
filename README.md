# UTM Link Challenge

Welcome to our technical challenge for the **AI Marketing Developer** position. This task is designed to evaluate how you approach real-world problems using modern tools.

## Context

Our marketing team maintains a growing repository of UTM-tagged links used across campaigns, partnerships, newsletters, and internal tools. Currently the data lives in a CSV spreadsheet, but we need a proper system backed by a database — and a way to query it intelligently.

## The Task

### Part 1: Build a UTM Link Builder

Create a TypeScript tool that:

1. **Connects to Supabase** as the database backend
2. **Imports the seed data** — we've provided `seed/utm_links_seed.csv` with 25,000 UTM link records. Use `seed/schema.sql` to create the table. See `seed/import-instructions.md` for import options.
3. **Builds new UTM links** — given a base URL and UTM parameters (`source`, `medium`, `campaign`, `term`, `content`, `ref`, `coupon`), constructs the full tracking URL and stores it in the database.

The tool can be a fully working application, a CLI script, or anything else you find practical. We care about clean code and a working solution.

**Tech requirements:**
- TypeScript (ESM modules)
- Supabase for storage
- Any other libraries you find useful

### Part 2: Find the Needle

The database now contains 25,000 UTM link records. Your task is to find **one specific record** using an LLM.

Here's what a colleague shared in Slack:

> *"Hey, I need a link from sometime in February 2026 for a YouTube creator. I think the channel was ecom-boost... actually wait, no, that's the growth hacking channel. The one I want is the educational one, like a school for online store owners. It was an organic influencer placement, not a paid ad. We set up multiple links that day for different purposes — there was a generic February promo version, a paid ad version, and an integration mention version. I DON'T want any of those three. The one I need was for a full dedicated video. Also the shortlink we created wasn't just a generic link or a month reference — it specifically referenced the romantic holiday that falls on that date. Pretty sure there was a coupon on it."*

Write a script that uses an LLM to find this record efficiently. You can use **any LLM provider** — OpenAI, Anthropic, Google, OpenRouter, a local model, or anything else. 

Put the answer in `ANSWER.md`.

## Getting Started

```bash
# Install dependencies (use whichever package manager you prefer)
npm install        # or: pnpm install / bun install / yarn

# Copy env template and fill in your keys
cp .env.local.example .env.local

# Create the table in Supabase (run seed/schema.sql in your Supabase SQL Editor)
# Then import seed/utm_links_seed.csv (see seed/import-instructions.md)

# Run your solution
npm start          # or: npx tsx src/solution.ts
```

## Project Structure

```
├── seed/
│   ├── schema.sql              # Table definition for Supabase
│   ├── utm_links_seed.csv      # 25,000 UTM link records
│   └── import-instructions.md  # How to import the data
├── src/                        # Your code goes here
├── prompts/                    # Your AI prompt history goes here
├── package.json
├── tsconfig.json
├── eslint.config.js
├── .prettierrc
└── ANSWER.md                   # Your answers
```

## AI Usage

You're free and encouraged to use AI tools (Cursor, Claude Code, Copilot, ChatGPT, etc.) to develop your solution. This is an AI Developer role — we *want* to see how you work with AI.

**Include your full prompt history** — every prompt you sent, in order, along with the AI's responses. You can export this as a chat log, screenshots, or any format that shows the full conversation. Put it in a `prompts/` directory or link it in `ANSWER.md`.

We're evaluating *how* you use AI, not *whether* you use it!

## Submission

1. Please do not fork the repo, clone it and put it in your own github / gitlab.
2. Implement your solution in `src/`
3. Fill in `ANSWER.md`
4. Include your AI prompt history (see above)
5. Send the link to your repo to jedrzej@tidio.net

Good luck!
