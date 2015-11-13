;; ****** COUNT-APPLES ******

;; A (listof Sym) is one of: 
;; * empty
;; * (cons Sym (listof Sym))

;; Template: 
;; (define (my-list-fun lst)
;;    (cond
;;          [(empty? lst) ...]
;;          [else ... (first lst) ... 
;;                ... (my-list-fun (rest lst)) ...]))


(define lst1 (cons 'apple (cons 'orange (cons 'apple empty))))
(define lst2 (cons 'pear (cons 'orange (cons 'apple empty))))

;; (count-apples alos) produces the number of occurrences of
;; ’apple in alos.
;; count-apples: (listof Sym) -> Nat
;; Examples:
(check-expect (count-apples empty) 0)
(check-expect (count-apples (cons 'apple empty)) 1)
(check-expect (count-apples (cons 'pear (cons 'peach empty))) 0)

(define (count-apples alos) 
  (cond
    [(empty? alos) 0]
    [(symbol=? (first alos) 'apple)
                (+ 1 (count-apples (rest alos)))]
    [else (count-apples (rest alos))]))

;test:    
(check-expect (count-apples lst1) 2)
(check-expect (count-apples lst2) 1)
