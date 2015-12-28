;; Fall 2015 update

;; APPEND TWO LISTS

;; The design recipe is left as an exercise.

;(define (my-list-fun alist)
;  (cond
;    [(empty? alist) ... ]
;    [else ...(first alist) ...
;    ... (my-list-fun (rest alist)) ... ]))

;(define (my-alongforride-fun list1 list2)
;  (cond
;    [(empty? list1) ... ]
;    [else ...(first list1) ...
;          ...(my-alongforride-fun (rest list1) list2) ...]))

;; (my-append list1 list2) consumes two lists list1 and list2, and
;; produces the list with empty in list1 replaced by list2 
;; my-append: (listof Any) (listof Any) → (listof Any)
;; Examples:
(check-expect (my-append empty (list 1 2)) (list 1 2))
(check-expect (my-append (cons 1 empty) (cons 2 empty)) 
              (cons 1 (cons 2 empty)))

(define (my-append list1 list2)
  (cond
    [(empty? list1) list2]
    [(empty? list2) list1]
    [else (cons (first list1) (my-append (rest list1) list2))]))

 