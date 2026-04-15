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

## URL Construction Rules

1. Start with the base website URL
2. If the URL already has query parameters, append with `&`; otherwise use `?`
3. URL-encode parameter values that contain special characters
4. Maintain consistent parameter order: `coupon` > `utm_source` > `utm_medium` > `utm_campaign` > `ref` > `utm_term` > `utm_content`

### Using the URL API (recommended)

```typescript
const buildUtmUrl = (
  baseUrl: string,
  params: {
    source: string;
    medium: string;
    campaign?: string;
    term?: string;
    content?: string;
    coupon?: string;
    ref?: string;
  },
): string => {
  const url = new URL(baseUrl);

  if (params.coupon) url.searchParams.set("coupon", params.coupon);
  url.searchParams.set("utm_source", params.source);
  url.searchParams.set("utm_medium", params.medium);
  if (params.campaign) url.searchParams.set("utm_campaign", params.campaign);
  if (params.ref) url.searchParams.set("ref", params.ref);
  if (params.term) url.searchParams.set("utm_term", params.term);
  if (params.content) url.searchParams.set("utm_content", params.content);

  return url.toString();
};
```

## Validation

- `source` and `medium` are required — reject if missing
- Use lowercase, hyphenated values (e.g., `product-update` not `Product Update`)
- Campaign names should follow a naming convention: `[topic]-[qualifier]` (e.g., `lyro-activation`, `yt-dedicated`)
- Coupon codes are typically uppercase alphanumeric (e.g., `BFCM50`, `ECOMACADEMY20`)
- Base URL must be a valid URL (use `new URL()` to validate)

## Common Source/Medium Combinations

| Source | Typical Mediums |
|--------|----------------|
| `linkedin` | `social`, `cpc`, `paid` |
| `youtube.com` | `influencers`, `paid` |
| `mailing_ref` | `email`, `newsletter` |
| `homepage` | `navbar`, `button`, `banner`, `widget_v4` |
| `partners` | `affiliate`, `newsletter` |
| `google` | `cpc`, `organic` |
| `facebook` | `social`, `paid` |
