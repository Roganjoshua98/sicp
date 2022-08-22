#lang sicp

; Exercise 1.12
; The following pattern of numbers is called Pascal’s triangle.

;          1
;        1   1
;      1   2   1
;    1   3   3   1
;  1   4   6   4   1
;        . . .

; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the
; sum of the two numbers above it. Write a procedure that computes elements of Pascal’s triangle
; by means of a recursive process.

(define (pascal row col)
  (cond ((or (= col 1)
             (= col row))
         1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

; (pascal 3 2)
; (+ (pascal (- 3 1) (- 2 1)) (pascal (- 3 1) col))
; (+ (pascal 2 1) (pascal 2 2))
; (+ 1 1)
; 2

;; To find out point (r, c), you need the sum of (r-1, c-1) and (r-1, c)
;; To find out point (r-1, c-1), you need the sum of (r-2, c-2) and (r-2, c-1)
;; Repeat the process until you hit the edges of the triangle, which are always 1

