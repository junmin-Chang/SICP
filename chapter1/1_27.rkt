#lang racket


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (square n) (* n n))

(define (fermat-test n k)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it k))

(define (fast-prime? n k)
  (cond ((= k 0) #t)
        ((fermat-test n k) (fast-prime? n (- k 1)))
        (else #f)))

(display (fast-prime? 561 560))   (newline)
(display (fast-prime? 1105 1104)) (newline)
(display (fast-prime? 1729 1728)) (newline)
(display (fast-prime? 2465 2463)) (newline)
(display (fast-prime? 6601 6600)) (newline)
