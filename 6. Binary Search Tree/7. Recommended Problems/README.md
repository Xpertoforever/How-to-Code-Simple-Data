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
## 2. PROBLEM: INSERT KEY
PROBLEM:  
Design a function that consumes an Integer, String and BST, and adds a node  
that has the given key and value to the tree. The node should be inserted in  
the proper place in the tree. The function can assume there is not already  
an entry for that number in the tree. The function should produce the new BST.  
Do not worry about keeping the tree balanced. We will come back to this later.  
```racket
;; Functions:
;; Integer, String and BST -> BTS
;; produce new BST in which key, val pair have been inserted in proper place
;; ASSUME: key does not already exist in tree

(check-expect (insert 2 "b" false) 
              (make-node 2 "b" false false))

(check-expect (insert 1 "a" 
                      (make-node 2 "b" false false))
              (make-node 2 "b" (make-node 1 "a" false false) false))

(check-expect (insert 3 "c" 
                      (make-node 2 "b" (make-node 1 "a" false false) false))
              (make-node 2 "b" 
                         (make-node 1 "a" false false)
                         (make-node 3 "c" false false)))
              

;(define (insert key val bst) ;Stub
(define (insert key val bst)
  (cond [(false? bst) (make-node key val false false)]
        [else
         (if (< key (node-key bst))
             (make-node (node-key bst) 
                        (node-val bst) 
                        (insert key val (node-l bst))
                        (node-r bst))
             (make-node (node-key bst) 
                        (node-val bst) 
                        (node-l bst)
                        (insert key val (node-r bst))))]))  
```
