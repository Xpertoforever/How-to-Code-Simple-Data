## The Reference Rule Part 1:  
**Domain and Data Definition**  
PROBLEM:  
Eva is trying to decide where to go to university. One important factor for her is   
tuition costs. Eva is a visual thinker, and has taken Systematic Program Design,   
so she decides to design a program that will help her visualize the costs at   
different schools. She decides to start simply, knowing she can revise her design  
later.  

The information she has so far is the names of some schools as well as their   
international student tuition costs. She would like to be able to represent that  
information in bar charts like this one:  
 .
(A) Design data definitions to represent the information Eva has.  
(B) Design a function that consumes information about schools and their  
    tuition and produces a bar chart.  
(C) Design a function that consumes information about schools and produces   
    the school with the lowest international student tuition.  
```racket
(require 2htdp/image)

;; Constants:
(define FONT-SIZE 24)
(define FONT-COLOR "black")
(define Y-SCALE 1/200)
(define BAR-WIDTH 30)
(define BAR-COLOR "lightblue")

;; Data definition

(define-struct school (name tuition))
;; School is (make-school String Natural)
;; interp. name is the school's name, tuition is international student's tuition in USD

(define S1 (make-school "school1" 27797))
(define S2 (make-school "school2" 23300))
(define S3 (make-school "school3" 28500))

(define (fn-for-school s)
  (... (school-name s)
       (school-tuition s)))

;; Template rules used:
;; - compound: (make-school String Natural)

;; ListOfSchool is one of:
;; - empty
;; - (cons School ListOfSchool)
;; interp. a list of schools

(define LOS1 empty)
(define LOS2 (cons S1 (cons S2 (cons S3 empty))))

(define (fn-for-los los)
  (cond [(empty? los) (...)] 
        [else
         (... (fn-for-school (first los))
              (fn-forlos (rest los)))]))
```
