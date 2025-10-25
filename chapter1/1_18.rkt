#lang racket

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (fast-mult-iter a b sum)
  (cond ((= b 0) sum)
        ((even? b) (fast-mult-iter (double a) (halve b) sum))
        (else (fast-mult-iter a (- b 1) (+ sum a)))))

(fast-mult-iter 4 4 0)
(fast-mult-iter 4 3 0)
(fast-mult-iter 4 9 0)
(fast-mult-iter 4 0 0)

