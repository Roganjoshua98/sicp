#lang sicp

; Exercise 1.6
; Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

(define (new-if predicate 
                then-clause 
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x) guess
          (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

; What happens when Alyssa attempts to use this to compute square roots? Explain.

;; Working with example (sqrt-iter 1.0 25.0)

;; Using regular if, the expression quickly evaluates to an answer approximately equalling 5.0

;; Using new-if, the procedure never evaluates, stuck in a recursive loop. This is due sqrt-iter having a line that calls itself. With applicative order evaluation, and due to this line being nested in a non-special form means that it will continually expand forever before ever processing the predicate, hoping to eventually reach an end point. Using the specfial form if instead means that the predicate is first evaluated before the next line is expanded out.