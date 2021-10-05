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
