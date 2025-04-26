---
date: 2025-04-25
tags: ["books"]
aliases: [Garbage Collection]
date created: Friday,2025 April 25th, 4:53:51 pm
date modified: Friday,2025 April 25th, 4:54:25 pm
---

# 26.  [Garbage Collection](https://craftinginterpreters.com/garbage-collection.html)

What does dynamic memory allocation make possible? Well, you just need a managed language which manages memory on the user’s behalf and features a garbage collector. 
A **garbage collector** is component which reclaims memory that the program no longer needed. If a language manages memory allocation and freeing on the user’s behalf, it is called a **managed language**.
## Two types garbage collector

A **conservative GC** considers any piece of memory to be a pointer if the value in there looks like it could be an address.

A **precise GC** knows exactly which words in memory are pointers and which store other kinds of values like numbers or strings.

## 1. [Reachability](https://craftinginterpreters.com/garbage-collection.html#reachability)

```
var a = "first value"; // This is reachable because it is referenceable.
a = "updated"; // The string “first value” became unreachable.
// GC here.
print a;
```

A value is **reachable** if there is some way for a user program to reference it. Otherwise, like the string “first value” here, it is **unreachable**.

A **root** is any object that the VM can reach directly without going through a reference in some other object.

An inductive definition of reachability:
- All roots are reachable.
- Any object referred to from a reachable object is itself reachable.

Any value that _doesn’t_ meet this definition is fair game for the collector to reap.

A recursive algorithm we can use to free up unneeded memory:
1. Starting with the roots, traverse through object references to find the full set of reachable objects.
2. Free all objects _not_ in that set.

All garbage collection algorithms roughly follow that same structure.
## 2. [Mark-Sweep Garbage Collection](https://craftinginterpreters.com/garbage-collection.html#mark-sweep-garbage-collection)

## 3. [Marking the Roots](https://craftinginterpreters.com/garbage-collection.html#marking-the-roots)

## 4. [Tracing Object References](https://craftinginterpreters.com/garbage-collection.html#tracing-object-references)

## 5. [Sweeping Unused Objects](https://craftinginterpreters.com/garbage-collection.html#sweeping-unused-objects)

## 6. [When to Collect](https://craftinginterpreters.com/garbage-collection.html#when-to-collect)
### 6.1. [Latency and throughput](https://craftinginterpreters.com/garbage-collection.html#latency-and-throughput)

### 6.2. [Self-adjusting heap](https://craftinginterpreters.com/garbage-collection.html#self-adjusting-heap)

## 7. [Garbage Collection Bugs](https://craftinginterpreters.com/garbage-collection.html#garbage-collection-bugs)

### 7.1. [Adding to the constant table](https://craftinginterpreters.com/garbage-collection.html#adding-to-the-constant-table)

### 7.2. [Interning strings](https://craftinginterpreters.com/garbage-collection.html#interning-strings)

### 7.3.  [Concatenating strings](https://craftinginterpreters.com/garbage-collection.html#concatenating-strings)

