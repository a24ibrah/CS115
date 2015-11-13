
;; Dictionary & Association list

;; The complete design recipe is left as an exercise.

(define d (list (list 'quite "absolutely; completely")
                (list 'perfectly "in a manner or way that could not be better")))

;; (lookup-al k alst) produces the value associated with k, or
;; false if k not present.
;; lookup-al: Sym AL → (anyof Str false)
;; Example:
(check-expect (lookup-al 'short d) false)
(check-expect (lookup-al 'quite d) "absolutely; completely")
(check-expect (lookup-al 'perfectly d) "in a manner or way that could not be better")
 
(define (lookup-al k alst)
(cond
  [(empty? alst) false]
  [(equal? k (first (first alst))) (second (first alst))]
  [else (lookup-al k (rest alst))]))


