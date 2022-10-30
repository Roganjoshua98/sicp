#lang sicp

; Exercise 1-22
; Most Lisp implementations include a prim- itive called runtime that returns an integer that
; specifies the amount of time the system has been running (mea- sured, for example, in microseconds).
; The following timed- prime-test procedure, when called with an integer n, prints n and checks to see
; if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time
; used in performing the test.

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

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

; Using this procedure, write a procedure `search-for-prime` that checks the primality of consecutive
; odd integers in a specified range. Use your procedure to find the three smallest primes larger than
; 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test
; each prime. Since the testing algorithm has order of growth of Θ(√n), you should expect that testing
; for primes around 10,000 should take about √10 times as long as testing for primes around 1000.

(define (search-for-primes lower upper)
  (define (iter n)
    (cond ((<= n upper) (timed-prime-test n) (iter (+ n 2)))))
  (iter (if (odd? lower) lower (+ lower 1)))) 

