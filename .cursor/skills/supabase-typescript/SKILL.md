---
name: supabase-typescript
description: >-
  Patterns for using @supabase/supabase-js with TypeScript.
  Use when connecting to Supabase, writing queries, bulk inserting data,
  or setting up typed database access.
---

# Supabase + TypeScript Patterns

## Client Initialization

Always create the client once and reuse it:

```typescript
import { createClient } from "@supabase/supabase-js";

const supabase = createClient(
  process.env.SUPABASE_URL!,
  process.env.SUPABASE_KEY!,
);
```

For type safety, generate types from your schema:
```bash
npx supabase gen types typescript --project-id YOUR_PROJECT_ID > src/database.types.ts
```

Then pass the generated types to `createClient`:
```typescript
import { Database } from "./database.types";

const supabase = createClient<Database>(
  process.env.SUPABASE_URL!,
  process.env.SUPABASE_KEY!,
);
```

## Environment Variables

Required in `.env.local`:
- `SUPABASE_URL` - your project URL (e.g., `https://abc123.supabase.co`)
- `SUPABASE_KEY` - your service role key (Project Settings > API > Secret key). For server-side scripts this is simpler than the publishable key since it bypasses RLS.

Load with dotenv:
```typescript
import { config } from "dotenv";
config({ path: ".env.local" });
```
