;; Fall 2015 update

(define-struct card (value suit))
;; A Card is a (make-card Nat Sym)
;; requires
;;  value is between 1 to 10, inclusive, and
;;   suit is one of the values ’hearts, ’diamonds,
;;   ’spades, and ’clubs.

;; my-card-fun: Card → Any
;;(define (my-card-fun acard)
;; ...(card-value acard) ...
;; ... (card-suit acard) ...)

(define tenofhearts (make-card 10 'hearts))
(define oneofdiamonds (make-card 1 'diamonds))
(define threeofspades (make-card 3 'spades))
(define fourofclubs (make-card 4 'clubs))

;; (card-colour? acard) produces the colour of the suit of acard
;; card-colour?: Card → Sym
;; Examples:
(check-expect (card-colour? tenofhearts) 'red)
(check-expect (card-colour? threeofspades) 'black)

(define (card-colour? acard)
  (cond
    [(or (equal? 'hearts (card-suit acard))
         (equal? 'diamonds (card-suit acard))) 'red]
    [else 'black]))

;;Tests:
(check-expect (card-colour? tenofhearts) 'red)
(check-expect (card-colour? oneofdiamonds) 'red)
(check-expect (card-colour? threeofspades) 'black)
(check-expect (card-colour? fourofclubs) 'black)

 