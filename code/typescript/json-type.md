# JSON Type

Issue thread: https://github.com/microsoft/TypeScript/issues/1897

My contribution: https://github.com/microsoft/TypeScript/issues/1897#issuecomment-710744173

```ts
type Json = void | Date | null | boolean | number | string | Json[] | { [prop: string]: Json }

type primitive = null
    | boolean
    | number
    | string

type DefinitelyNotJsonable = ((...args: any[]) => any) | undefined

export type IsJsonable<T> =
    // Check if there are any non-jsonable types represented in the union
    // Note: use of tuples in this first condition side-steps distributive conditional types
    // (see https://github.com/microsoft/TypeScript/issues/29368#issuecomment-453529532)
    [Extract<T, DefinitelyNotJsonable>] extends [never]
        // Non-jsonable type union was found empty
        ? T extends primitive
            // Primitive is acceptable
            ? T
            // Otherwise check if array
            : T extends (infer U)[]
                // Arrays are special; just check array element type
                ? IsJsonable<U>[]
                // Otherwise check if object
                : T extends object
                    // It's an object
                    ? {
                        // Iterate over keys in object case
                        [P in keyof T]:
                            // Recursive call for children
                            IsJsonable<T[P]>
                    }
                    // Otherwise any other non-object no bueno
                    : never
        // Otherwise non-jsonable type union was found not empty
        : never
```
