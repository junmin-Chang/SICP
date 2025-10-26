#lang racket

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)

; normal order..

(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))
 
; 1 remainder computed 
(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

; 2 remainder computed 
(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40)
                                                      (remainder 40 (remainder 206 40)))))

; 4 remainder computed in if
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) 
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

; 7 remainder computed
(if (= (remainder (remainder 40 (remainder 206 40)) ; 4 mod 2 = 0, true !
                  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
; 4 remainder computed 
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) ; 6 mod 4 = 2!
    (gcd ....... don't care))

 1 + 2 + 4 + 7 + 4 = 18 remainder computed ! 



; applicative-order 
(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(gcd 40 6)

(if (= 6 0)
    40
    (gcd 6 (remainder 40 6)))

(gcd 6 4)
(if (= 4 0)
    6
    (gcd 4 (remainder 6 4)))

(gcd 4 2)
(if (= 2 0)
    4
    (gcd 2 (remainder 4 2)))

(gcd 2 0)
(if (= 0 0)
    2
    (gcd .. don't care))

4 remainder computed!
