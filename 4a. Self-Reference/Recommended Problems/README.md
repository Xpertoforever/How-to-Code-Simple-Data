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
