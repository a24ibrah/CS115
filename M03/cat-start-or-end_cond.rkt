;; Fall 2015 update

(define (cat-start-or-end? s)
  (cond
    [(> 3 (string-length s)) false]
    [(string=? "cat" (substring s 0 3)) true]
    [(string=? "cat" (substring s (- (string-length s) 3) )) true]
    [else false]))



 