# TypeScript Testing Best Practices

## When to Apply

Apply these guidelines when:
- Writing tests for TypeScript/JavaScript code
- Creating utility types or type helpers
- Reviewing test coverage

## Guidelines

### Pattern 1: Always Include Negative Tests

**Do:**
```typescript
describe('validateEmail', () => {
  it('should accept valid emails', () => {
    expect(validateEmail('user@example.com')).toBe(true);
  });
  
  // Negative tests
  it('should reject emails without @', () => {
    expect(validateEmail('notanemail')).toBe(false);
  });
  
  it('should reject empty strings', () => {
    expect(validateEmail('')).toBe(false);
  });
});
```

**Don't:**
```typescript
describe('validateEmail', () => {
  it('should accept valid emails', () => {
    expect(validateEmail('user@example.com')).toBe(true);
  });
  // Missing negative test cases!
});
```

**Why:** Negative tests ensure your error handling and validation logic work correctly. They catch regressions in edge cases and prevent bugs from reaching production.

### Pattern 2: Extract Reusable Test Helpers

**Do:**
```typescript
// test-helpers.ts
export function createMockUser(overrides = {}) {
  return {
    id: '123',
    name: 'Test User',
    email: 'test@example.com',
    createdAt: new Date('2024-01-01'),
    ...overrides,
  };
}

// test file
const user = createMockUser({ email: 'custom@test.com' });
const admin = createMockUser({ role: 'admin' });
```

**Don't:**
```typescript
// Repeating the same setup in every test
const user1 = { id: '123', name: 'Test User', email: 'test@example.com', ... };
const user2 = { id: '123', name: 'Test User', email: 'test@example.com', ... };
const user3 = { id: '123', name: 'Test User', email: 'test@example.com', ... };
```

**Why:** Test helpers reduce duplication, make tests more maintainable, and make test intent clearer by hiding boilerplate.

### Pattern 3: Choose the Right Testing Tool

**Jest for runtime behavior:**
```typescript
// Testing actual code execution
describe('calculateTotal', () => {
  it('should sum array of numbers', () => {
    const result = calculateTotal([10, 20, 30]);
    expect(result).toBe(60);
  });
  
  it('should handle empty arrays', () => {
    expect(calculateTotal([])).toBe(0);
  });
});
```

**tsd for type checking:**
```typescript
// Testing TypeScript types
import { expectType, expectError } from 'tsd';

// Test that type produces correct result
expectType<string>(myFunction(123));

// Test that invalid usage fails
expectError(myFunction('not-a-number'));
```

**Why:** Jest cannot verify TypeScript types (they're erased at runtime), and tsd cannot test runtime behavior. Use both for complete coverage.

### Pattern 4: Comprehensive Type Tests

**Do:**
```typescript
import { expectType, expectError, expectAssignable } from 'tsd';

// Positive cases
expectType<Readonly<{ a: string }>>(
  {} as DeepReadonly<{ a: string }>
);

expectType<Readonly<{ a: Readonly<{ b: number }> }>>(
  {} as DeepReadonly<{ a: { b: number } }>
);

// Negative cases
expectError(
  ({} as DeepReadonly<{ a: string }>).a = 'new value'
);

// Edge cases
expectType<{}>(
  {} as DeepReadonly<{}>
);

expectType<Readonly<string[]>>(
  {} as DeepReadonly<string[]>
);
```

**Don't:**
```typescript
// Only testing one simple case
expectType<Readonly<{ a: string }>>(
  {} as DeepReadonly<{ a: string }>
);
// Missing: nested objects, arrays, unions, negative cases, etc.
```

**Why:** Utility types are reusable infrastructure. They need thorough testing to prevent subtle bugs across your codebase.

## Key Principles

- **Test failure cases, not just success**: Negative tests are as important as positive ones
- **DRY in tests too**: Extract common setup into reusable helpers
- **Use the right tool**: Jest for behavior, tsd for types
- **Types are code**: Test your utility types as thoroughly as your functions

## Examples

### Complete Example: Testing a Type Guard

```typescript
// Implementation
function isString(value: unknown): value is string {
  return typeof value === 'string';
}

// Jest tests (runtime behavior)
describe('isString', () => {
  it('should return true for strings', () => {
    expect(isString('hello')).toBe(true);
    expect(isString('')).toBe(true);
  });
  
  it('should return false for non-strings', () => {
    expect(isString(123)).toBe(false);
    expect(isString(null)).toBe(false);
    expect(isString(undefined)).toBe(false);
    expect(isString({})).toBe(false);
  });
});

// tsd tests (type narrowing)
import { expectType } from 'tsd';

declare const value: unknown;

if (isString(value)) {
  expectType<string>(value); // Should narrow to string
} else {
  expectType<unknown>(value); // Should remain unknown
}
```

### Edge Cases

- For utility types, test: empty objects, unions, intersections, arrays, nested structures
- For async functions, test: success, rejection, timeout scenarios
- For error handling, test: all error types and error messages

## References

- See `llm/shared/typescript-testing.md` for more detailed examples
- [Jest Documentation](https://jestjs.io/docs/getting-started)
- [tsd Documentation](https://github.com/SamVerschueren/tsd)

