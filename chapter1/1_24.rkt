#lang racket/base

(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) start-time))
      (display "   Not prime")))


(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))




(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (square n) (* n n))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))




(define (find-prime-range start end)
  (if (even? start)
      (find-prime-range (+ 1 start) end)
      (cond ((> start end) "done")
            (else (timed-prime-test start)
                  (find-prime-range (+ 2 start) end)))))

(find-prime-range 100000000 1000000100)
