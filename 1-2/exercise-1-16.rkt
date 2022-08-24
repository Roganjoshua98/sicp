#lang sicp

; Exercise 1.16
; Design a procedure that evolves an iterative exponentiation process that uses successive squaring
; and uses a logarithmic number of steps, as does fast-expt.

; (Hint: Using the observation that (b^(n/2))^2 = (b^2)^(n/2), keep, along with the exponent n and
; the base b, an additional state variable a, and define the state transformation in such a way that
; the product abn is unchanged from state to state. At the beginning of the process a is taken to be
; 1, and the answer is given by the value of a at the end of the process. In general, the technique of
; defining an invariant quantity that remains unchanged from state to state is a powerful way to think
; about the design of iterative algorithms.)

;; Previous fast-exp example

(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

(define (square n)
  (* n n))

(define (even? n)
  (= (remainder n 2) 0))

;; Iterative fast-exp
;; Using the provided hint, we should start from a = 1 and build up by multiplication to the desired
;; answer with b * a. The even? block stumped me a bit, but again, using the provided hint's
;; observation and the recursive fast-exp, (square (fast-exp b (/ n 2))) can be rearranged to
;; work alongside the new a variable.

(define (exp b n)
  (define (iter-fast-exp b n a)
    (cond ((= n 0)
           a)
          ((even? n)
           (iter-fast-exp (square b) (/ n 2) a))
          (else
           (iter-fast-exp b (- n 1) (* b a)))))
  (iter-fast-exp b n 1))