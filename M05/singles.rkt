
;; remove-all: Num (listof Num)->(listof Num)
;; Produces list with all occurrences of n 
;; removed from alon.
;; Examples:
(check-expect (remove-all 2 empty) empty) 
(check-expect (remove-all 2 (cons 2 (cons 12 empty))) (cons 12 empty))  

(define (remove-all n alon)
  (cond
    [(empty? alon) empty]
    [else 
     (cond
       [(equal? (first alon) n) (remove-all n (rest alon))]
       [else (cons (first alon) (remove-all n (rest alon)))])]))

;;Tests:
(check-expect (remove-all 5 empty) empty)
(check-expect (remove-all 5 (cons 5 empty)) empty)
(check-expect (remove-all 5 (cons 10 empty)) (cons 10 empty))
(check-expect (remove-all 5 (cons 5 (cons 6 (cons 10 (cons 5 (cons 2 (cons 5 empty)))))))
              (cons 6 (cons 10 (cons 2 empty))))

;; (singles alon) produces a list containing only the first 
;; occurrence of each value in alon.
;; singles: (listof Num) -> (listof Num)
;; Examples:
(check-expect (singles (cons 2 empty)) (cons 2 empty))
(check-expect (singles (cons 2 (cons 2 (cons 12 empty)))) (cons 2 (cons 12 empty)))
(check-expect (singles (cons 3 (cons 2(cons 2 (cons 3 (cons 12 empty)))))) (cons 3 (cons 2 (cons 12 empty))))  
				
(define (singles alon)
(cond				
  [(empty? alon) empty]
  [else (cons (first alon)(remove-all (first alon) (singles (rest alon))))]))

