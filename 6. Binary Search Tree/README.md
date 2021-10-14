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
## Binary Search Trees  
Images attached  

## A Data Definition for Binary Search Trees
```racket
(define-struct node (key val l r))
;; BST (Binary Search Tree) is one of:
;; - false
;; - (make-node Integer String BST BST)
;; interp. false means no BST, or empty BST
;;         key is the node key
;;         val is the node val
;;         l and r are left and right subtrees
;; INVARIANT: for a given node:
;;    key is > all keys in its l(eft) child
;;    key is < all keys in its r(ight) child
;; the same key never appears twice in the tree

(define BST0 false)
(define BST1 (make-node 1 "abc" false false))
(define BST4 (make-node 4 "dcj" false (make-node 7 "ruf" false false)))
(defien BST3 (make-node 3 "ilk" BST1 BST4))
(define BST42
   (make-node 42 "fly"
              (make-node 27 "wit" (make-node 14 "olp" false false) false)
              (make-node 50 "sug" false false)))

(define (fn-for-bst t)
  (cond [(false? t) (...)]
        [else
         (... (node-key t)     ;Integer
              (node-val t)     ;String
              (fn-for-bst (node-l t))       ;BST
              (fn-for-bst (node-r t)))]))   ;BST

;; Template rules used:
;; - one of: 2 cases
;; - atomic-distinct: false
;; - compound: (make-node Integer String BST BST)
;; - Self-reference: (node-l t) has type BST
;; - Self-reference: (node-t t) has type BST

```
## A Data Definition for Binary Search Trees
**PROBLEM:**   
Complete the design of the lookup-key function below. Note that because this is a search function   
it will sometimes 'fail'. This happens if it is called with an key that does not exist in the BST  
it is provided. If this happens the function should produce false. The signature for such a function  
is written in a special way as shown below.  
```racket
;; BST Natural -> String or false
;; Try to find node with given key, if found produce value; if not found produce false.
(check-expect (lookup-key BST0    99) false)
(check-expect (lookup-key BST1     1) "abc")
(check-expect (lookup-key BST1     0) false)
(check-expect (lookup-key BST1    99) false)
(check-expect (lookup-key BST10    1) "abc")
(check-expect (lookup-key BST10    4) "dcj")
(check-expect (lookup-key BST10   27) "wit")
(check-expect (lookup-key BST10   50) "dug")

;(define (lookup-key t k) "")

(define (lookup-key t k)
  (cond [(false? t) false]
        [else
         (cond [(= k (node-key t)) (node-val t)]
               [(< k (node-key t)) ; should we go left?
                (lookup-key (node-l t) k)]
               [(> k (node-key t)) ; Should we go right?
                (lookup-key (node-r t) k)])]))
       
```
## Rendering BSTs
**PROBLEM:**  
Design a function that consumes a bst and produces a SIMPLE   
rendering of that bst. Emphasis on SIMPLE. You might want to  
skip the lines for example.  
```racket
;; BST -> Image
;; produce a SIMPLE rendering of the tree

(check-expect (render-bst false) MTTREE)
(check-expect (render-bst BST1) (above (text (string-append "1" KEY-VAL-SEPARATOR "abc")
                                             TEXT-SIZE
                                             TEXT-COLOR) 
                                 VSPACE
                                 (beside (render-bst false)
                                         HSPACE
                                         (render-bst false)))) 
                                        
(check-expect (render-bst BST4) (above (text (string-append "4" KEY-VAL-SEPARATOR "dcj")
                                             TEXT-SIZE
                                             TEXT-COLOR)
                                 VSPACE
                                 (beside (render-bst false) 
                                         HSPACE
                                         (render-bst (make-node 7 "ruf" false false)))))

(check-expect (render-bst BST3) (above (text (string-append "3" KEY-VAL-SEPARATOR "ilk")
                                             TEXT-SIZE
                                             TEXT-COLOR) 
                                 VSPACE
                                 (beside (render-bst BST1)
                                         HSPACE
                                         (render-bst BST4))))  

;(define (render-bst t) (square 0 "solid" "white"))
(define (render-bst t)
  (cond [(false? t) MTTREE]
        [else
         (above (text (string-append (number->string (node-key t)) KEY-VAL-SEPARATOR (node-val t))
                      TEXT-SIZE
                      TEXT-COLOR)
                 VSPACE
                 (beside (render-bst (node-l t))
                         HSPACE
                         (render-bst (node-r t))))]))
```






