#lang sicp

; Exercise 1.18
; Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative
; process for multiplying two integers in terms of adding, doubling, and halving and uses a
; logarithmic number of steps.

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (multiply a b)
  (define (multiply-iter a b c)
    (cond ((= b 0) c)
          ((even? b) (multiply-iter (double a) (halve b) c))
          (else (multiply-iter a (- b 1) (+ c a)))))
  (multiply-iter a b 0))