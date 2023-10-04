# Node Runtime

## CLI

Options:

* `thy` - just load whole module
* `thy <function name>` - run export from module
* `thy <file name>` - run file

Despite the limited appeal of the first two,
the file-based option (`thy <file name>`)
is really the API I (and I think other devs) would want.

For dependency resolution within this Node runtime,
I want it to behave the same as it would in other Thy contexts.
To this end, we want the whole module to be implied
but selectively interpreted based on what dependencies are actually requested.

Logically, we're loading all files in the current directory (recursively),
but we won't run all of logic.

In the interest of performance, we'll try stuff in this order to hopefully short-circuit:
1. built-ins / supplied (e.g. node dependencies)
1. top-level files
1. lower-level (recursing) files

## Example

`thy my-script.thy` (CLI) would execute the top-level code in `my-script.thy`

`thy "myDependency"` (Thy code) would look for a file in the module
that exports `myDependency`, run (interpret) that file, and return that dependency.

By default, "the module" in the previous paragraph would be
all of the `*.thy` files in (recursively) the current directory.
Using a different implied module would probably look something like
`thy --files "*.specific.thy" my-script.thy`.

## Implied Changes

`interpretThyBlock()` (or whatever it is called) just returns a function atm,
but it will need to be modified to return both the function and list of the exports.
Although this is a bit less than ideal,
it aligns with recent necessary changes to the `thy()` function design
per limitations of TypeScript type inference.
