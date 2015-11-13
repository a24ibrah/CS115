;; (distance posn1 posn2) produces the Euclidean distance
;; between posn1 and posn2.
;; distance: Posn Posn → Num
;; example:
(check-expect (distance (make-posn 1 1) (make-posn 4 5)) 5)

(define (distance posn1 posn2)
(sqrt (+ (sqr (- (posn-x posn1) (posn-x posn2)))
(sqr (- (posn-y posn1) (posn-y posn2))))))