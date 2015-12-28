;; Fall 2015 update

;; The complete design recipe is left as an exercise.

(define (prefixes-from s start)
  (cond
    [(= start (string-length s)) (cons s empty)]
    [else (cons (substring s 0 start)
                (prefixes-from s (add1 start)))]))

(define (prefixes s)    
  (prefixes-from s 0))

(prefixes "abc")
(prefixes "Hello World!")