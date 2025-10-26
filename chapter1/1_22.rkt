#lang racket/base
(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (display "   Not prime")))


(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))




(define (smallest-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (smallest-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (= (smallest-divisor n 2) n))

(define (divides? a b)
  (= (remainder a b) 0))

(define (square n) (* n n))

(define (find-prime-range start end)
  (if (even? start)
      (find-prime-range (+ 1 start) end)
      (cond ((> start end) "done")
            (else (timed-prime-test start)
                  (find-prime-range (+ 2 start) end)))))

(find-prime-range 100000000 1000000100)
