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

## Query Patterns

### Select with filters
```typescript
const { data, error } = await supabase
  .from("utm_links")
  .select("*")
  .eq("source", "linkedin")
  .eq("medium", "social")
  .order("created_at", { ascending: false })
  .limit(10);
```

### Text search
```typescript
const { data } = await supabase
  .from("utm_links")
  .select("*")
  .ilike("campaign", "%product%");
```

### Count without fetching data
```typescript
const { count } = await supabase
  .from("utm_links")
  .select("*", { count: "exact", head: true });
```

## Bulk Insert

Supabase handles batch inserts natively. For large datasets, chunk the inserts:

```typescript
const CHUNK_SIZE = 1000;

const insertInChunks = async (records: Record<string, unknown>[]) => {
  for (let i = 0; i < records.length; i += CHUNK_SIZE) {
    const chunk = records.slice(i, i + CHUNK_SIZE);
    const { error } = await supabase.from("utm_links").insert(chunk);
    if (error) throw new Error(`Insert failed at chunk ${i}: ${error.message}`);
    console.log(`Inserted ${Math.min(i + CHUNK_SIZE, records.length)}/${records.length}`);
  }
};
```

## Error Handling

Always check for errors in the response:
```typescript
const { data, error } = await supabase.from("utm_links").select("*");

if (error) {
  console.error("Supabase error:", error.message);
  throw error;
}
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
