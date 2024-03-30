# TypeScript Oddities

## Conditional Type Narrowing

"else" branches of conditional types don't narrow type parameters

https://discord.com/channels/508357248330760243/1157116349416493056/1157120466935369838

```ts
type X<T extends 1 | 2> = T extends 1 ? Y<T> : Z<T>
//                                               ^
// Type 'T' does not satisfy the constraint '2'.
//   Type '1 | 2' is not assignable to type '2'.
//     Type '1' is not assignable to type '2'.
type Y<T extends 1> = T
type Z<T extends 2> = T
```

## Variance

[Methods are bivariant](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-2-6.html#strict-function-types), which introduces some type unsoundness.
