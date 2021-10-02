## PROBLEM 1 ##  
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
## PROBLEM 2 ##  
PROBLEM A:  
You are designing a program to track a rocket's journey as it descends   
100 kilometers to Earth. You are only interested in the descent from   
100 kilometers to touchdown. Once the rocket has landed it is done.  
Design a data definition to represent the rocket's remaining descent.   
Call it RocketDescent.  
```racket
;; =================
;; Data definitions:

;Data definititon recipe HtDD
;1. Structure definition
;2. Type comment
;3. Interpretation
;4. Examples
;5. A template

;; RocketDescent is one of:
;; false
;; - Number(0, 100]
;; interp.
;; false means rocket descent has ended, otherwise number of kilometer left to earth
(define rd1 100)
(define rd2 50)
(define rd3 0.5)
(define rd4 false)
#;
(define (fn-for-Rocket-descent rd)
  (cond [(and (number? rd)
              (< 0 rd)
              (<= rd 100)) (... rd)]
        [else (...)]))

;; Template rules used:
;; - one of 2 cases:
;;  - atomic non-distinct: Number[100, 0) 
;;  - atomic distinct: false
```
PROBLEM B:  
Design a function that will output the rocket's remaining descent distance   
in a short string that can be broadcast on Twitter.   
When the descent is over, the message should be "The rocket has landed!".  
Call your function rocket-descent-to-msg.  
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

;; RocketDescent -> String ;Signature
;; Update on rocket's descent distance ;Purpose
(check-expect (rocket-descent-to-msg 100) "Altitude is 100 kms.")
(check-expect (rocket-descent-to-msg 50) "Altitude is 50 kms.")
(check-expect (rocket-descent-to-msg 1) "Altitude is 1 kms.")
(check-expect (rocket-descent-to-msg 0.5) "Altitude is 1/2 kms.")
(check-expect (rocket-descent-to-msg false) "The rocket has landed!")


;(define (rocket-descent-to-msg rd) "") ;Stub

;<use template from RocketDescent>
(define (rocket-descent-to-msg rd)
  (cond [(and (number? rd)
              (< 0 rd)
              (<= rd 100)) (string-append "Altitude is " (number->string rd) " kms.")]
        [else "The rocket has landed!"]))
```
