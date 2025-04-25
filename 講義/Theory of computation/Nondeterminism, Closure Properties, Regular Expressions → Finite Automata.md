# Goals

- Nondeterminism
- Closure under $\circ$ and $\ast$
- Regular expressions $\rightarrow$ finite automata
## Nondeterminism

- multiple paths possible (0, 1 or many at each step)
- ε-transition is a "free" move without reading input
- Accept input if some path leads to accept

Nondetrministic finite automata

$\delta: Q * \Sigma_{\epsilon} \rightarrow P(Q) = \{R|R \subseteq Q\}$ 

$\Sigma_{\epsilon} = \Sigma \bigcup \{\epsilon\}$
P(Q) is a power set

