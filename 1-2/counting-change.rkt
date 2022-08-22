#lang sicp

; Counting Change
; How many different ways can we make change of $1.00, given half-dollars, quarters, dimes, nickels,
; and pennies? More generally, can we write a procedure to compute the number of ways to change any
; given amount of money?

; The number of ways to change amount a using n kinds of coins equals:
; - The number of ways to change amount a using all but the first kind of coin, plus
; - The number of ways to change amount a − d using all n kinds of coins,
;   where d is the denomination of the first kind of coin.

; If a is exactly 0, we should count that as 1 way to make change.
; If a is less than 0, we should count that as 0 ways to make change.
; If n is 0, we should count that as 0 ways to make change.

(define (first-denom n)
  (cond ((= n 1) 1)
        ((= n 2) 5)
        ((= n 3) 10)
        ((= n 4) 25)
        ((= n 5) 50)))
(define (recur-change a)
  (define (change-count a n)
    (cond ((= a 0) 1)
          ((or (< a 0)
               (= n 0))
           0)
          (else (+ (change-count a
                                 (- n 1))
                   (change-count (- a (first-denom n))
                                 n)))))
  (change-count a 5))

;; Come back to this later?

(define (iter-change a)
  
  (define (first-denom n)
    (cond ((= n 1) 1)
          ((= n 2) 5)
          ((= n 3) 10)
          ((= n 4) 25)
          ((= n 5) 50)))

  (define (change-count a n))
  
  (change-count a 5))