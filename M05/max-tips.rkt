
;; A nonempty list is either
;; * (cons v empty) where is a value of any type, or
;; * (cons v nel) where v is a value of any type and nel is a nonempty list. 

;; Template:
;; (define (my-nonemptylist-fn lst)
;;    (cond [(empty? (rest lst)) ... (first lst) ...]
;;          [else ... (first lst) ...
;;                ... (my-nonemptylist-fn (rest lst)) ...]))

;; produces the largest value in numbers
;; max-list: (listof num) -> num

;; examples: 
(check-expect (max-list (cons 1 empty)) 1)
(check-expect (max-list (cons 3 (cons 10 (cond 2 empty)))) 10)

(define (max-list numbers)
  (cond
    [(empty? (rest numbers)) 
        (first numbers)]
    [else 
      (max (first numbers)
           (max-list (rest numbers)))]))

(check-expect (max-list (cons 10 empty)) 10)
(check-expect (max-list (cons 10 (cons 12 empty))) 12)
(check-expect (max-list (cons 12 (cons 10 empty))) 12)
(check-expect (max-list (cons 10 (cons 1 (cons 20 empty)))) 20)