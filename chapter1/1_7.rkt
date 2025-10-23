#lang racket

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))


(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.000000001)) ;; I reduced allowed gap.. for better approximation.

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x) (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt 9999)
(sqrt 9999999999) ;; something wrong here. For large number, computation won't end. 
(sqrt 0.00000001)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))

