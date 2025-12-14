# TypeScript Configuration

See [`llm/shared/typescript-config.md`](../shared/typescript-config.md) for comprehensive guidance.

## Quick Reference

- **Enable strict mode**: Set `strict: true` with all additional strictness flags
- **Avoid leaky library options**: Don't use `esModuleInterop`, `allowSyntheticDefaultImports` in libraries
- **Ask before skipLibCheck**: Always get permission before setting `skipLibCheck: true`
- **Prevent bad builds**: Use `noEmitOnError: true`
- **Document type suppressions**: Never use `@ts-ignore` or `@ts-expect-error` without explanatory comments
- **Prefer @ts-expect-error**: Use over `@ts-ignore` - fails if error is fixed

