---
title: "Continuation-passing style - Wikipedia"
source: "https://en.wikipedia.org/wiki/Continuation-passing_style"
author:
published:
created: 2025-04-19
description:
tags: ["clippings"]
date created: Saturday,2025 April 19th, 4:43:40 pm
date modified: Sunday,2025 April 27th, 2:31:39 am
---

In [functional programming](https://en.wikipedia.org/wiki/Functional_programming "Functional programming"), **continuation-passing style** (**CPS**) is a style of programming in which [control](https://en.wikipedia.org/wiki/Control_flow "Control flow") is passed explicitly in the form of a [continuation](https://en.wikipedia.org/wiki/Continuation "Continuation"). This is contrasted with direct style, which is the usual style of programming. [Gerald Jay Sussman](https://en.wikipedia.org/wiki/Gerald_Jay_Sussman "Gerald Jay Sussman") and [Guy L. Steele, Jr.](https://en.wikipedia.org/wiki/Guy_L._Steele,_Jr. "Guy L. Steele, Jr.") coined the phrase in [AI Memo](https://en.wikipedia.org/wiki/AI_Memo "AI Memo") 349 (1975), which sets out the first version of the programming language [Scheme](https://en.wikipedia.org/wiki/Scheme_\(programming_language\) "Scheme (programming language)").[^1] [^2] [John C. Reynolds](https://en.wikipedia.org/wiki/John_C._Reynolds "John C. Reynolds") gives a detailed account of the many discoveries of continuations.[^3]

A function written in continuation-passing style takes an extra argument: an explicit *continuation*; i.e., a function of one argument. When the CPS function has computed its result value, it "returns" it by calling the continuation function with this value as the argument. That means that when invoking a CPS function, the calling function is required to supply a procedure to be invoked with the subroutine's "return" value. Expressing code in this form makes a number of things explicit which are implicit in direct style. These include: procedure returns, which become apparent as calls to a continuation; intermediate values, which are all given names; order of argument evaluation, which is made explicit; and [tail calls](https://en.wikipedia.org/wiki/Tail_call "Tail call"), which simply call a procedure with the same continuation, unmodified, that was passed to the caller.

Programs can be automatically transformed from direct style to CPS. Functional and [logic](https://en.wikipedia.org/wiki/Logic_programming "Logic programming") compilers often use CPS as an [intermediate representation](https://en.wikipedia.org/wiki/Intermediate_representation "Intermediate representation") where a compiler for an [imperative](https://en.wikipedia.org/wiki/Imperative_programming "Imperative programming") or [procedural](https://en.wikipedia.org/wiki/Procedural_programming "Procedural programming") [programming language](https://en.wikipedia.org/wiki/Programming_language "Programming language") would use [static single assignment form](https://en.wikipedia.org/wiki/Static_single_assignment_form "Static single assignment form") (SSA).[^4] SSA is formally equivalent to a subset of CPS (excluding non-local control flow, which does not occur when CPS is used as intermediate representation).[^5] Functional compilers can also use [A-normal form](https://en.wikipedia.org/wiki/A-normal_form "A-normal form") (ANF) (but only for languages requiring eager evaluation), rather than with *[thunks](https://en.wikipedia.org/wiki/Thunk "Thunk")* (described in the examples below) in CPS. CPS is used more frequently by [compilers](https://en.wikipedia.org/wiki/Compiler "Compiler") than by programmers as a local or global style.

# Examples

In CPS, each procedure takes an extra argument representing what should be done with the result the function is calculating. This, along with a restrictive style prohibiting a variety of constructs usually available, is used to expose the semantics of programs, making them easier to analyze. This style also makes it easy to express unusual control structures, like `catch/throw` or other non-local transfers of control.

The key to CPS is to remember that (a) *every* function takes an extra argument known as its continuation, and (b) every argument in a function call must be either a variable or a [lambda expression](https://en.wikipedia.org/wiki/Lambda_\(programming\) "Lambda (programming)") (not a more complex expression). This has the effect of turning expressions "inside-out" because the innermost parts of the expression must be evaluated first, thus CPS makes explicit the order of evaluation as well as the control flow. Some examples of code in direct style and the corresponding CPS appear below. These examples are written in the programming language [Scheme](https://en.wikipedia.org/wiki/Scheme_\(programming_language\) "Scheme (programming language)"); by convention the continuation function is represented as a parameter named " `k` ":

| Direct style                                                                                                                               | Continuation passing style                                                                                                                                                                                                                                                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ``` (define (pyth x y)  (sqrt (+ (* x x) (* y y)))) ```                                                                                    | ``` (define (pyth& x y k)  (*& x x (lambda (x2)           (*& y y (lambda (y2)                    (+& x2 y2 (lambda (x2py2)                               (sqrt& x2py2 k)))))))) ```                                                                                                                                                                              |
| ``` (define (factorial n)  (if (= n 0)      1     ; NOT tail-recursive      (* n (factorial (- n 1))))) ```                                | ``` (define (factorial& n k)  (=& n 0 (lambda (b)           (if b                    ; growing continuation               (k 1)                ; in the recursive call               (-& n 1 (lambda (nm1)                        (factorial& nm1 (lambda (f)                                         (*& n f k))))))))) ```                                      |
| ``` (define (factorial n)  (f-aux n 1)) (define (f-aux n a)  (if (= n 0)      a        ; tail-recursive      (f-aux (- n 1) (* n a)))) ``` | ``` (define (factorial& n k) (f-aux& n 1 k)) (define (f-aux& n a k)  (=& n 0 (lambda (b)           (if b                    ; unmodified continuation               (k a)                ; in the recursive call               (-& n 1 (lambda (nm1)                         (*& n a (lambda (nta)                                 (f-aux& nm1 nta k))))))))) ``` |

In the CPS versions, the primitives used, like `+&` and `*&` are themselves CPS, not direct style, so to make the above examples work in a Scheme system requires writing these CPS versions of primitives, with for instance `*&` defined by:

```
(define (*& x y k)
 (k (* x y)))
```

To do this in general, we might write a conversion routine:

```
(define (cps-prim f)
 (lambda args
  (let ((r (reverse args)))
   ((car r) (apply f
             (reverse (cdr r)))))))
(define *& (cps-prim *))
(define +& (cps-prim +))
```

To call a procedure written in CPS from a procedure written in direct style, it is necessary to provide a continuation that will receive the result computed by the CPS procedure. In the example above (assuming that CPS primitives have been provided), we might call `(factorial& 10 (lambda (x) (display x) (newline)))`.

There is some variety between compilers in the way primitive functions are provided in CPS. Above is used the simplest convention, however sometimes Boolean primitives are provided that take two [thunks](https://en.wikipedia.org/wiki/Thunk "Thunk") to be called in the two possible cases, so the `(=& n 0 (lambda (b) (if b ...)))` call inside `f-aux&` definition above would be written instead as `(=& n 0 (lambda () (k a)) (lambda () (-& n 1 ...)))`. Similarly, sometimes the `if` primitive is not included in CPS, and instead a function `if&` is provided which takes three arguments: a Boolean condition and the two thunks corresponding to the two arms of the conditional.

The translations shown above show that CPS is a global transformation. The direct-style *factorial* takes, as might be expected, a single argument; the CPS *factorial&* takes two: the argument and a continuation. Any function calling a CPS-ed function must either provide a new continuation or pass its own; any calls from a CPS-ed function to a non-CPS function will use implicit continuations. Thus, to ensure the total absence of a function stack, the entire program must be in CPS.

A function `pyth` to calculate a hypotenuse using the [Pythagorean theorem](https://en.wikipedia.org/wiki/Pythagorean_theorem "Pythagorean theorem") can be written in [Haskell](https://en.wikipedia.org/wiki/Haskell "Haskell"). A traditional implementation of the `pyth` function looks like this:

```
pow2 :: Float -> Float
pow2 x = x ** 2

add :: Float -> Float -> Float
add x y = x + y

pyth :: Float -> Float -> Float
pyth x y = sqrt (add (pow2 x) (pow2 y))
```

To transform the traditional function to CPS, its signature must be changed. The function will get another argument of function type, and its return type depends on that function:

```
pow2' :: Float -> (Float -> a) -> a
pow2' x cont = cont (x ** 2)

add' :: Float -> Float -> (Float -> a) -> a
add' x y cont = cont (x + y)

-- Types a -> (b -> c) and a -> b -> c are equivalent, so CPS function
-- may be viewed as a higher order function
sqrt' :: Float -> ((Float -> a) -> a)
sqrt' x = \cont -> cont (sqrt x)

pyth' :: Float -> Float -> (Float -> a) -> a
pyth' x y cont = pow2' x (\x2 -> pow2' y (\y2 -> add' x2 y2 (\anb -> sqrt' anb cont)))
```

First we calculate the square of *a* in `pyth'` function and pass a lambda function as a continuation which will accept a square of *a* as a first argument. And so on until the result of the calculations are reached. To get the result of this function we can pass `id` function as a final argument which returns the value that was passed to it unchanged: `pyth' 3 4 id == 5.0`.

The mtl [library](https://en.wikipedia.org/wiki/Library_\(computing\) "Library (computing)"), which is shipped with [Glasgow Haskell Compiler](https://en.wikipedia.org/wiki/Glasgow_Haskell_Compiler "Glasgow Haskell Compiler") (GHC), has the module `Control.Monad.Cont`. This module provides the Cont type, which implements Monad and some other useful functions. The following snippet shows the `pyth'` function using Cont:

```
pow2_m :: Float -> Cont a Float
pow2_m a = return (a ** 2)

pyth_m :: Float -> Float -> Cont a Float
pyth_m a b = do
  a2 <- pow2_m a
  b2 <- pow2_m b
  anb <- cont (add' a2 b2)
  r <- cont (sqrt' anb)
  return r
```

Not only has the syntax become cleaner, but this type allows us to use a function `callCC` with type `MonadCont m => ((a -> m b) -> m a) -> m a`. This function has one argument of a function type; that function argument accepts the function too, which discards all computations going after its call. For example, let's break the execution of the `pyth` function if at least one of its arguments is negative returning zero:

```
pyth_m :: Float -> Float -> Cont a Float
pyth_m a b = callCC $ \exitF -> do -- $ sign helps to avoid parentheses: a $ b + c == a (b + c)
  when (b < 0 || a < 0) (exitF 0.0) -- when :: Applicative f => Bool -> f () -> f ()
  a2 <- pow2_m a
  b2 <- pow2_m b
  anb <- cont (add' a2 b2)
  r <- cont (sqrt' anb)
  return r
```

Programming with continuations can also be useful when a caller does not want to wait until the callee completes. For example, in [user interface](https://en.wikipedia.org/wiki/User_interface "User interface") (UI) programming, a routine can set up dialog box fields and pass these, along with a continuation function, to the UI framework. This call returns right away, allowing the application code to continue while the user interacts with the dialog box. Once the user presses the "OK" button, the framework calls the continuation function with the updated fields. Although this style of coding uses continuations, it is not full CPS.

```
function confirmName() {
    fields.name = name;
    framework.Show_dialog_box(fields, confirmNameContinuation);
}

function confirmNameContinuation(fields) {
    name = fields.name;
}
```

A similar idea can be used when the function must run in a different thread or on a different processor. The framework can execute the called function in a worker thread, then call the continuation function in the original thread with the worker's results. This is in [Java](https://en.wikipedia.org/wiki/Java_\(programming_language\) "Java (programming language)") 8 using the [Swing](https://en.wikipedia.org/wiki/Swing_\(Java\) "Swing (Java)") UI framework:

```
void buttonHandler() {
    // This is executing in the Swing UI thread.
    // We can access UI widgets here to get query parameters.
    int parameter = getField();

    new Thread(() -> {
        // This code runs in a separate thread.
        // We can do things like access a database or a 
        // blocking resource like the network to get data.
        int result = lookup(parameter);

        javax.swing.SwingUtilities.invokeLater(() -> {
            // This code runs in the UI thread and can use
            // the fetched data to fill in UI widgets.
            setField(result);
        });
    }).start();
}
```

# Tail calls

Every call in CPS is a [tail call](https://en.wikipedia.org/wiki/Tail_call "Tail call"), and the continuation is explicitly passed. Using CPS without *tail call optimization* (TCO) will cause both the constructed continuation to potentially grow during recursion, and the [call stack](https://en.wikipedia.org/wiki/Call_stack "Call stack"). This is usually undesirable, but has been used in interesting ways; see the [Chicken Scheme](https://en.wikipedia.org/wiki/Chicken_\(Scheme_implementation\)#Design "Chicken (Scheme implementation)") compiler. As CPS and TCO eliminate the concept of an implicit function return, their combined use can eliminate the need for a run-time stack. Several compilers and interpreters for [functional programming](https://en.wikipedia.org/wiki/Functional_programming "Functional programming") languages use this ability in novel ways.[^6]

Continuation passing style can be used to implement continuations and control flow operators in a functional language that does not feature first-class [continuations](https://en.wikipedia.org/wiki/Continuation "Continuation") but does have [first-class functions](https://en.wikipedia.org/wiki/First-class_function "First-class function") and [tail-call optimization](https://en.wikipedia.org/wiki/Tail-call_optimization "Tail-call optimization"). Without tail-call optimization, techniques such as [trampolining](https://en.wikipedia.org/wiki/Trampoline_\(computers\) "Trampoline (computers)"), i.e., using a loop that iteratively invokes [thunk](https://en.wikipedia.org/wiki/Thunk "Thunk") -returning functions, can be used; without first-class functions, it is even possible to convert tail calls into just gotos in such a loop.

Writing code in CPS, while not impossible, is often error-prone. There are various translations, usually defined as one- or two-pass conversions of pure [lambda calculus](https://en.wikipedia.org/wiki/Lambda_calculus "Lambda calculus"), which convert direct style expressions into CPS expressions. Writing in trampolined style, however, is extremely difficult; when used, it is usually the target of some sort of transformation, such as [compilation](https://en.wikipedia.org/wiki/Compiler "Compiler").

Functions using more than one continuation can be defined to capture various control flow paradigms, for example (in [Scheme](https://en.wikipedia.org/wiki/Scheme_\(programming_language\) "Scheme (programming language)")):

```
(define (/& x y ok err)
 (=& y 0.0 (lambda (b)
            (if b
                (err (list "div by zero!" x y))
                (ok (/ x y))))))
```

A CPS transform is conceptually a [Yoneda embedding](https://en.wikipedia.org/wiki/Yoneda_embedding "Yoneda embedding").[^7] It is also similar to the embedding of [lambda calculus](https://en.wikipedia.org/wiki/Lambda_calculus "Lambda calculus") in [π-calculus](https://en.wikipedia.org/wiki/%CE%A0-calculus "Π-calculus").[^8] [^9]

Outside of [computer science](https://en.wikipedia.org/wiki/Computer_science "Computer science"), CPS is of more general interest as an alternative to the conventional method of composing simple expressions into complex expressions. For example, within linguistic [semantics](https://en.wikipedia.org/wiki/Semantics "Semantics"), [Chris Barker](https://en.wikipedia.org/wiki/Chris_Barker_\(linguist\) "Chris Barker (linguist)") and his collaborators have suggested that specifying the denotations of sentences using CPS might explain certain phenomena in [natural language](https://en.wikipedia.org/wiki/Natural_language "Natural language").[^10]

In [mathematics](https://en.wikipedia.org/wiki/Mathematics "Mathematics"), the [Curry–Howard isomorphism](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_isomorphism "Curry–Howard isomorphism") between computer programs and mathematical proofs relates continuation-passing style translation to a variation of double-negation [embeddings](https://en.wikipedia.org/wiki/Embedding "Embedding") of [classical logic](https://en.wikipedia.org/wiki/Classical_logic "Classical logic") into [intuitionistic (constructive) logic](https://en.wikipedia.org/wiki/Intuitionistic_logic "Intuitionistic logic"). Unlike the regular [double-negation translation](https://en.wikipedia.org/wiki/Double-negation_translation "Double-negation translation"), which maps atomic propositions *p* to ((*p* → ⊥) → ⊥), the continuation passing style replaces ⊥ by the type of the final expression. Accordingly, the result is obtained by passing the [identity function](https://en.wikipedia.org/wiki/Identity_function "Identity function") as a continuation to the CPS expression, as in the above example.

Classical logic itself relates to manipulating the continuation of programs directly, as in Scheme's [call-with-current-continuation](https://en.wikipedia.org/wiki/Call-with-current-continuation "Call-with-current-continuation") control operator, an observation due to Tim Griffin (using the closely related C control operator).[^11]

# See also

- [Tail recursion through trampolining](https://en.wikipedia.org/wiki/Tail_recursion#Through_trampolining "Tail recursion")

# Notes

# References

- Continuation Passing C (CPC) - [programming language for writing concurrent systems](http://www.pps.univ-paris-diderot.fr/~kerneis/software/), designed and developed by Juliusz Chroboczek and Gabriel Kerneis. [github repository](https://github.com/kerneis/cpc)
- The construction of a CPS-based compiler for [ML](https://en.wikipedia.org/wiki/ML_\(programming_language\) "ML (programming language)") is described in: [Appel, Andrew W.](https://en.wikipedia.org/wiki/Andrew_Appel "Andrew Appel") (1992). [*Compiling with Continuations*](https://books.google.com/books?id=0Uoecu9ju4AC). Cambridge University Press. [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [978-0-521-41695-5](https://en.wikipedia.org/wiki/Special:BookSources/978-0-521-41695-5 "Special:BookSources/978-0-521-41695-5").
- [Danvy, Olivier](https://en.wikipedia.org/wiki/Olivier_Danvy "Olivier Danvy"); Filinski, Andrzej (1992). "Representing Control, A Study of the CPS Transformation". *Mathematical Structures in Computer Science*. **2** (4): 361– 391. [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.46.84](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.46.84). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1017/S0960129500001535](https://doi.org/10.1017%2FS0960129500001535). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [8790522](https://api.semanticscholar.org/CorpusID:8790522).
- [Chicken Scheme compiler](https://en.wikipedia.org/wiki/Chicken_Scheme_compiler "Chicken Scheme compiler"), a [Scheme](https://en.wikipedia.org/wiki/Scheme_\(programming_language\) "Scheme (programming language)") to [C](https://en.wikipedia.org/wiki/C_\(programming_language\) "C (programming language)") compiler that uses continuation-passing style for translating Scheme procedures into C functions while using the C-stack as the nursery for the [generational garbage collector](https://en.wikipedia.org/wiki/Garbage_collection_\(computer_science\)#Generational_GC_\(aka_Ephemeral_GC\) "Garbage collection (computer science)")
- Kelsey, Richard A. (March 1995). "A Correspondence between Continuation Passing Style and Static Single Assignment Form". *ACM SIGPLAN Notices*. **30** (3): 13– 22. [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.3.6773](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.3.6773). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1145/202530.202532](https://doi.org/10.1145%2F202530.202532).
- [Appel, Andrew W.](https://en.wikipedia.org/wiki/Andrew_Appel "Andrew Appel") (April 1998). ["SSA is Functional Programming"](http://www.cs.princeton.edu/~appel/papers/ssafun.ps). *ACM SIGPLAN Notices*. **33** (4): 17– 20. [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.34.3282](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.3282). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1145/278283.278285](https://doi.org/10.1145%2F278283.278285). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [207227209](https://api.semanticscholar.org/CorpusID:207227209).
- Danvy, Olivier; Millikin, Kevin; Nielsen, Lasse R. (2007). ["On One-Pass CPS Transformations"](http://www.brics.dk/RS/07/6/). *BRICS Report Series*: 24. [ISSN](https://en.wikipedia.org/wiki/ISSN_\(identifier\) "ISSN (identifier)") [0909-0878](https://search.worldcat.org/issn/0909-0878). RS-07-6. Retrieved 26 October 2007.
- [Dybvig, R. Kent](https://en.wikipedia.org/wiki/R._Kent_Dybvig "R. Kent Dybvig") (2003). [*The Scheme Programming Language*](http://www.scheme.com/tspl3/). Prentice Hall. p. 64. Direct link: ["Section 3.4. Continuation Passing Style"](http://scheme.com/tspl3/further.html#./further:h4).

[^1]: [Sussman, Gerald Jay](https://en.wikipedia.org/wiki/Gerald_Jay_Sussman "Gerald Jay Sussman"); [Steele, Guy L. Jr.](https://en.wikipedia.org/wiki/Guy_L._Steele_Jr. "Guy L. Steele Jr.") (December 1975). ["Scheme: An interpreter for extended lambda calculus"](https://en.wikisource.org/wiki/Scheme:_An_interpreter_for_extended_lambda_calculus) . *[AI Memo](https://en.wikipedia.org/wiki/AI_Memo "AI Memo")*. **349**: 19. That is, in this **continuation-passing programming style**, *a function always "returns" its result by "sending" it to another function*. This is the key idea.
[^2]: [Sussman, Gerald Jay](https://en.wikipedia.org/wiki/Gerald_Jay_Sussman "Gerald Jay Sussman"); [Steele, Guy L. Jr.](https://en.wikipedia.org/wiki/Guy_L._Steele_Jr. "Guy L. Steele Jr.") (December 1998). ["Scheme: A Interpreter for Extended Lambda Calculus"](https://www.cs.ru.nl/~freek/courses/tt-2011/papers/cps/HOSC-11-4-pp405-439.pdf) (reprint). *Higher-Order and Symbolic Computation*. **11** (4): 405– 439. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1023/A:1010035624696](https://doi.org/10.1023%2FA%3A1010035624696). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [18040106](https://api.semanticscholar.org/CorpusID:18040106). We believe that this was the first occurrence of the term " **continuation-passing style** " in the literature. It has turned out to be an important concept in source code analysis and transformation for compilers and other metaprogramming tools. It has also inspired a set of other "styles" of program expression.
[^3]: [Reynolds, John C.](https://en.wikipedia.org/wiki/John_C._Reynolds "John C. Reynolds") (1993). "The Discoveries of Continuations". *LISP and Symbolic Computation*. **6** (3– 4): 233– 248. [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.135.4705](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.135.4705). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1007/bf01019459](https://doi.org/10.1007%2Fbf01019459). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [192862](https://api.semanticscholar.org/CorpusID:192862).
[^4]: [Appel, Andrew W.](https://en.wikipedia.org/wiki/Andrew_Appel "Andrew Appel") (April 1998). "SSA is Functional Programming". *ACM SIGPLAN Notices*. **33** (4): 17– 20. [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.34.3282](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.34.3282). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1145/278283.278285](https://doi.org/10.1145%2F278283.278285). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [207227209](https://api.semanticscholar.org/CorpusID:207227209).
[^5]: Kelsey, Richard A. (March 1995). "A Correspondence between Continuation Passing Style and Static Single Assignment Form". *ACM SIGPLAN Notices*. **30** (3): 13– 22. [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.489.930](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.489.930). [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1145/202530.202532](https://doi.org/10.1145%2F202530.202532).
[^6]: [Appel, Andrew W.](https://en.wikipedia.org/wiki/Andrew_Appel "Andrew Appel") (1992). *Compiling with Continuations*. Cambridge University Press. [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [0-521-41695-7](https://en.wikipedia.org/wiki/Special:BookSources/0-521-41695-7 "Special:BookSources/0-521-41695-7").
[^7]: Stay, Mike. (Report).
[^8]: Mike Stay,
[^9]: Boudol, Gérard (1997). "The π-Calculus in Direct Style". [CiteSeerX](https://en.wikipedia.org/wiki/CiteSeerX_\(identifier\) "CiteSeerX (identifier)") [10.1.1.52.6034](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.52.6034).
[^10]: Barker, Chris (2002-09-01). ["Continuations and the Nature of Quantification"](http://www.semanticsarchive.net/Archive/902ad5f7/barker.continuations.pdf) (PDF). *Natural Language Semantics*. **10** (3): 211– 242. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1023/A:1022183511876](https://doi.org/10.1023%2FA%3A1022183511876). [ISSN](https://en.wikipedia.org/wiki/ISSN_\(identifier\) "ISSN (identifier)") [1572-865X](https://search.worldcat.org/issn/1572-865X). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [118870676](https://api.semanticscholar.org/CorpusID:118870676).
[^11]: Griffin, Timothy (January 1990). "A formulae-as-type notion of control". *Proceedings of the 17th ACM SIGPLAN-SIGACT symposium on Principles of programming languages - POPL '90*. Vol. 17. pp. 47– 58. [doi](https://en.wikipedia.org/wiki/Doi_\(identifier\) "Doi (identifier)"):[10.1145/96709.96714](https://doi.org/10.1145%2F96709.96714). [ISBN](https://en.wikipedia.org/wiki/ISBN_\(identifier\) "ISBN (identifier)") [978-0-89791-343-0](https://en.wikipedia.org/wiki/Special:BookSources/978-0-89791-343-0 "Special:BookSources/978-0-89791-343-0"). [S2CID](https://en.wikipedia.org/wiki/S2CID_\(identifier\) "S2CID (identifier)") [3005134](https://api.semanticscholar.org/CorpusID:3005134).