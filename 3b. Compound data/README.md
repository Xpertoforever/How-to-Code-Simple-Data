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
## Practice - Recommended Problems   
## Problem 1  
**PROBLEM A:**  
Design a data definition to represent a movie, including    
title, budget, and year released.  
To help you to create some examples, find some interesting movie facts below:   
"Titanic" - budget: 200000000 released: 1997  
"Avatar" - budget: 237000000 released: 2009  
"The Avengers" - budget: 220000000 released: 2012  
However, feel free to resarch more on your own! 
```racket
;; Data definitions:
;; =================
; ______________________________
;|Data definititon recipe HtDD  |
;|1. Structure definition       |
;|2. Type comment               |
;|3. Interpretation             |
;|4. Examples                   | 
;|5. A template                 |
;|6. Templates Rules used       |
;|______________________________|
(define-struct movie (ti bg yy))
;; Movie is (make-movie String Natural Natural
;; interp. (make-movie ti bg yy) is a movie with
;;          ti is the title
;;          bg is the budget
;;          yy is the year

(define M1 (make-movie "Titanic" 200000000 1997))
(define M2 (make-movie "Avatar" 237000000 2009))
(define M3 (make-movie "The Avengers" 220000000 2012))

#;
(define (fn-for-movie m)
  (... (movie-ti m)    ;String
       (movie-bg m)    ;Natural
       (movie-yy m)))  ;Natural
;; Template rules used:
;;  - compound: 3 fields
```
**PROBLEM B:**   
You have a list of movies you want to watch, but you like to watch your   
rentals in chronological order. Design a function that consumes two movies   
and produces the title of the most recently released movie.  
Note that the rule for templating a function that consumes two compound data   
parameters is for the template to include all the selectors for both   
parameters.  
```racket
;; Functions:
;; =================
; ______________________________
;|- HtDF Recipe                 |
;|1. Signature                  |
;|2. Purpose                    |
;|3. Stub                       |
;|4. Examples                   | 
;|5. Code Body                  |
;|6. Test                       | 
;|______________________________|

;; Movie -> Movie
;; provide the most recently released movie between 2 movies
(check-expect (most-recently-movie M1 M2) "Avatar") 

;(define (most-recently-movie movie1 movie2) movie1)  ;Stub

; <Use template from movie>
#;
(define (most-recently-movie m1 m2)
  (... (movie-ti m1)   
       (movie-bg m1)    
       (movie-yy m1)
       (movie-ti m2)   
       (movie-bg m2)    
       (movie-yy m2)))

(define (most-recently-movie m1 m2)
   (if (> (movie-yy m1) (movie-yy m2))
       (movie-ti m1)
       (movie-ti m2)))
```
















