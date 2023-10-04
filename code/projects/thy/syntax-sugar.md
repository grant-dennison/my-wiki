# Thy Syntax Sugar

I've considered some different syntax sugars for Thy.

## Strings

I think I've already largely implemented string stuff.
We have multiline string and string interpolation.
There is still work to be done with tokenizing strings further
to account for this stuff in source-mapping and syntax highlighting though.

## Math

I think at some point I want to allow math literals
probably with a syntax of parentheses wrapping:
`doSomethingWithNumber (x + (y - z + 2))`
