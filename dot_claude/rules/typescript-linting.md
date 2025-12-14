# TypeScript Linting with ESLint

See [`llm/shared/typescript-linting.md`](../shared/typescript-linting.md) for comprehensive guidance.

## Quick Reference

- **Always use ESLint**: Set up ESLint for all TypeScript projects
- **Use comprehensive presets**: Enable `strict-type-checked` + `stylistic-type-checked`
- **Use Prettier for formatting**: Don't use ESLint for formatting - use Prettier instead
- **Use eslint-config-prettier**: Add `"prettier"` last in extends to disable formatting rules
- **Allow underscore-prefixed unused**: Configure `argsIgnorePattern: "^_"` and `varsIgnorePattern: "^_"`
- **Disable no-plusplus**: Set `"no-plusplus": "off"` to allow `++` and `--` operators
- **Set parserOptions.project**: Point to `tsconfig.json` for type-aware rules

