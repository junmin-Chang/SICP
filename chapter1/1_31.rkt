#lang racket

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1.0))

(define (inc n) (+ n 1))

(define (wallis-product n)
  (define (term n)
    (* (/ (* 2 n)
          (- (* 2 n) 1))
       (/ (* 2 n)
          (+ (* 2 n) 1))))
  (* 2 (product term 1.0 inc n)))

(define (wallis-product-iter n)
  (define (term n)
    (* (/ (* 2 n)
          (- (* 2 n) 1))
       (/ (* 2 n)
          (+ (* 2 n) 1))))
  (* 2 (product-iter term 1.0 inc n)))


(wallis-product 1000)
(wallis-product-iter 1000)
