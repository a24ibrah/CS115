
;; ALL MIDPOINTS

;; The design recipe is left as an exercise.

;; midpoint: Posn Posn → Posn
(define (midpoint p1 p2)
(make-posn
 (/ (+ (posn-x p1) (posn-x p2)) 2)
 (/ (+ (posn-y p1) (posn-y p2)) 2)))

;; all-midpoints: (listof Posn) (listof Posn) → (listof Posn)
(define (all-midpoints lop1 lop2)
(cond
  [(empty? lop1) empty]
  [else (cons (midpoint (first lop1) (first lop2))
              (all-midpoints (rest lop1) (rest lop2)))]))