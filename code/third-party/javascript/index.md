# JavaScript Tools

## Runtimes

* Node (obviously)
* Deno
  * Secure by default
  * Lightweight
  * TypeScript support
  * No dependency manager
* Bun
  * Trying to be the fastest
  * Windows support only experimental
  * Trying one-to-one catch-all with Node and JS ecosystem

## Running Maven as Native Application

Seems like easiest options would be
* [NW.js](https://nwjs.io)
  * Older
  * Maybe more targeted?
  * Backed by Intel
  * I've seen used in a couple games from Steam (I think both CrossCode and BioGun)
* [Electron](https://www.electronjs.org)
  * Newer
  * Market share
  * Backed by Microsoft (VS Code)
  * Not sure I've seen any games running on it

Not sure either of these would be sufficient for building to consoles,
but I'm not sure that's realistically an important goal for near term.

It's also possible I could do something lower level like a deno application
integrated with something like https://github.com/deno-windowing/dwm

Going even lower-level, I would probably get into using some JS engine
that I run from within some hand-written C++ (or the like) application.

## Alternative Engines

Wiki with links to a number of niche JS projects: https://github.com/linusg/ecmascript-wiki

Survey of some big JS engines by ES compliance: https://test262.fyi

Blog about custom JS compiler to C++: https://surma.dev/things/compile-js/

Wikipedia: https://en.wikipedia.org/wiki/List_of_ECMAScript_engines
