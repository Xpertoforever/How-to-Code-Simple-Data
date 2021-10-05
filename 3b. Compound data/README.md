## Structure definition  
We can consider the below description  
(define-struct <name_struct> (<name_field> ...))   
name_struct : Structure name   
name_fied: field names   

A structure definition define  
```racket
- constructor : make-<structure-name>  
- selector(s): <structure-name>-<field-name>  
- predicate: <structure-name?>  

(define-struct pos(x y))  
make-pos ;constructor  
pos-x pos-y ;selectors  
pos? ;predicate  
 
i.g. 
(define-struct pos(x y))

;(make-pos 5 7) ;constructor
(define P1 (make-pos 5 7))
(define P2 (make-pos 2 8))

(pos-x P2) ;Selector
(pos-y P1)

(pos? P1) ;predicate
(pos? "Hello")
```
## Compound Data Definitions  

PROBLEM:   
Design a data definition to represent hockey players, including both   
their first and last names.  
```racket
; ______________________________
;|Data definititon recipe HtDD  |
;|1. Structure definition       |
;|2. Type comment               |
;|3. Interpretation             |
;|4. Examples                   | 
;|5. A template                 |
;|6. Templates Rules used       |
;|______________________________|
(define-struct player (fn ln))
;; Player is (make-player String String)
;; interp. (make-player fn ln) is a hockey player with
;;          fn is the first name
;;          in is the last name
(define P1 (make-player "Bobby" "Orr"))
(define P2 (make-player "Wayne" "Gretzky"))

(define (fn-for-player p)
     (... (player-fn p)    ; String
          (player-ln p)))  ; String

;; Template rules used:
;; - Compound: 2 fields
```
