;; Fall 2015 update

(define (f n)
  (cond
    [(equal? n 0) 1]
    [else (* n (f (- n 1)))]))

(f 3)