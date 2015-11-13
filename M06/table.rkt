
;; TWO-DIMENSIONAL DATA
;; (mult-table 3 4)

;; The design recipe is left as an exercise.

;; cols-from: Nat Nat Nat->(listof Nat)
;; Produces entries c through nc of rth row of mulitplication table
(define (cols-from c r nc)
  (cond
    [(>= c nc) empty]
    [else (cons (* r c) (cols-from (add1 c) r nc))]))

;; Produces rth row of multiplication table, of length nc
;; row: Nat Nat->(listof Nat)
(define (row r nc)
  (cols-from 0 r nc))

;; produces multiplication table, rows r through nr
;; rows-from: Nat Nat Nat->(listof (listof Nat))
(define (rows-from r nr nc)
  (cond
    [(>= r nr) empty]
    [else (cons (row r nc) (rows-from (add1 r) nr nc))]))

;;; Produces multiplication table with nr rows and nc columns
;;; mult-table: Nat Nat!(listof (listof Nat))
(define (mult-table nr nc)
  (rows-from 0 nr nc))

(mult-table 3 4)
