#lang racket

(define (pascal row col)
  (if (or (= col 1) (= row col))
      1
      (+ (pascal (- row 1) (- col 1))
         (pascal (- row 1) col))))

(define (display-pascal-row n)
  (define (column-iter i)
    (display (pascal n i))
    (display "   ")
    (if (= n i)
        (newline)
        (column-iter (+ i 1))))
  (column-iter 1))
 

(define (display-pascal n)
  (define (row-iter i)
    (display-pascal-row i)
    (if (= n i)
        (newline)
        (row-iter (+ i 1))))
  (row-iter 1))

(display-pascal 10)
