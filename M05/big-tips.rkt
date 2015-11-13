
(define-struct server (name tips))
;; A Server is a structure (make-server n t) where
;; n is a String (server's name) and
;; t is a list of nonnegative numbers (for tips).

;; (define (my-server-fun s)
;; ... (server-name s)...
;; ... (my-lon-fun (server-tips s)) ...)

;; (define (my-lon-fun alon)
;; (cond
;;   [(empty? alon) … ]
;;   [else ... (first alon) ...
;;    ... (my-lon-fun (rest alon)) … ]))

;; Produces a list of top amounts from tips which are greater than or equal
;; to smallest
;; big-tip-list: (listof Num) Num -> (listof Num)

(define (big-tip-list tips smallest)
  (cond [(empty? tips) empty]
        [(>= (first tips) smallest)
         (cons (first tips)
               (big-tip-list (rest tips) smallest))]
         [else (big-tip-list (rest tips) smallest)]))

;; Produces server with same name as waitstaff
;; but only containing tips of at least smallest
;; big-tips: Server Num -> Server
;; Examples:
(check-expect (big-tips (make-server "Stephen" empty) 10)
              (make-server "Stephen" empty))
(check-expect (big-tips (make-server "Jon" (cons 1.50 (cons .75 (cons 5.0 empty)))) 1.0)
              (make-server "Jon" (cons 1.5 (cons 5.0 empty))))

(define (big-tips s smallest)
  (make-server (server-name s) (big-tip-list (server-tips s) smallest) ) )

;;Tests:
(check-expect (big-tips 
      (make-server "Stephen" empty) 1.00)
      (make-server "Stephen" empty))
(check-expect (big-tips
      (make-server "Dave" (cons 5.0 empty)) 1.0)
      (make-server "Dave" (cons 5.0 empty)))
(check-expect (big-tips
      (make-server "Conan" (cons .75 empty)) 1.0)
      (make-server "Conan" empty))
(check-expect (big-tips
      (make-server "Jon" 
          (cons 1.50 (cons .75 (cons 5.0 empty))))
          1.0)
      (make-server "Jon"
          (cons 1.5 (cons 5.0 empty))))