#lang sicp

; Exercise 1.8
; Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value
; (x/y^2)+2y / 3
; Use this formula to implement a cube-root procedure analogous to the square-root procedure

(define (square x)
  (* x x))

(define (3rt x)
  
  (define (good-enough? guess)
    (= (improve guess) guess))
  
  (define (improve guess)
    (/ (+ (/ x (square guess))
          (* 2 guess))
       3))
  
  (define (3rt-iter guess) 
    (if (good-enough? guess) guess
        (3rt-iter (improve guess))))
  
  (3rt-iter 1.1))