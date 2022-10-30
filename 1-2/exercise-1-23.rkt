#lang sicp

; Exercise 1.23
; The smallest-divisor procedure shown at the start of this section does lots of needless testing:
; After it checks to see if the number is divisible by 2 there is no point in checking to see if it
; is divisible by any larger even num- bers. This suggests that the values used for test-divisor
; should not be 2, 3, 4, 5, 6, . . ., but rather 2, 3, 5, 7, 9, . . ..

; To implement this change, define a procedure next that re- turns 3 if its input is equal to 2
; and otherwise returns its in- put plus 2.

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

; Modify the smallest-divisor procedure to use (next test-divisor) instead of (+ test-divisor 1).
; With timed-prime-test incorporating this modified ver- sion of smallest-divisor, run the test for
; each of the 12 primes found in Exercise 1.22. 

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x)
  (* x x))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes lower upper)
  (define (iter n)
    (cond ((<= n upper) (timed-prime-test n) (iter (+ n 2)))))
  (iter (if (odd? lower) lower (+ lower 1))))

; Since this modification halves the number of test steps, you should expect it to run about twice as
; fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two
; algorithms, and how do you explain the fact that it is different from 2?

;; The speed ratio is closer to 1.5 than 2, likely because the next procedure has to do extra checks
;; not previously present