# Exercise 1.15

> The sine of an angle (specified in radians) can be computed by making use of the approximation $sin(x) ≈ x$ if x is sufficiently small, and the trigonometric identity $sin(x) = 3sin(x/3) - 4sin^3(x/3)$ to reduce the size of the argument of sin. (For purposes of this exercise an angle is considered “sufficiently small” if its magnitude is not greater than 0.1 radians.) These ideas are incorporated in the following procedures:

``` Racket
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
```

## 1. How many times is the procedure p applied when (sine 12.15) is evaluated?

(sine 12.15)

(p (sine 4.05))

(p (p (sine 1.35)))

...

(p (p (p (p (p 0.05)))))

p is called 5 times

## 2. What is the order of growth in space and number of steps (as a function of a) used by the process generated by the sine procedure when (sine a) is evaluated?

Since the angle is divided by three at each step, this means that when the angle is three times bigger, it only adds one additional step. This corresponds to O(log(n)) complexity.
