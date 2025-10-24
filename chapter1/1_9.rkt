#lang racket

(define (inc n)
  (+ n 1)) ; inc 

(define (dec n)
  (- n 1))

; (define (+ a b)
;   (if (= a 0)
;       b
;       (inc (+ (dec a) b))))

; (+ 3 4)

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

(+ 3 4)


; two different version of (+ a b) are infinite recursion!
; because inc's body contains (+ n 1)
; so, whenever call inc
; --> (+ n 1) will be evaluated
; --> meet inc again
; --> (+ n 1) will be evaluated --> ... 
