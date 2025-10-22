#lang racket

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

;; applicative order eval --> when eval (p) we'll getting infinite loop by recursion
;; normal order eval --> map these whole combination until there are no more reduction available
;                        and we finally get (if (= 0 0) 0 y). so evaluation result is 0
;
; but lisp interpreter uses applicative order, result would be infinite loop...
