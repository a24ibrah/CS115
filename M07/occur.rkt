;; Nth OCCUR SUFFIX 

;; The design recipe is left as an exercise.

;;(define (my-list-and-num-fun n alist)
;;(cond
;;  [(and (= n 1) (empty? alist)) ... ]
;;  [(and (= n 1) (cons? alist))
;;   ... (first alist) ... (my-list-and-num-fun 1 (rest alist)) ... ]
;;  [(and (> n 1) (empty? alist))
;;   ... (my-list-and-num-fun (sub1 n) empty) ... ]
;;  [(and (> n 1) (cons? alist))
;;   ... (first alist) ... (my-list-and-num-fun n (rest alist)) ...
;;   ... (my-list-and-num-fun (sub1 n) alist) ...
;;   ... (first alist) ... (my-list-and-num-fun (sub1 n) (rest alist)) ... ]))
 
;; (nth-occur-suffix sym n alist) produces sublist starting at nth
;; occurrence of sym in alist.
;; nth-occur-suffix: Sym Nat (listof Sym) → (listof Sym)
;; requires: n >= 1
;; Examples:
(check-expect (nth-occur-suffix 'a 1 empty) empty)
(check-expect (nth-occur-suffix 'a 1 (list 'a 'c)) (list 'a 'c))
(check-expect (nth-occur-suffix 'a 2 empty) empty)
(check-expect (nth-occur-suffix 'a 2 (list 'a 'b 'a 'c)) (list 'a 'c))

(define (nth-occur-suffix sym n alist)
  (cond
    [(and (= n 1) (empty? alist)) empty]
    [(and (= n 1) (cons? alist))
     (cond [(equal? sym (first alist)) alist]
           [else (nth-occur-suffix sym n (rest alist))])]
    [(and (> n 1) (empty? alist)) empty]
    [(and (> n 1) (cons? alist))
     (cond [(equal? sym (first alist))
            (nth-occur-suffix sym (sub1 n) (rest alist))]
           [else (nth-occur-suffix sym n (rest alist))])]))

 