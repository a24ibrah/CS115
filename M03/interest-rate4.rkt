;; Fall 2015 update

(define (interest-rate amount)
  (cond
    [(<= amount 1000) 4.0]   ; 0 <= amount <= 1000
    [(<= amount 5000) 4.5]   ; 1000 < amount <= 5000
    [else 5.0])              ; 5000 < amount 
  )