;; Fall 2015 update


;; Processing In Lockstep

;; The design recipe is left as an exercise.

;;(define (my-lockstep-fun list1 list2)
;;(cond
;; [(empty? list1) ...]
;; [else
;;  ...(first list1) ... (first list2) ...
;;  ... (my-lockstep-fun (rest list1) (rest list2)) ... ]))

;; (total-value pricelist numlist) produces the total value of items
;; with prices in pricelist and numbers in numlist.
;; total-value: (listof Num) (listof Nat) → Num
;; requires:
;;         Values in pricelist >= 0
;;         pricelist and numlist have the same length
;; Examples:
(check-expect (total-value empty empty) 0)
(check-expect (total-value (list 2) (list 3)) 6)
(check-expect (total-value (list 2 3) (list 4 5)) 23)

(define (total-value pricelist numlist)
  (cond
  [(empty? pricelist) 0]
  [else (+ (* (first pricelist) (first numlist))
           (total-value (rest pricelist) (rest numlist)))]))
   