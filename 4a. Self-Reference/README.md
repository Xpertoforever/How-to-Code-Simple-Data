# SELF-REFERENCE

## List Mechanisms  
**We will learn how to make a list; how to get the first, second or rest or any other element from the list  
An arbitrary amount of information; required arbitrary-sized data**  

A Well formed Self-Reference:  
- at least one base case  
- at least one self reference case  

```racket
(require 2htdp/image)

;empty
;
;(cons "Flames" empty)
;(cons "Leafs" (cons "Flames" empty))
;
;(cons (string-append "C" "anucks") empty)
;
;(cons 10 (cons 9 (cons 10 empty)))        ; a list of 3 elements
;
;(cons (square 10 "solid" "blue")
;      (cons (triangle 20 "solid" "green")
;            empty))

(define L1 (cons "Flames" empty))
(define L2 (cons "Leafs" (cons "Flames" empty)))
(define L3 (cons (square 10 "solid" "blue")
      (cons (triangle 20 "solid" "green")
            empty)))
; Cons a two arguments constructor
; first selects the first element of a list
; rest consumes a list with at least one element and produce
;;     the list after the first element
;; Selectors 
(first L1)
(first L2)
(first L3)

(rest L1)
(rest L2)
(rest L3)

(... L2)  ;How do I get the second element of L2
(first (rest L2))

(... L2) ;How do I get the thrid element
(first (rest (rest L2)))

(empty? empty)
(empty? L1)
(empty? 1)

```
## List Data Definition
PROBLEM:  
Imagine that you are designing a program that will keep track of  
your favorite Quidditch teams. (http://iqasport.org/).  
Design a data definition to represent a list of Quidditch teams.  
```racket
;; ListOfString is one of:
;; - empty
;; - (cons String ListOfString)
;; interp. a list of strings
(define LOS1 empty)
(define LOS2 (cons "McGill" empty))
(define LOS3 (cons "UBC" (cons "McGill" empty)))

(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (first los)     ; String
              (fn-for-los (rest los )))])) ; ListOfString

;; Template rules used:
;; -one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons String ListOfString)  
;; - !!! Coming Soon !!!
```
## Function Operation on List  
PROBLEM:  
We want to know whether your list of favorite Quidditch teams includes  
UBC! Design a function that consumes ListOfString and produces true if   
the list includes "UBC".  
```racket
; ______________________________
;|- HtDF Recipe                 |
;|1. Signature                  |
;|2. Purpose                    |
;|3. Stub                       |
;|4. Examples                   | 
;|5. Code Body                  |
;|6. Test                       |
;|______________________________|

;; ListOfString -> Boolean
;; produce true if los includes "UBC"
(check-expect (contains-ubc? empty) false)
(check-expect (contains-ubc? (cons "McGill" empty)) false)
(check-expect (contains-ubc? (cons "UBC" empty)) true)
(check-expect (contains-ubc? (cons "McGill" (cons "UBC" empty))) true)

;(define (contains-ubc? los) false)  ;Stub

; <Use template from ListOfString>
(define (contains-ubc? los) 
  (cond [(empty? los) false]
        [else
         (if (string=? (first los) "UBC")
             true
             (contains-ubc? (rest los)))]))   

```
## Revising the Recipes for Lists  
The selft reference template rule puts natural recursion in the template that corresponds to the  
self-reference in the type comment
```racket
;; ListOfString is one of:
;; - empty
;; - (cons String ListOfString)
;; interp. a list of strings
(define LOS1 empty)
(define LOS2 (cons "McGill" empty))
(define LOS3 (cons "UBC" (cons "McGill" empty)))

#;
(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (first los)                  ; String
              (fn-for-los (rest los )))])) ; ListOfString

;; Template rules used:
;; -one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons String ListOfString)  
;; - self-reference: (res los) is ListOfString
```
## Designing with Lists  
PROBLEM:  
You've been asked to design a program having to do with all the owls  
in the owlery.  

(A) Design a data definition to represent the weights of all the owls.   
    For this problem call it ListOfNumber.  
(B) Design a function that consumes the weights of owls and produces  
    the total weight of all the owls.  
(C) Design a function that consumes the weights of owls and produces  
    the total number of owls.  
```racket
;; Data definitions:
;; ListOfNumber is one of:
;; - empty
;; - (cons Number ListOfNumber) :SR
;; interp. each number in the list is an owl weight in ounces
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon(rest lon)))]))

;; Template rules used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Number ListOfNumber)
;; - self-reference: (rest lon) is ListOfNumber
       
;; Functions:

;; ListOfNumber -> Number
;; produce total weight of owls in consumed list
(check-expect (sum empty) 0)
(check-expect (sum (cons 60 empty)) (+ 60 0))
(check-expect (sum (cons 60 (cons 42 empty))) (+ 60 42 0))

;(define (sum lon) 0) ;Stub

; <Use template from ListOfNumber>
(define (sum lon)
  (cond [(empty? lon) 0]
        [else
         (+ (first lon)
            (sum(rest lon)))]))

;; ListOfNumber -> Natural
;; produce total number of weights in consumed list
(check-expect (count empty) 0)
(check-expect (count (cons 12 empty)) (+ 1 0))
(check-expect (count (cons 35 (cons 12 empty))) (+ 1 1 0))

;(define (count lon) 0) ;Stub
; <Use the template from ListOfNumber>
(define (count lon)
  (cond [(empty? lon) 0]
        [else
         (+ 1 (count (rest lon)))]))
```
