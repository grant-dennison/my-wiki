# Frameworks

This page contains some thoughts about some third-party tools
I've looked into for implementing Thy.

## Chevrotain

https://chevrotain.io/docs/

I originally implemented the language lexer in Chevrotain,
but the documented method for CST parsing ended up being quite the nightmare.
I rewrote the lexer and parser from scratch
and felt (even in retrospect) that doing so was way simpler than fighting Chevrotain.

## Langium

https://langium.org/

I did not find this tool until after my full launch of thy.dev.
i.e. I had already implemented an interpreter,
syntax highlighting in VS Code and browser,
and draft of lex-parse-generate implementation.

This tool seems incredibly powerful and may be the future of Thy.
However, there are a few shortcomings:
* Langium uses Chevrotain, which I didn't like.
  This _might_ be invisible as a consumer though.
* Langium doesn't support languages with significant whitespace.
  * https://github.com/eclipse-langium/langium/issues/1016
* Langium seems deeply integrated with VS Code / Monaco.
  I decided against Monaco as my web editor due to complexity,
  so Langium may not help with web editor.
* Langium heavily revolves around a language server,
  which may be a more complicated model than I care to maintain.

## Ace Editor

https://ace.c9.io

Originally I implemented the Thy web editor with Ace
because I thought it had decent mobile support.

The behavior ended up being a bit weird on mobile though,
so I moved away from it.
I don't think there was a specific consistent bad behavior;
I think it was some intermittent weirdness with indentation.

## CodeMirror

https://codemirror.net

CodeMirror would have been my first choice for web editor,
but there were two main reasons for rejecting:
* Implementing a language with CodeMirror 6 involves using Lezer,
  which is significantly more complicated IMO than regex-based solutions
  like textmate grammars and Prism.js
* CodeMirror rubs me the wrong way with its language about funding.
  > If you are using CodeMirror commercially, there is a social (but no legal) expectation that you help fund its maintenance.

I'm pretty sure I also felt that CodeMirror didn't function flawlessly on mobile,
but I don't remember how closely I looked into this.

## Prism.js

https://prismjs.com

Good tool. A little limited and a little old, but good enough.

## Highlight.js

https://highlightjs.org

Seems to be the main competitor to Prism.js.
As I understood it, this one predated the other.
I don't think there was a particular functional reason I picked Prism.js over this,
but I don't think I really tried this one either.
