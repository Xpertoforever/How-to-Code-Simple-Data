## List of Abbreviations:  
```racket
;; Introduction to list
;(cons "a" (cons "b" (cons "c" empty)))
;(list "a" "b" "c")
;(list (+ 1 2) (+ 3 4) (+ 5 6))

;; Adding elements into a list
(define L1 (list "b" "c"))
(define L2 (list "d" "e" "f"))

;(cons "a" L1)
;(list "a" L1)
;(list L1 L2)

;; append
;(append L1 L2)

;; Comparation and equal
(cons "a" (cons "b" (cons "c" empty)))
(list "a" "b" "c")
```

## List of Account
```racket
; (define (lookup accs n) "")
(define (lookup accs n)
  (cond [(empty? accs) false]
        [else
         (if (= n (account-num  (first accs))) ;Natural 
             (account-name (first accs)) ;String
             (lookup (rest accs) n))]))
```
