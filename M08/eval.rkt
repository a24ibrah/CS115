;; Fall 2015 update

;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname eval) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; The complete design recipe is left as an exercise.

(define-struct binode (op arg1 arg2))
;;  A Binary arithmetic expression Internal Node (BINode)
;;  is a (make-binode (anyof  ’*  ’+  ’/  ’-) BinExp BinExp)
;;  A Binary arithmetic expression (BinExp) is one of:
;;  * a Num
;;  * a BINode

;; my-binexp-fun: BinExp → Any
;; (define (my-binexp-fun ex)
;;   (cond
;;   [(number? ex) . . . ]
;;   [else . . . (binode-opex) . . .
;;         . . . (my-binexp-fun (binode-arg1 ex)) . . .
;;         . . . (my-binexp-fun (binode-arg2 ex)) . . . ]))

;; (eval ex) produces the value of a given binary arithmetic expression
;; eval: BinExp → Num
;; Examples
;(check-expect (eval 5) 5) 
(check-expect (eval (make-binode '* 2 6)) 12)
;(check-expect (eval (make-binode '+ 2 (make-binode '- 5 3))) 4)
;(check-expect (eval (make-binode '/
;                                 (make-binode '+ (make-binode '* 2 6)
;                                                 (make-binode '* 5 2))
;                                 (make-binode '- 5 3))) 11)

(define (eval ex)
  (cond
    [(number? ex) ex]
    [else
     (cond
      [(symbol=? (binode-op ex) '*)
        (* (eval (binode-arg1 ex)) (eval (binode-arg2 ex)))]
      [(symbol=? (binode-op ex) '+)
        (+ (eval (binode-arg1 ex)) (eval (binode-arg2 ex)))]
      [(symbol=? (binode-op ex) '/)
        (/ (eval (binode-arg1 ex)) (eval (binode-arg2 ex)))]
      [(symbol=? (binode-op ex) '-)
        (- (eval (binode-arg1 ex)) (eval (binode-arg2 ex)))])
     ]))

 