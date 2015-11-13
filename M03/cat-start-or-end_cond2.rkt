(define (cat-start? s)
  (string=? "cat" (substring s 0 3)))

(define (cat-end? s)
  (string=? "cat" (substring s (- (string-length s) 3) )))

(define (too-short? s)
  (> 3 (string-length s)))

(define (cat-start-or-end2? s)
  (cond
    [(too-short? s) false]
    [(cat-start? s) true]
    [(cat-end? s) true]
    [else false]))