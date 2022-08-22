# Exercise 1.13

> Prove that $Fib(n)$ is the closest integer to $\phi^n/\sqrt{5}$, where $\phi=(1+\sqrt{5})/2$. Hint: Let $\psi=(1-\sqrt{5})/2$. Use induction and the definition of the Fibonacci numbers (see 1.2.2) to prove that $Fib(n)=(\phi^n - \psi^n)/\sqrt{5}$

Ngl I am here for the programming not the maths. I've read the proof [here](https://codology.net/post/sicp-solution-exercise-1-13/), it makes enough sense. I don't think I could reproduce it but I'm also not really trying to.

To write a proof, first you must prove the base case. For Fib(n), it's where n=0 and n=1.

Next, assume Fib(n) is true up to some value k and then prove Fib(k+1) using the hypothesised statement that $Fib(n) = \phi^n/\sqrt{5}$. This step is helped with the fact that Fib(n+1) = Fib(n) + Fib(n-1).

