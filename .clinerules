# Project Conventions

## Tech Stack

- **Language**: TypeScript (ESM modules, `"type": "module"`)
- **Runtime**: Node.js via `tsx`
- **Database**: Supabase (PostgreSQL)
- **Env Management**: dotenv with `.env.local`

## Code Style

- ESM imports only (`import` / `export`, no `require`)
- `const` / `let` only, no `var`
- Arrow functions preferred
- Destructuring and spread/rest operators for cleaner code
- One logical unit per file — no barrel files

## Environment Variables

- Use `.env.local` for development (NOT `.env`)
- Load with: `import { config } from "dotenv"; config({ path: ".env.local" });`
- Required keys: `SUPABASE_URL`, `SUPABASE_KEY`, `LLM_API_KEY`

## Project Structure

- `src/` — all source code
- `seed/` — database schema and seed data (read-only reference)
- `.cursor/skills/` — AI assistant skills for common patterns (ESLint, Supabase, UTM building, performance)

## Running

```bash
npm start        # Run solution
npm run lint     # ESLint check
npm run format   # Prettier format
```
