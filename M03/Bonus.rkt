;; Fall 2015 update

(define (bonus1 diff)
(cond
  [(and (<= 0 diff) (< diff 100)) diff]
  [(<= 100 diff) (* 2 diff)]
  [(< diff 0) 0]
     ))
; re-order to simplify questions


(define (bonus diff)
  (cond
    [(< diff 0) 0]
    [(< diff 100) diff]
    [else (* 2 diff)]))

;(check-expect (bonus  -50) 0)     ; bonus with negative value
;(check-expect (bonus  0) 0)       ; bonus with zero value
;(check-expect (bonus  50) 50)     ; bonus < 100
;(check-expect (bonus  100) 200)   ; bonus with 100 (boundary)
;(check-expect (bonus  150) 300)   ; bonus > 100
; comment on how DrRaket highlight in black for unused code
; comment on the test cases order