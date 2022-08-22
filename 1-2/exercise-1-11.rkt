#lang sicp

; Exercise 1.11
; A function f is defined by the rule that
; "f(n)=n" if n<3 and "f(n)=f(n-1)+2f(n-2)+3f(n-3)" if n≥3.
; Write a procedure that computes f by means of a recursive process.
; Write a procedure that computes f by means of an iterative process.

(define (f-recur n)
  (cond ((< n 3) n)
        (else (+ (f-recur (- n 1))
                 (* 2 (f-recur (- n 2)))
                 (* 3 (f-recur (- n 3)))))))

(define (f-iter n)
  (define (f x y z count)
    (cond ((< n 3) n)
          ((<= count 0) x)
          (else (f (+ x
                      (* 2 y)
                      (* 3 z))
                   x
                   y
                   (- count 1)))))
  (f 2 1 0 (- n 2)))