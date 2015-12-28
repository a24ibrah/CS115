;; Fall 2015 update

;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname count-value) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))


;; The complete design recipe is left as an exercise.

(define-struct node (key val left right))
;; A binary search tree (BST) is either
;; * empty, or
;; * (make-node Num Str BST BST),

;; which satisfies the ordering property recursively:
;; * every key in left is less than key
;; * every key in right is greater than key

;; my-bst-fun: BST → Any
;; (define (my-bst-fun t)
;;   (cond
;;   [(empty? t) . . . ]
;;   [else . . . (node-key t) . . .
;;       . . . (node-val t) . . .
;;       . . . (my-bst-fun (node-left t)) . . .
;;       . . . (my-bst-fun (node-right t)) . . . ]))

;; (count-values abst v) counting values equal to v    
;; count-values: BST Str → Nat
;; Example:
(check-expect (count-values (make-node 6 "A" (make-node 4 "A" empty empty) (make-node 8 "A" empty empty)) "A") 3)
(check-expect (count-values 
(make-node 10 "E"
(make-node 6 "A" (make-node 4 "D" empty empty) (make-node 8 "C" empty empty))
(make-node 18 "A" (make-node 15 "A" empty empty) (make-node 21 "A" empty empty))) "A") 4)

(define (count-values abst v)
  (cond
    [(empty? abst) 0]
  [else  
    (+ (cond
         [(equal? v (node-val abst)) 1]
         [else 0])
       (count-values (node-left abst) v)
       (count-values (node-right abst) v))]))