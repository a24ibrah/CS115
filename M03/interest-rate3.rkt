;; Fall 2015 update

(define (interest-rate amount)
  (cond
    [(and (<= 0 amount) (<= amount 1000)) 4.0]   ; 0 <= amount <= 1000
    [(and (< 1000 amount) (<= amount 5000)) 4.5] ; 1000 < amount <= 5000
    [(> amount 5000) 5.0])                       ; 5000 < amount 
  )

