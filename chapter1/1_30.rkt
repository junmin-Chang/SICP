#lang racket

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (inc n) (+ n 1))
(define (cube n) (* n n n))
(define (identity n) n)


(define (sum-cubes a b)
  (sum cube a inc b))

(define (sum-integers a b)
  (sum identity a inc b))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(sum-cubes 1 10)
(sum-integers 1 10)
(* 8 (pi-sum 1 1000))
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
