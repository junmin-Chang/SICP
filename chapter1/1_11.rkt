#lang racket

; n < 3 --> f(n) = n
; n >= 3 --> f(n) = f(n-1) + 2f(n-2) + 3f(n-3)


(define (f n)
  (cond ((< n 3) n)
        ((>= n 3) (+ (f (- n 1))
                     (* 2 (f (- n 2)))
                     (* 3 (f (- n 3)))))))

(define (f-iter n)
  (define (f-loop n-1 n-2 n-3 nth)
    (if (= n nth)
        n-1
        (f-loop (+ n-1 (* 2 n-2) (* 3 n-3))
                n-1
                n-2
                (+ 1 nth))))
  (if (< n 3)
      n
      (f-loop 2 1 0 2)))

(f 8)
(f-iter 8)
