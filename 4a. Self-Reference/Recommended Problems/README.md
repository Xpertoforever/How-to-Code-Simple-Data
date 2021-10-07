## PROBLEM 1: DOUBLE ALL  
Remember the data definition for a list of numbers we designed in Lecture 5f:  
(if this data definition does not look familiar, please review the lecture)  
```racket
;; =================
;; Data definitions:
;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber
```
PROBLEM:  
Design a function that consumes a list of numbers and doubles every number   
in the list. Call it double-all.  
```racket
;; =================
;; Functions:
; ______________________________
;|- HtDF Recipe                 |
;|1. Signature                  |
;|2. Purpose                    |
;|3. Stub                       |
;|4. Examples                   | 
;|5. Code Body                  |
;|6. Test                       |
;|______________________________|

;; ListOfNumber -> ListOfNumber
;; double every element from the list provided
(check-expect (double-all empty) empty)
(check-expect (double-all (cons 20 empty)) (cons 40 empty))
(check-expect (double-all (cons 15 (cons 20 empty))) (cons 30 (cons 40 empty)))
              
;(define (double-all lon) lon) ;Stub

(define (double-all lon)
  (cond [(empty? lon) empty]
        [else
         (cons (* (first lon) 2)
               (double-all (rest lon)))]))
```
## PROBLEM 2: BOOLEAN LIST   
PROBLEM A:  
Design a data definition to represent a list of booleans. Call it ListOfBoolean.   
```racket
;; =================
;; Data definitions:

;; ListOfBoolean is one of:
;; - empty
;; - (cons Boolean ListOfBoolean))
;; interp. a list of boolean (true or false)
(define LOB1 empty)
(define LOB2 (cons true empty))
(define LOB3 (cons false (cons true empty)))
#;
(define (fn-for-lob lob)
    (cond [(empty? lob) (...)]
        [else
         (... (first lob)
              (fn-for-lob (rest lob)))]))

;; Template rules used:
;; - one of: 2 cases
;; - atomic non-distinct: empty
;; - compound: (cons Boolean ListOfBoolean))
;; - self-reference: (rest lob) is ListOfBoolean 
```
PROBLEM B:  
Design a function that consumes a list of boolean values and produces true   
if every value in the list is true. If the list is empty, your function   
should also produce true. Call it all-true?  
```racket
;; =================
;; Functions:
; ______________________________
;|- HtDF Recipe                 |
;|1. Signature                  |
;|2. Purpose                    |
;|3. Stub                       |
;|4. Examples                   | 
;|5. Code Body                  |
;|6. Test                       |
;|______________________________|

;; ListOfBoolean -> Boolean
;; produce true if all elements from a list is true or if the list is empty
(check-expect (all-true empty) true)
(check-expect (all-true (cons true empty)) (and true true)
(check-expect (all-true (cons false empty)) false)
(check-expect (all-true (cons true (cons false empty))) false)
(check-expect (all-true (cons true (cons true empty))) true)

;(define (all-true lob) true) ;Stub

; <Use Template form ListOfBoolean>
#;
(define (all-true lob)
    (cond [(empty? lob) true]
        [else
         (if (boolean=? (first lob) false)
             false
             (all-true (rest lob)))]))

; <Use Template form ListOfBoolean>
(define (all-true lob)
    (cond [(empty? lob) true]
        [else
         (and (first lob) (all-true (rest lob)))]))
```
## PROBLEM 3: LARGEST NUMBER  
Remember the data definition for a list of numbers we designed in Lecture 5f:  
(if this data definition does not look familiar, please review the lecture)  
```racket
;; =================
;; Data definitions:

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber
```
PROBLEM:  
Design a function that consumes a list of numbers and produces the largest number   
in the list. You may assume that all numbers in the list are greater than 0. If  
the list is empty, produce 0.  
```racket
;; =================
;; Functions:
;; ListOfNumber -> Number
;; produce the hightest number in the list providen or zero if the list is empty
(check-expect (largest-lon empty) 0)
(check-expect (largest-lon (cons 20 empty)) 20)
(check-expect (largest-lon (cons 20 (cons 40 empty))) 40)
(check-expect (largest-lon (cons 50 (cons 2 (cons 100 empty)))) 100)

;(define (largest-lon lon) 0) ; Stub

; <Use template from ListOfNumber>
(define (largest-lon lon)
  (cond [(empty? lon) 0]
        [else
         (if (> (first lon) (largest-lon (rest lon)))
             (first lon)
             (largest-lon (rest lon)))]))



```









