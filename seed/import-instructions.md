# Importing Seed Data into Supabase

## Prerequisites

1. A Supabase project (free tier is fine): https://supabase.com
2. Run `schema.sql` in your Supabase SQL Editor to create the table

## Verification

After import, verify the row count:

```sql
SELECT COUNT(*) FROM utm_links;
-- Expected: 25000
```
