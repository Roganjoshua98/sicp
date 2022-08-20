#lang sicp

; Exercise 1-4
; Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; the expression (if (> b 0) + -) is a conditional that decides whether the following expression is (+ a b) or (- a b) depending on whether b is positive or negative. in other words, it's a function returning an operation. interesting implications!