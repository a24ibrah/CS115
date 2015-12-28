;; Fall 2015 update

;; MERGE TWO LISTS

;; The design recipe is left as an exercise.


;;(define (my-twolist-fn list1 list2)
;;  (cond
;;   [(and (empty? list1) (empty? list2)) ... ]
;;   [(and (empty? list1) (cons? list2))
;;     ... (first list2) ... (my-twolist-fn empty (rest list2)) ... ]
;;   [(and (cons? list1) (empty? list2))
;;     ... (first list1) ... (my-twolist-fn (rest list1) empty)... ]
;;   [(and (cons? list1) (cons? list2))
;;     ... (first list2) ... (my-twolist-fn list1 (rest list2)) ...
;;     ... (first list1) ... (my-twolist-fn (rest list1) list2) ...
;;     ... (first list1) ... (first list2)...
;;         ... (my-twolist-fn (rest list1) (rest list2)) ... ]))

;;  (merge list1 list2) consumes two lists,
;; each of distinct elements sorted in ascending order, and
;; produces one list containing all elements.
;; merge: (listof Nat) (listof Nat) → (listof Nat)
;; requires:
;;          Values in list1 >= 0
;;          Values in list2 >= 0
;; Examples:
(check-expect (merge empty empty) empty)
(check-expect (merge empty (cons 2 empty)) (cons 2 empty))
(check-expect (merge (cons 1 (cons 3 empty)) empty) (cons 1 (cons 3 empty)))
(check-expect (merge (cons 1 (cons 4 empty)) (cons 2 empty))
              (cons 1 (cons 2 (cons 4 empty))))
(check-expect (merge (cons 3 (cons 4 empty)) (cons 2 empty))
              (cons 2 (cons 3 (cons 4 empty))))
(check-expect (merge (cons 2 (cons 4 empty)) (cons 2 (cons 3 empty)))
              (cons 2 (cons 2 (cons 3 (cons 4 empty)))))

(define (merge list1 list2)
  (cond
    [(and (empty? list1) (empty? list2)) empty]
    [(and (empty? list1) (cons? list2)) list2]
    [(and (cons? list1) (empty? list2)) list1]
    [(and (cons? list1) (cons? list2))
     (cond
       [(< (first list1) (first list2))
        (cons (first list1) (merge (rest list1) list2))]
       [else (cons (first list2) (merge list1 (rest list2)))])]))