# TypeScript Utility Types

TypeScript has official [utility types](https://www.typescriptlang.org/docs/handbook/utility-types.html),
but I've gathered some more from other sources.

## Expand

This type is mostly useful for debugging since it collapses TypeScript type aliases into literal types.

I first learned this from webstrand in the TypeScript Discord server,
but he also has a version of it posted in a [GitHub gist](https://gist.github.com/webstrand/b6c8a1bb019f156a3b2b0e553370b18d).

I think there are a couple variants of this.

```ts
type Expand<T> = T extends string | number | boolean | bigint | null | void | symbol | Function | Date ? T : { [K in keyof T]: T[K] }
```

## NoInfer

TODO: Add this definition in.

This type is useful for forcing TypeScript not to infer generic types from certain positions.

I think this might be less relevant now that TypeScript has the `in`/`out` keywords as of 4.7.
(aka. [variance annotations](https://devblogs.microsoft.com/typescript/announcing-typescript-4-7/#optional-variance-annotations-for-type-parameters))

## UnionToIntersection

From [the mind of jcalz](https://stackoverflow.com/a/50375286/4639640)

```ts
type UnionToIntersection<U> = 
  (U extends any ? (k: U)=>void : never) extends ((k: infer I)=>void) ? I : never
```
