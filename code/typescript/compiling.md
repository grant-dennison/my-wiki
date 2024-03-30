# Compiling TypeScript

## In the Browser

TypeScript mainly is compiled via CLI in Node.js runtime.

However, TypeScript does have a [compiler API](https://github.com/microsoft/TypeScript/wiki/Using-the-Compiler-API).

[Some](https://web.archive.org/web/20230320230807/https://jakerunzer.com/running-ts-in-browser)
[people](https://blog.andrewbran.ch/overengineering-a-blog/)
have used this API to compile TypeScript in the browser.

This may be useful for Maven-adjacent browser engine game dev later.

Big drawback of this API is that it's all synchronous.
e.g. You can't provide files asynchronously for the API,
so you'd have to download all files from the server or load all into memory
before you can pass them into the compiler this way.

Seems like I'd probably want to start up a language service in a worker thread
and then keep that same language service running
in order to take advantage of incremental compilation advantages.

Might be getting way ahead of myself, but this would also theoretically provide
auto-complete etc. in addition to just checking types.

Not sure that the API provides a clean way to just get all compile errors
for the whole project since what I'm seeing so far is targeted at specific files.

FWIW (didn't get anything actionable from it yet), seems like TypeScript's
`tsc` CLI is primarily starting at https://github.com/microsoft/TypeScript/blob/main/src/executeCommandLine/executeCommandLine.ts
