
;; Fall 2015 update

(define (cat-start? s)
(string=? "cat" (substring s 0 3)))

(define (cat-end? s)
(string=? "cat" (substring s (- (string-length s) 3) )))

(define (too-short? s)
(> 3 (string-length s)))

(define (cat-start-or-end? s)
  (cond
    [(too-short? s) false]
    [(cat-start? s) true]
    [(cat-end? s) true]
    [else false]))

;; Tests for cat-start-or-end?
;(check-expect (cat-start-or-end? "me") false)
;(check-expect (cat-start-or-end? "caterpillar") true)
;(check-expect (cat-start-or-end? "polecat") true)
;(check-expect (cat-start-or-end? "no cat here") false)

 