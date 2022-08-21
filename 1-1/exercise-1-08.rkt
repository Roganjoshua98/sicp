#lang sicp

; Exercise 1.8
; Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value
; (x/y^2)+2y / 3
; Use this formula to implement a cube-root procedure analogous to the square-root procedure

(define (square x)
  (* x x))

(define (3rt x) 

    (define (good-enough? guess x)
    (= (improve guess x) guess))

    (define (improve guess x)
        (/ (+ (/ x (square guess))
            (* 2 guess))
            3))

    (define (3rt-iter guess x) 
    (if (good-enough? guess x) guess
        (3rt-iter (improve guess x) x) ) )

  (3rt-iter 1.1 x))