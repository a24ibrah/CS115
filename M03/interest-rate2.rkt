;; (interest-rate amount) consumes the amount (amount) that a customer wishes
;;to deposit and produces the interest that the customer receives
;;for this amount of money.
;; interest-rate: Num -> Num
;; requires: amount >= 0

;; Examples:
(check-expect (interest-rate 500) 20) ; the interest for $500 is $20
(check-expect (interest-rate 2000) 90); the interest for $2000 is $90
(check-expect (interest-rate 10000) 500); the interest for $10,000 is $500


(define (interest-rate amount) ...)

;; Tests:

