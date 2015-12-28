;; Fall 2015 update

;; (scale point factor) produces the Posn that results
;; when the fields of point are multiplied by factor
;; scale: Posn Num → Posn
;; Examples:
(check-expect (scale (make-posn 3 4) 0.5) (make-posn 1.5 2))
(check-expect (scale (make-posn 1 2) 1) (make-posn 1 2))

(define (scale point factor)
  (make-posn (* factor (posn-x point))
             (* factor (posn-y point))))