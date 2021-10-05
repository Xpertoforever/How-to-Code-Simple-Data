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

**Short Recipe HtDD**  
;Data definititon recipe HtDD  
;1. Structure definition  
;2. Type comment  
;3. Interpretation  
;4. Examples  
;5. A template 

**Ready to copy on DrRacket**  
```racket
; ______________________________
;|Data definititon recipe HtDD  |
;|1. Structure definition       |
;|2. Type comment               |
;|3. Interpretation             |
;|4. Examples                   | 
;|5. A template                 |
;|______________________________|
```
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
**HtDD With Non-Primitive Data**  
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
**HtDD : Interval**  
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

**HtDD : Enumeration**  
PROBLEM:  
As part of designing a system to keep track of student grades, you  
are asked to design a data definition to represent the letter grade   
in a course, which is one of A, B or C.  
```racket
;Data definititon recipte HtDD
;1. Structure definition
;2. Type comment
;3. Interpretation
;4. Examples
;5. A template

;; LetterGrade is one of:
;; - "A"
;; - "B"
;; - "C"
;; interp. the letter grade in a course
;; <examples are redundant for enumerations>
#;
(define (fn-for-letter-grade lg)
  (con [(string=? lg "A") (...)] 
       [(string=? lg "B") (...)] 
       [(string=? lg "C") (...)]))

;; Template rules used:
;; - one of: 3 cases:
;; Atomic Distinct Value: "A" "B" "C"
```  
**HtDD : Itemization**  
PROBLEM 1:  
Consider designing the system for controlling a New Year's Eve  
display. Design a data definition to represent the current state  
of the countdown, which falls into one of three categories:  
 - not yet started  
 - from 10 to 1 seconds before midnight  
 - complete (Happy New Year!)  
```racket
;Data definititon recipte HtDD
;1. Structure definition
;2. Type comment
;3. Interpretation
;4. Examples
;5. A template

;; CountDown is one of:
;; - false 
;; - Natural[1, 10]
;; - "complete"
;; interp.
;; false means countdown has not yet started
;; Natural[1, 10] means countdown is running and how many seconds
;; "complete" means countdown is over
(define CD1 false)
(define CD2 10)
(define CD3 1)
(define CD4 "complete")


(define (fn-for-countdown c)
  (cond [(fase? c) (...)]
        [(and (number=? c) (<= 1 c) (<= c 10) (... c)]
        [else (...)])

;; Template rules used:
;; - one of: 3 cases
;; - atomic distinct: false
;; - atomic non-distinct: Natural[1, 10]
;; - atomic distinct: "complete" 
```  
PROBLEM2:  
Design a data definition for a traffic light that can either be sisabled;  
or be one of red, yellow or green.  
```racket
;Data definititon recipte HtDD
;1. Structure definition
;2. Type comment
;3. Interpretation
;4. Examples
;5. A template

;; Data definitions: 
;; TLight is one of:
;; -false
;; -"red"
;; -"yellow"
;; -"green"
;; interp. false means the light is disabled; otherwise the color of the light.

(define TL1 false)
(define TL2 "red")

(define (fn-for tlight t1)
  (cond [(false? t1) (...)]
        [(string=? t1 "red")) (...)]
        [(string=? t1 "yellow")) (...)]
        [(string=? t1 "green")) (...)])

;; Template rules used:
;; - one of: 4 cases
;; - atomic distinct: false
;; - atomic distinct: "red"
;; - atomic distinct: "yellow"
;; - atomic distinct: "green"
``` 
**HtDF with Interval**  
PROBLEM:  
Using the SeatNum data definition below design a function  
that produces true if the given seat number is on the aisle
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

;; Functions:
;Recipe HtDF
;1. Signature
;2. Purpose
;3. Stub
;4. Examples
;5. Template
;6. Body
;7. Test

;; SeatNum -> Boolean
;; produce true if the given seat number is on the aisle
(check-expect (aisle? 1) true) ;Examples
(check-expect (aisle? 16) false)
(check-expect (aisle? 32) true)

;(define (aisle? sn) false) ;stub

;(define (aisle? sn) ; Template
;        (... sn)

(define (aisle? sn) ; 
        (or (= sn 1)
            (= sn 32) ))
``` 
**HtDF with Enumeration** 
PROBLEM:  
Using the LetterGrade data definition below desing a function that  
consmes a letter grade and produces the next highest letter grade.  
Call your function bum-up  
```racket
;Data definititon recipte HtDD
;1. Structure definition
;2. Type comment
;3. Interpretation
;4. Examples
;5. A template

;; LetterGrade is one of:
;; - "A"
;; - "B"
;; - "C"
;; interp. the letter grade in a course
;; <examples are redundant for enumerations>
#;
(define (fn-for-letter-grade lg)
  (cond [(string=? lg "A") (...)] 
       [(string=? lg "B") (...)] 
       [(string=? lg "C") (...)]))

;; Template rules used:
;; - one of: 3 cases:
;; Atomic Distinct Value: "A" "B" "C"

;; Functions:

;; LetterGrade -> LetterGrade
;; produce next highest letter grade (no change for A)
(check-expect (bump-up "C") "B") ; Example
(check-expect (bump-up "B") "A")
(check-expect (bump-up "A") "A")

;(define (bump-up lg) "A") 

;<use template from LetterGrade>
(define (bump-up lg)
  (cond [(string=? lg "A") "A"] 
       [(string=? lg "B") "A"] 
       [(string=? lg "C") "B"]))
``` 
**HtDF with Itemization**  
PROBLEM:  
You are asked to contribute to the design for a very simple New Year's  
Eve countdown display. You already have the data definition given below.  
You need to design a function that consumes Countdown and produce and  
image showing the current status of the countdown.  
```racket
;Data definititon recipte HtDD
;1. Structure definition
;2. Type comment
;3. Interpretation
;4. Examples
;5. A template

;; CountDown is one of:
;; - false 
;; - Natural[1, 10]
;; - "complete"
;; interp.
;; false means countdown has not yet started
;; Natural[1, 10] means countdown is running and how many seconds
;; "complete" means countdown is over
(define CD1 false)
(define CD2 10)
(define CD3 1)
(define CD4 "complete")

#;
(define (fn-for-countdown c)
  (cond [(false? c) (...)]
        [(and (number? c) (<= 1 c) (<= c 10)) (... c)]
        [else (...)]))

;; Template rules used:
;; - one of: 3 cases
;; - atomic distinct: false
;; - atomic non-distinct: Natural[1, 10]
;; - atomic distinct: "complete"

;; Functions:
;Recipe HtDF
;1. Signature
;2. Purpose
;3. Stub
;4. Examples
;5. Template
;6. Body
;7. Test

;; Countdown -> Image ;Signature
;; show a image of the current status; False, Countdown or Complete
(check-expect (countdown-to-image false) (square 0 "solid" "white" ))
(check-expect (countdown-to-image 5) (text (number->string 5) 24 "black"))
(check-expect (countdown-to-image "complete") (text "Happy New Year" 24 "red"))

;(define (countdown-to-image c) (square 0 "solid" "white" )) ;Stub

;<use template from countdown>

(define (countdown-to-image c) 
  (cond [(false? c) (square 0 "solid" "white" )]
        [(and (number? c) (<= 1 c) (<= c 10))
         (text (number->string c) 24 "black")]
        [else (text "Happy New Year" 24 "red")]))

(countdown-to-image 5)
``` 


### **Structure of Information Flows Through** ###
**Structure**  
- Information  
- Data  
- Template  
- Functions / Test  

Identifying the structure of the information is a key step in programd design   
As data definitions get more sophisticated you will see that   
choosing the structure to use is a point of leverage in   
designing the overall program  
