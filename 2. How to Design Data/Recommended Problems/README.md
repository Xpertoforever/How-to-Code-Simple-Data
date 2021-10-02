##PROBLEM 1##  
PROBLEM A:  
You are assigned to develop a system that will classify   
buildings in downtown Vancouver based on how old they are.   
According to city guidelines, there are three different classification levels:  
new, old, and heritage.  
Design a data definition to represent these classification levels.   
Call it BuildingStatus.  

```racket
;; =================
;; Data definitions:

;Data definititon recipe HtDD
;1. Structure definition
;2. Type comment
;3. Interpretation
;4. Examples
;5. A template

;; BuildingStatus is one of:
;; - "new"
;; - "old"
;; - "heritage"
;; interp.
;; Show the status of a bulding based on the age
(define B1 "new")
(define B2 "old")
(define B3 "heritage")
#;
(define (fn-for-building-status bs)
  (cond [(string=?  bs "new") (...)]
        [(string=?  bs "old") (...)]
        [(string=?  bs "heritage") (...)]))

;; Template rules used:
;; - one of: 3 cases:
;; Atomic Distinct value: "new" 
;; Atomic Distinct value: "old"
;; Atomic Distinct value: "heritage"

```
PROBLEM B:  
The city wants to demolish all buildings classified as "old".   
You are hired to design a function called demolish?   
that determines whether a building should be torn down or not.  
```racket
;; =================
;; Functions:

;Recipe HtDF
;1. Signature
;2. Purpose
;3. Stub
;4. Examples
;5. Template
;6. Body
;7. Test

;; BuildingStatus -> Boolean ;Signature
;; produce true if the building status is old ;Purpose
(check-expect (demolish "new") false);
(check-expect (demolish "old") true)
(check-expect (demolish "heritage") false)

;(define (demolish bs) false) ;Examples

;<use template from BuildingStatus>
(define (demolish bs)
  (cond [(string=?  bs "new") false]
        [(string=?  bs "old") true]
        [(string=?  bs "heritage") false]))

```
