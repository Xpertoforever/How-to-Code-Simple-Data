## 1. PROBLEM: SUM KEY SOLUTION  
```racket
;; Functions:

;; BST -> Number
;; produce the sum of the keys in the BST
(check-expect (sum-bst BST0) 0)
(check-expect (sum-bst BST4) (+ 4 7))
(check-expect (sum-bst BST3) (+ 3 1 4 7))

;(define (sum-bst bst) 0 ;Stub
(define (sum-bst t)
  (cond [(false? t) 0]
        [else
         (+ (node-key t)
            (sum-bst (node-l t))
            (sum-bst (node-r t)))]))
  
```
