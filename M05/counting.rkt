
;; ****** COUTING ******

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

;; (counting alos) produces the number of occurrences of
;; ’apple in alos.
;; counting: (listof Sym) Sym -> Nat
;; Examples:
(check-expect (counting empty 'apple) 0)
(check-expect (counting (cons 'apple empty) 'apple) 1)
(check-expect (counting (cons 'pear (cons 'peach empty)) 'apple) 0)

(define (counting alos typ)
  (cond
    [(empty? alos) 0]   
    [(equal? (first alos) typ) (+ 1 (counting (rest alos) typ)) ]
          [else (counting (rest alos) typ)]))

;test:    
(check-expect (counting lst1 'apple) 2)
(check-expect (counting lst2 'apple) 1)
