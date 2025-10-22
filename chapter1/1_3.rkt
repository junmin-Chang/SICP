#lang racket

(define (pow x) (* x x))

(define (two_large_number x y z) (cond ((and (>= x y) (>= x z) (>= y z)) (+ (pow x) (pow y)))
                                       ((and (>= x z) (>= x y) (>= z y)) (+ (pow x) (pow z)))
                                       ((and (>= y x) (>= y z) (>= x z)) (+ (pow y) (pow x)))
                                       ((and (>= y z) (>= y x) (>= z x)) (+ (pow y) (pow z)))
                                       ((and (>= z x) (>= z y) (>= x y)) (+ (pow z) (pow x)))
                                       ((and (>= z y) (>= z x) (>= y x)) (+ (pow z) (pow y)))))

(two_large_number 1 2 3)
(two_large_number 3 2 1)
(two_large_number 2 3 1)
(two_large_number 1 3 2)
(two_large_number 2 1 3)
(two_large_number 3 1 2)

(two_large_number 5 5 5)
(two_large_number 5 6 5)
(two_large_number 6 6 5)
(two_large_number 5 1 1)
