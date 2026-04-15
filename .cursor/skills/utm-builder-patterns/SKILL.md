---
name: utm-builder-patterns
description: >-
  UTM parameter conventions, URL construction, and validation rules.
  Use when building UTM links, parsing UTM parameters, or validating input.
---

# UTM Link Builder Patterns

## UTM Parameter Reference

| Parameter | Required | Description |
|-----------|----------|-------------|
| `utm_source` | Yes | Traffic source (e.g., `linkedin`, `youtube.com`, `mailing_ref`) |
| `utm_medium` | Yes | Marketing medium (e.g., `social`, `email`, `cpc`, `influencers`) |
| `utm_campaign` | No | Campaign name (e.g., `product-update`, `black-friday-2025`) |
| `utm_term` | No | Paid search keywords or audience segment |
| `utm_content` | No | Differentiates ads/links pointing to the same URL |

## Additional Parameters (non-standard but common)

| Parameter | Description |
|-----------|-------------|
| `coupon` | Discount/promo code appended as query param |
| `ref` | Referral identifier for affiliate/partner tracking |
