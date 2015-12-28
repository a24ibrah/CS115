;; Fall 2015 update

;; TWO-DIMENSIONAL DATA
;; (table-2D 3 4)

;; The design recipe is left as an exercise.
 
;; Produces rth row of multiplication table, of length nc
;; row: Nat Nat->(listof Nat)
(define (row c r nc)
  (cond
    [(>= c nc) empty]
    [else (cons (* r c) (row (add1 c) r nc))]))

;; produces multiplication table, rows r through nr
;; rows-from: Nat Nat Nat->(listof (listof Nat))
(define (rows-from r nr nc)
  (cond
    [(>= r nr) empty]
    [else (cons (row 0 r nc) (rows-from (add1 r) nr nc))]))

;;; Produces multiplication table with nr rows and nc columns
;;; mult-table: Nat Nat!(listof (listof Nat))
(define (table-2D nr nc)
  (rows-from 0 nr nc))

(table-2D 3 4)
