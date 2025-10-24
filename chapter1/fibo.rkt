#lang racket

(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (fib2 n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib2 (- n 1))
                 (fib2 (- n 2))))))

(fib 50)
(fib2 50)
