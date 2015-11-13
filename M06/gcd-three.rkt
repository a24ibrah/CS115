
;; The design recipe is left as an exercise.

(define (common? k n1 n2 n3)
(and (zero? (remainder n1 k))
     (zero? (remainder n2 k))
     (zero? (remainder n3 k))))

(define (common-from n1 n2 n3 start) 
  (cond
    [(common? start n1 n2 n3) start]
    [(> start (min n1 n2 n3)) 'NoGCD]
    [else (common-from n1 n2 n3 (add1 start))]))

(define (gcd-three n1 n2 n3)
(common-from n1 n2 n3 2))

(gcd-three 21 14 35)