## **cond Expressions Part 1/2**  

**NEW Comment Option : #;**    
Comments out the entire expression or definition that follows it  

**OTHER: () and [] : Are the same in Racket?**  
The answer is Yes; both are equivalent  
but by convention we use:  
- [] around questions and answer pairs in cond 

**To form Condition Expressions**
```racket
(cond [ <Expression_Question> <Expression_Answer>]
      ...)
;Last question can be else
```
## **cond Expressions Part 2/2**  
Evaluating condition Expressions  
i.g.  
```racket
(cond [(> 1 2) "bigger"]
      [(= 1 2) "equal"]
      [(< 1 2) "smaller"]

(cond [false  "bigger"]
      [(= 1 2) "equal"]
      [(< 1 2) "smaller"]

(cond [(= 1 2) "equal"]
      [(< 1 2) "smaller"]

(cond [false "equal"]
      [(< 1 2) "smaller"]

(cond [(< 1 2) "smaller"]

(cond [true "smaller"]

"smaller" 
```
## **Data definition**    
## **Data definition Introduction**    
Problem Domain  
- A light is red  : Interpretation  

Program  
- 0 : Representation  

**About our codes** 
With data definition our codes will have 2 parts :  
```racket
;; Data definitions:

HERE THE DATA DEFINITION CODE

;; Functions:

HERE THE FUNCTIONS

```
Data definition describes:  
-How to form data of a new type  
-How to represent information as data  
-How to interpret data as information  
-Template for operating on data  

Data definition simplifies function:  
-Restricts data consumed  
-Restricts data produced  
-Helps generate examples  
-Provides template  

## **Data definition Atomic Non-distinct**  
A data definition consists of 4 or five parts:  
1. A possible structure definition (not until compound data)  
2. A type comment that defines a new type name and describes how to form data of that type.  
3. An interpretation that describes the correspondence between information and data.  
4. One or more examples of the data.  
5. A template for a 1 argument function operating on data of this type.  

;Data definititon recipte HtDD  
;1. Structure definition  
;2. Type comment  
;3. Interpretation  
;4. Examples  
;5. A template  
 
For a given type TypeName the data driven template is:  
```racket
(define (fn-for-type-name x)
  <body>)
```
EXAMPLE 1: Atomic Non-Distinct
Imagine that you are designing a program that, among other things,    
has information about the names of cities in its problem domain.  
Design a data definition to represent the name of a city. 
```racket
; Data definititon recipte HtDD recipe
; 1. Structure definition
; 2. Type comment
; 3. Interpretation
; 4. Examples
; 5. A template

;; CityName is String            ; Type Comment
;; interp. the name of a city    ; Interpretation

(define CN1 "Boston")           ;Examples
(define CN2 "Vancouver")

;; For a given type TypeName the data driven template is:

(define (fn-for-city-name cn)
        (... cn))
;; Templated rules used
  ;; - atomic non-distinct: String
```
**HtDF With Non-Primitive Data**  
How to use the HtDF recipe with non-primitive data (data defined by a data definition).  

PROBLEM:  
Using the CityName data definition below design a function  
that produces true if the given city is the best in the world.   
(You are free to decide for yourself which is the best city   
in the world.)  
```racket
;; Data definitions:


;; CityName is String
;; interp. the name of a city
(define CN1 "Boston")
(define CN2 "Vancouver")
#;
(define (fn-for-city-name cn)
  (... cn))

;; Template rules used:              For the first part of the course
;;   atomic non-distinct: String     we want you to list the template
;;                                   rules used after each template.
;;

;; Functions:

;; CityName -> Boolean
;; produce true if the given city is Tacna
(check-expect (best? "Boston") false) ;Examples
(check-expect (best? "Tacna") true)

;(define (best? cn) false) ;Stub

;took template from CityName
; Note: when function has two cases flesh out
; the template by wrapping if around 3 copies of the template body
#; ;First step
(define (fn-for-city-name cn)
  (... cn))
#; ;Second step
(define (best? cn)
  (if (... cn)
      (... cn)
      (... cn)))
#; ;Thrid step
(define (best? cn)
  (if (string=? cn "Tacna")
      true
      false))  

;Fourth step
(define (best? cn)
  (string=? cn "Tacna"))
```
**HtDF : Interval**  
PROBLEM:  
Imagine that you are designing a program to manage ticket sales for a  
theatre. (Also imagine that the theatre is perfectly rectangular in shape!)   
Design a data definition to represent a seat number in a row, where each   
row has 32 seats. (Just the seat number, not the row number.)  
```racket
;Data definititon recipte HtDD
;1. Structure definition
;2. Type comment
;3. Interpretation
;4. Examples
;5. A template

;;Note:
;; [] Brackets mean inclusive at the end of the interval
;; () Brackets mean exclusive
;; SeatNum is Natural[1,32]
;; interp. seat numbers in a row, 1 and 32 are aisle seats

(define SN1 1)   ;aisle
(define SN2 12)  ;middle
(define SN3 32)  ;aisle

#;
(define (fn-for-seat-num sn)
  (... sn))

;; Template rules used:
;; atomic non-distinct: Natural[1,32]
```





