
;; INSERTION SORT
;; Sort into nondescending order

;; Produces the sorted (in nondecreasing order) list formed by
;; adding the number n to the sorted list alon.
;; insert: Num (listof Num) -> (listof Num)
;; example:
(check-expect (insert 7 (cons 4 (cons 9 empty)))
              (cons 4 (cons 7 (cons 9 empty))))
(check-expect (insert 12 empty) (cons 12 empty))

(define (insert n numbers)
  (cond
    [(empty? numbers) (cons n empty)]
    [(<= n (first numbers)) (cons n numbers)]
    [else (cons (first numbers)
                (insert n (rest numbers)))]))
;;Tests:
(check-expect (insert 7 empty) (cons 7 empty))
(check-expect (insert 7 (cons 5 empty))
               (cons 5 (cons 7 empty)))
(check-expect (insert 7 (cons 9 empty))
              (cons 7 (cons 9 empty)))
(check-expect (insert 10 (cons 2 (cons 8 (cons 12 (cons 13 empty)))))
              (cons 2 (cons 8 (cons 10 (cons 12 (cons 13 empty))))))

;; produces numbers in nondescending order
;; sort: (listof Num) -> (listof Num)
;; example:
(check-expect (sort (cons 4 (cons 8 (cons 1 empty))))
              (cons 1 (cons 4 (cons 8 empty))))

(define (sort numbers)
  (cond
    [(empty? numbers) empty]
    [else (insert (first numbers)
                  (sort (rest numbers)))]))
;;Tests:
(check-expect (sort empty) empty)
(check-expect (sort (cons 4 empty)) (cons 4 empty))
(check-expect (sort (cons 8 (cons 2 (cons 9 empty))))
              (cons 2 (cons 8 (cons 9 empty))))
