# Thy Playground

This page is intended to document some scattered thoughts about where I want to take the Thy playground (web editor).

## Features Overview

* .thy vs .txt highlighting toggle
* `thy()` function (dependency resolution between files)
* User input?

## Dependency Resolution

I want dependency resolution in the playground to feel similar to its implementation in Node CLI and compiled code.

To that end, I think I want to rework the files API in the playground
to include a concept of modules.
Every saved file will belong to exactly one module,
and these modules will just be a top-level thing (no nested modules).

`thy("something")` resolves to
1. Builtin dependency
1. Export from other file in module
1. Entire module by name

Probably just say that collision in name here is undefined behavior to save on implementation/performance?

`thy("module.something")` resolves to
1. Export `something` from file in module `module`

### Tangential Change: Sharing

With `thy()` calls in the playground (and even just `files` calls today),
shared snippets will not work.
This limits the usefulness of the source-in-URL feature of the playground.

I may want to implement some kind of share-the-whole-module feature.
This gets a bit dicey though because (A) modules are based on *saved* files
(do I really want someone trying a module from someone else to necessarily write a bunch of files on load)
and (B) cross-module dependencies are probably a thing I want to implement.

It's possible I may just want to remove the source-in-URL sharing feature altogether.
Or just keep it the way it is...

I don't love the URL rewriting happening every frame. It doesn't feel terribly scalable.

But I also don't love the idea of making editor changes suddenly a bit impermanent.
I'm not entirely sure how I might achieve allowing arbitrary page refresh,
like is possible today, without source in URL.
Local storage doesn't really make sense for an "active tab" sort of thing.

Since there is saving capability, I guess I could just assume people will save,
but VS Code and Notepad++ don't to great effect.

Potentially I could have module vs. non-module mode,
where the non-module mode is shareable.
Or I could allow module-mode code to be exported to some non-module-mode code
that could be more easily shared.

New idea: Use pushState/popState state to keep tab permanence.
Add share button to put in URL.
Remove from URL (and put in invisible state) on load.

## User Input

With Thy having a significant design focus on newbie-friendliness,
I probably want some way that a beginner programmer can write a program
that has some user interaction and can be easily shared with a friend.

Probably the simplest solution here would be to provide an API
for JavaScript's `window.prompt()`,
but that interface always bugs me a bit (due to it's synchronous invasiveness),
and it's not terribly conducive to iterative development for a beginner.

I could do something more traditionally command-liney,
but that doesn't seem like it would fit super cleanly into the current UI.

I could have some alternate run view,
but at that point this starts to just feel like I might as well
get the Maven engine up and running for beginners to use.
