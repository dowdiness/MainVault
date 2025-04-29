---
title: Introduction, Finite Automata, Regular Expression
publish: true
tags: [CS]
aliases: ['Introduction, Finite Automata, Regular Expression']
date: 2025-03-05
date created: Wednesday,2025 March 5th, 11:57:37 am
date modified: Tuesday,2025 April 29th, 3:31:28 pm
---

[Video](https://www.youtube.com/watch?v=9syvZr-9xwk&list=PLUl4u3cNGP60_JNv2MmK3wkOt9syvfQWY)
#  Finite automaton

## Formal definition

5-tuple $(Q, \Sigma, \delta, q_{0}, F)$

1. $Q$ is a finite set called the ***states***,
2. $Σ$ is a finite set called the ***alphabet***,
3. $δ: Q \times Σ \rightarrow Q$ is the ***transition function***,
4. $q_{0} \in Q$ is the ***start state***, and
5. $F \subseteq Q$ is the ***set of accept states***.

## Strings and language

- A **string** is a finite sequence of symbols in Σ
- A **language** is a set of strings (finte or infinite)
- The **empty string** $\epsilon$ is the string of length 0
- The **empty language** $\emptyset$ is the set with no strings

- $L(M)$ = {w| M accepts w}
- L(M) is the language of M
- M recognizes L(M)

## Regular language

DefA language is regular if some finite automaton recognizes it.

# Regular Expressions

Regular operations. Let A, B be languages
- Union: $A \bigcup B$
- Concatenation: $A \circ B$
- Star: $A^{*}$

Example. Let A = {good, bad} and Let B = {boy, girl}.
- $A \bigcup B$ = {good, bad, boy, girl}
- $A \circ B$ = $AB$ = {goodboy, goodgirl, badboy, badgirl}
- $A^{\ast}$ = {ε, good, bad, goodgood, goodbad, badgood, badbad, goodgoodgood, goodgoodbad, ... }

## Regular expressions

- Build from Σ, Members are $\Sigma, \emptyset, \epsilon$ [Atomic]
- By using $\bigcup, \circ, \ast$ [Composite]

Examples

- $(0 \bigcup 1)\ast$ = $\Sigma^{\ast}$
- $\Sigma^{\ast}1$ = a
- $\Sigma^{\ast}11\Sigma^{\ast}$ = a

### Closure properties for Regular Expressions

If $A_{1},A_{2}$ are regular languages, so is $A_{1} \bigcup A_{2}$ (closure under $\bigcup$)

The class of regular languages is closed under the union operations.