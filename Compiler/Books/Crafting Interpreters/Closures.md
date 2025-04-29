---
date: 2025-04-25
tags: ["books"]
aliases: [25. Closures, Closures]
created: 2025-04-25T16:52:32+09:00
modified: 2025-04-29T20:20:55+09:00
---


# 25. [Closures](https://www.craftinginterpreters.com/closures.html)

## 1. [Closure Objects](https://www.craftinginterpreters.com/closures.html#closure-objects)

## 2. [Upvalues](https://www.craftinginterpreters.com/closures.html#upvalues)

Fortunately, thanks to the Lua dev team, we have a solution. We use a level of indirection that they call an **upvalue**. An upvalue refers to a local variable in an enclosing function. Every closure maintains an array of upvalues, one for each surrounding local variable that the closure uses.

### 2.1. [Compiling upvalues](https://www.craftinginterpreters.com/closures.html#compiling-upvalues)
### 2.2. [Flattening upvalues](https://www.craftinginterpreters.com/closures.html#flattening-upvalues)
# 3. [Upvalue Objects](https://www.craftinginterpreters.com/closures.html#upvalue-objects)

## 3.1. [Upvalues in closures](https://www.craftinginterpreters.com/closures.html#upvalues-in-closures)
# 4. [Closed Upvalues](https://www.craftinginterpreters.com/closures.html#closed-upvalues)

## 4.1. [Values and variables](https://www.craftinginterpreters.com/closures.html#values-and-variables)

## 4.2. [Closing upvalues](https://www.craftinginterpreters.com/closures.html#closing-upvalues)

## 4.3. [Tracking open upvalues](https://www.craftinginterpreters.com/closures.html#tracking-open-upvalues)

## 4.4. [Closing upvalues at runtime](https://www.craftinginterpreters.com/closures.html#closing-upvalues-at-runtime)