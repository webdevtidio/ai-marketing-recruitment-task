-- UTM Links table for the UTM Link Builder challenge
-- Run this in your Supabase SQL Editor before importing seed data

CREATE TABLE IF NOT EXISTS utm_links (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at DATE NOT NULL,
  website_url TEXT NOT NULL,
  coupon TEXT,
  source TEXT NOT NULL,
  medium TEXT NOT NULL,
  campaign TEXT,
  ref TEXT,
  term TEXT,
  content TEXT,
  final_url TEXT NOT NULL,
  shortlink TEXT,
  notes TEXT
);

CREATE INDEX idx_utm_links_source ON utm_links (source);
CREATE INDEX idx_utm_links_medium ON utm_links (medium);
CREATE INDEX idx_utm_links_campaign ON utm_links (campaign);
CREATE INDEX idx_utm_links_created_at ON utm_links (created_at);
