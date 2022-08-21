#lang sicp

; Exercise 1.7
; The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

(define (sqrt-iter guess x)
  (if (good-enough? guess x) guess
        (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

; original good-enough?
; (define (good-enough? guess x)
;   (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (root x) 
  (sqrt-iter 1.0 x))

;; good-enough? as it stands does not work well for very small and very large values. This is due to its hard-coded tolerance value. The solution is to rely on the computer reaching its precision limit on its own by checking the previous guess against the next guess. If they are the same, that means that computer is incapable of producing a more accurate answer - either because the precise answer *has* been reached, or simply because of hardware limitations. Implementation below:

(define (good-enough? guess x)
  (= (improve guess x) guess))