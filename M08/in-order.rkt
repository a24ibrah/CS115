
;; The complete design recipe is left as an exercise.

(define-struct binode (op arg1 arg2))
;; A Binary arithmetic expression Internal Node (BINode)
;;   is a (make-binode (anyof '* '+ '/ '-) BinExp BinExp)

;; A Binary arithmetic expression (BinExp) is one of:
;;   * a Num
;;   * a BINode

(define tree1
  (make-binode '/
               (make-binode '+
                            (make-binode '* 2 6)
                            (make-binode '* 5 2))
               (make-binode '- 5 3)))

;; (inorder ex) produces a list of the node values in ex
;; where the elements are in in-order
;; inorder: BinExp -> (listof (anyof '+ '- '* '/ Num))
;; Examples:
(check-expect (inorder tree1) (list 2 '* 6 '+ 5 '* 2 '/ 5 '- 3))

(define (inorder ex)
    (cond
      [(number? ex) (list ex)]
      [else
       (append (inorder (binode-arg1 ex)) 
               (cons (binode-op ex) (inorder (binode-arg2 ex))))]))

