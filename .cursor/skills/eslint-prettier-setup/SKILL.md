---
name: eslint-prettier-setup
description: >-
  Configure ESLint flat config with Prettier for TypeScript ESM projects.
  Use when setting up linting, fixing lint errors, or configuring code formatting.
---

# ESLint + Prettier Setup for TypeScript ESM

## ESLint Flat Config

This project uses ESLint v9+ flat config (`eslint.config.js`). Key points:

- Import `@eslint/js` for base recommended rules
- Import `typescript-eslint` for TS-specific rules
- Import `eslint-config-prettier` to disable rules that conflict with Prettier
- Use `tseslint.config(...)` to compose configs

```js
import eslint from "@eslint/js";
import tseslint from "typescript-eslint";
import eslintConfigPrettier from "eslint-config-prettier";

export default tseslint.config(
  eslint.configs.recommended,
  ...tseslint.configs.recommended,
  eslintConfigPrettier,
  {
    ignores: ["dist/", "node_modules/"],
  },
);
```

## Prettier Integration

Prettier handles formatting, ESLint handles code quality. They do not overlap when `eslint-config-prettier` is included.

- `.prettierrc` defines formatting rules (semicolons, quotes, trailing commas, print width)
- Run `prettier --write .` to format, `eslint .` to lint
- The `format` and `lint` scripts are pre-configured in `package.json`

## Common Patterns

### Fixing lint errors
1. Run `npm run lint` to see all issues
2. Auto-fix what ESLint can: `npx eslint . --fix`
3. Format with Prettier: `npm run format`
4. Manually fix remaining issues

### Adding rules
Add custom rules in the flat config object:
```js
{
  rules: {
    "@typescript-eslint/no-unused-vars": ["error", { argsIgnorePattern: "^_" }],
    "no-console": "warn",
  },
}
```

### Ignoring files
Use the `ignores` array in the config (replaces `.eslintignore`):
```js
{
  ignores: ["dist/", "node_modules/", "seed/"],
}
```
