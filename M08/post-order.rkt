;; Fall 2015 update

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

;; (postorder ex) produces a list of the node values in ex
;; where the elements are in post-order
;; postorder: BinExp -> (listof (anyof '+ '- '* '/ Num))
;; Examples:
(check-expect (postorder tree1) (list 2 6 '* 5 2 '* '+ 5 3 '- '/))

(define (postorder ex)
  (cond
    [(number? ex) (list ex)]
    [else
     (append (postorder (binode-arg1 ex))
             (postorder (binode-arg2 ex))
             (list (binode-op ex)))]))