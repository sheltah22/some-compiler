# Compiler
#### Author: Shelby Frazier

## Overview
This is a compiler for a toy language.

## Building and Testing
### Setup Instructions
You will need ocaml, opam and oasis installed to run the compiler.
1. Install ocaml and opam using your preferred package manager.
2. Then use opam to install oasis and menhir using `opam install oasis` and
   `opam install menhir`.

### Build Instructions
Run `make clean` to clean up the directory (if necessary), and run `make` to build the project.

### Execution Instructions
The compiler can be run using `./compiler.native`.

## Changelog

#### Assignment 3
1. New Features
  - if statements now have lazy execution
2. Changes to existing features
  - All binary operators are now infix operators
  - Changed `if` statement syntax to include `then` and `else` keywords
  - e ::= e1 + e1 | e1 - e2 | e1 * e2 | e1 / e2
      | e1 <= e2 | if e1 then e2 else e3 | e_base
  - e_base ::= n | true | false | (exp)
  - Precedence of operators:
    + Parenthesized expressions
    + All binary operations **(right associative)
    + Conditionals
3. Known Bugs
  [No known bugs yet]

#### Assignment 2
1. New Features
  - `./compiler.native <file.arith>` can be used to compile and print the result computed by a program using an S-expression language with the following syntax:
  - e ::= n | (+ e1 e2) | (- e1 e2) | (* e1 e2) | (/ e1 e2)
        | true | false | (<= e1 e2) | (if e1 e2 e3)
2. Changes to existing features
  - No longer prints command line arguments, or uses -length flag to print length of command line arguments
3. Known Bugs
  - If statements evaluate all branches before checking conditional


#### Assignment 1
1. New Features
  - `./compiler.native` will print any command line arguments given by the user, one per line.
  - the `-length` flag can be used to print the length of each command line argument instead.
2. Changes to existing features
  [No previously existing features yet]
3. Known Bugs
  [No known bugs yet]
