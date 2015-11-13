
;; ****** NEGATE-LIST ******

;; A (listof Num) is one of: 
;; * empty
;; * (cons Num (listof Num))

;; (define (negate-list alon) 
;;  (cond [(empty? alon) ... ]        
;;        [else ... (first alon) ...
;;              ... (negate-list (rest alon))]))

;; (negate-list alon) produces a list formed by negating
;; each item in alon.
;; negate-list: (listof Num) -> (listof Num)
;; Examples:				
(check-expect (negate-list empty) empty)
(check-expect (negate-list (cons 12 empty)) (cons -12 empty))
(check-expect (negate-list (cons -2 (cons 12 empty))) (cons 2 (cons -12 empty)))
			
(define (negate-list alon)
  (cond
    [(empty? alon) empty]
    [else (cons (- (first alon)) (negate-list (rest alon)))]))


				

			

		

	
