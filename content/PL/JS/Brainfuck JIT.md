---
aliases: [ELF(Executable and Linkable Format)]
created: 2025-03-28T14:48:01+09:00
modified: 2025-04-29T20:17:25+09:00
---

https://www.youtube.com/watch?v=mbFY3Rwv7XM

reference
https://github.com/shigemk2/bfjit-node

ffi
https://github.com/node-ffi-napi/node-ffi-napi

https://github.com/zhangyuang/node-ffi-rs

# ELF(Executable and Linkable Format)

[ELF parser入門 in Rust](https://zenn.dev/drumato/books/afc3e00a4c7f1d)

https://www-users.cse.umn.edu/~smccaman/courses/8980/spring2020/lectures/04-elf-v2-8up.pdf

# Segments and Sections

[Inside Specs: ELF Segments and Sections](https://dvdhrm.github.io/2020/04/26/inside-specs-elf-segments-and-sections/)

Segments are for run time

Sections are for linkers

main sections
- .text: most code
- .rodata: read-only data like string constants
- .data: initialized data (values stored in file)
- .bss: zero-initialized data (zeros not stored)