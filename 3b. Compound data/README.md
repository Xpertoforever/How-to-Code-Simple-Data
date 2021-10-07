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
## Problem 2   
**PROBLEM A:**     
Design a data definition to help a teacher organize their next field trip.   
On the trip, lunch must be provided for all students. For each student, track   
their name, their grade (from 1 to 12), and whether or not they have allergies.  
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

(define-struct student (name grade allergies?))
;; Student is (make-student String Natural[1, 12] Boolean)
;; interp. (make-student name grade allergies) is a student with
;;          name is the name
;;          grade is the grade 1-12
;;          allergies is true if they have allergies

(define S1 (make-student "Daniel" 5 true))
(define S2 (make-student "Miguel" 12 false))

#;
(define (fn-for-student s)
     (... (student-name s)         ; String
          (student-grade s)        ; Natural[1, 12]
          (student-allergies? s)))  ; Boolean

;; Template rules used:
;; - Compound: 3 fields
```
**PROBLEM B:**  
To plan for the field trip, if students are in grade 6 or below, the teacher   
is responsible for keeping track of their allergies. If a student has allergies,   
and is in a qualifying grade, their name should be added to a special list.   
Design a function to produce true if a student name should be added to this list.  
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

;; Student -> Boolean
;; produce true if the student grade is between [1, 6] and with allergies
(check-expect (add-name? S1) true)  ;Examples

;(define (add-name? s) false)  ;Stub

; <Use template from Student>
(define (add-name? s)
    (and (<= (student-grade s) 6)
             (student-allergies? s)))    
```
## HtDW With Compound Data_Cowabunga  
PROBLEM:  
As we learned in the cat world programs, cats have a mind of their own. When they   
reach the edge they just keep walking out of the window.  

Cows on the other hand are docile creatures. They stay inside the fence, walking   
back and forth nicely.   

Design a world program with the following behaviour:  
   - A cow walks back and forth across the screen.  
   - When it gets to an edge it changes direction and goes back the other way  
   - When you start the program it should be possible to control how fast a  
     walker your cow is.  
   - Pressing space makes it change direction right away.  
   
To help you here are two pictures of the right and left sides of a lovely cow that  
was raised for us at Brown University.  

.     .

Once your program works here is something you can try for fun. If you rotate the  
images of the cow slightly, and you vary the image you use as the cow moves, you  
can make it appear as if the cow is waddling as it walks across the screen.  

Also, to make it look better, arrange for the cow to change direction when its  
nose hits the edge of the window, not the center of its body.  
```racket
(require 2htdp/image)
(require 2htdp/universe)

;; A cow walks left to right and inverse; controlling the speed

;; ==================================================
;; Constants:

(define WIDTH 400)
(define HEIGHT 200)
(define CTR-Y (/ HEIGHT 2))

(define RCOW .)
(define LCOW .)
(define MTS (empty-scene WIDTH HEIGHT))

;; ==================================================
;; Data Definitions:
; ______________________________
;|Data definititon recipe HtDD  |
;|1. Structure definition       |
;|2. Type comment               |
;|3. Interpretation             |
;|4. Examples                   | 
;|5. A template                 |
;|6. Templates Rules used       |
;|______________________________|

(define-struct cow (x dx))
;; Cow is (make-cow Natural[0, WIDTH], Integer)
;; interp. (make-cow x dx) is a cow with x coordinate x and velocity dx
;;         the x is the center of the cow
;;         x is in screen coordinates (pixels)
;;         dx is in pixels per tick

(define C1 (make-cow 10 3)) ;at 10, moving left -> right
(define C2 (make-cow 20 -4)) ;at 20. moving left <- right

#;
(define (fn-for-cow c)
   (... (cow-x c)        ;Natura[0, WIDTH]
        (cow-dx c)))     ;Integer

;; Template rules used:
;; - compound: 2 fields

;; ==================================================
;; Functions:
;; --------------------------------------------------
;; Big-Bang

;; Cow -> Cow
;; called to make the cow go for a walk; start with (main (make-cow 0 3))
;; no tests for main function
(define (main c)
  (big-bang c                             ; Cow
            (on-tick   next-cow)          ; Cow -> Cow
            (to-draw   render-cow)        ; Cow -> Image
            (on-key    handle-key)))      ; Cow KeyEvent -> Cow
 
; Big-bang more options not used:    
;            (stop-when ...)      ; WS -> Boolean
;            (on-mouse  ...)      ; WS Integer Integer MouseEvent -> WS
;            (on-key    ...)))    ; WS KeyEvent -> WS
            
;; --------------------------------------------------     
; ______________________________
;|- HtDF Recipe                 |
;|1. Signature                  |
;|2. Purpose                    |
;|3. Stub                       |
;|4. Examples                   | 
;|5. Code Body                  |
;|6. Test                       |
;|______________________________|         
;; --------------------------------------------------
;; Function 1
;; Cow -> Cow
;; increase cow x by dx; bounce off edges
(check-expect (next-cow (make-cow 20 3)) (make-cow (+ 20 3) 3))   ;middle
(check-expect (next-cow (make-cow 20 -3)) (make-cow (- 20 3) -3))

(check-expect (next-cow (make-cow (- WIDTH 3) 3)) (make-cow WIDTH 3)) ;reaches the edge
(check-expect (next-cow (make-cow 3 -3)) (make-cow 0 -3))

(check-expect (next-cow (make-cow (- WIDTH 2) 3)) (make-cow WIDTH -3))  ;try to pass the edge
(check-expect (next-cow (make-cow 2 -3)) (make-cow 0 3))

;(define (next-cow c) c) ;Stub

; <Use template from Cow>
(define (next-cow c)
   (cond [(> (+ (cow-x c) (cow-dx c)) WIDTH) (make-cow WIDTH (- (cow-dx c)))]
         [(< (+ (cow-x c) (cow-dx c))     0) (make-cow     0 (- (cow-dx c)))]
         [else
          (make-cow (+ (cow-x c) (cow-dx c))
                    (cow-dx c))]))  
;; --------------------------------------------------
;; Function 2
;; Cow -> Image
;; place appropriate cow image on MTS at (cow-x c) and CTR-Y 
(check-expect (render-cow (make-cow 99 3))
              (place-image RCOW 99 CTR-Y MTS))
(check-expect (render-cow (make-cow 33 -3))
              (place-image LCOW 33 CTR-Y MTS))

;(define (render-cow c) MTS) ;Stub   
; <Use template from Cow>
(define (render-cow c)
   (place-image (choose-image c) (cow-x c) CTR-Y MTS)) 
  
;; --------------------------------------------------       
;; Function 3
;; Cow -> Image
;; produce RCOW or LCOW depending of the direction cow is going
(check-expect (choose-image (make-cow 10 3)) RCOW)
(check-expect (choose-image (make-cow 10 -3)) LCOW)
(check-expect (choose-image (make-cow 10 0)) LCOW)                 

;(define (choose-image c) RCOW) ;Stub

(define (choose-image c)
  (if (> (cow-dx c) 0)
      RCOW
      LCOW))
;; --------------------------------------------------       
;; Function 4
;; Cow KeyEvent -> Cow
;; reverse direction of cow travel when space bar is pressed 
(check-expect (handle-key (make-cow 10 3) " ") (make-cow 10 -3))
(check-expect (handle-key (make-cow 10 -3) " ") (make-cow 10 3))

;(define (handle-key c ke) c) ;Stub

(define (handle-key c ke)
  (cond [(key=? ke " ") (make-cow (cow-x c) (- (cow-dx c)))]
        [else c]))            
;; --------------------------------------------------       
 
```
## Recommended Problem - Water Balloon  
PROBLEM:  
**Solution: File 6 :Recommended Problem - Water Balloon**  
In this problem, we will design an animation of throwing a water balloon.  
When the program starts the water balloon should appear on the left side 
of the screen, half-way up.  Since the balloon was thrown, it should 
fly across the screen, rotating in a clockwise fashion. Pressing the 
space key should cause the program to start over with the water balloon
back at the left side of the screen. 

NOTE: Please include your domain analysis at the top in a comment box. 

Use the following images to assist you with your domain analysis:


1)
2).
.
3)
.
4)

.
    

Here is an image of the water balloon:
(define WATER-BALLOON.)



NOTE: The rotate function wants an angle in degrees as its first 
argument. By that it means Number[0, 360). As time goes by your balloon 
may end up spinning more than once, for example, you may get to a point 
where it has spun 362 degrees, which rotate won't accept. 

The solution to that is to use the modulo function as follows:

(rotate (modulo ... 360) (text "hello" 30 "black"))

where ... should be replaced by the number of degrees to rotate.

NOTE: It is possible to design this program with simple atomic data, 
but we would like you to use compound data.

```racket
(require 2htdp/image)
(require 2htdp/universe)

;; A water balloon going from left->right and rotating in his center
;; ==================================================
;; Constant:
;;  - width
;;  - height
;;  - Center-Y
;;  - mts: Backgroud
;;  - cat image

;; Changing:
;; - X coordinate of cat
;; - degree

;; Identify big-bang options
;; - on-tick
;; - to-draw
;; - on-key

;; ==================================================
;; Constants:
(define WIDTH 600)
(define HEIGHT 400)
(define CTR-Y (/ HEIGHT 2))
(define MTS (empty-scene WIDTH HEIGHT))
(define WATER-BALLOON .)

;; ==================================================
;; Data Definitions:
; ______________________________
;|Data definititon recipe HtDD  |
;|1. Structure definition       |
;|2. Type comment               |
;|3. Interpretation             |
;|4. Examples                   | 
;|5. A template                 |
;|6. Templates Rules used       |
;|______________________________|

(define-struct wball (pos degree))
;; Wball is (make-Wball Number Number[0, 360])
;; interp. (make-Wball pos degree) is a water balloon with
;;         pos is the x coordinate in the screen
;;         degree is the rotation applied in this position

(define WM1 (make-wball 0 0))
(define WM2 (make-wball 20 50))
#;
(define (fn-for-wball wb)
     (... (wball-pos wb)       ; Number
          (wball-degree wb)))  ; Number [0, 360]

;; Template rules used:
;; - Compound: 2 fields

;; ==================================================
;; Functions:
;; --------------------------------------------------
;; Big-Bang

;; Wball -> Wball
;; Call to through a water balloon from left->right; start the world with (main (make-wball 0 0))
;; 
(define (main wb)
  (big-bang wb                                   ; Wball
            (on-tick   advance-wball 0.01)     ; Wball -> Wball
            (to-draw   render-wball)      ; Wball -> Image
            (on-key    handle-key)))                      ; Wball KeyEvent -> Wball
; Big-bang others options not used:    
;            (stop-when ...)      ; WS -> Boolean
;            (on-mouse  ...)      ; WS Integer Integer MouseEvent -> WS
;            (on-key    ...)))    ; WS KeyEvent -> WS
            
;; --------------------------------------------------     
; ______________________________
;|- HtDF Recipe                 |
;|1. Signature                  |
;|2. Purpose                    |
;|3. Stub                       |
;|4. Examples                   | 
;|5. Code Body                  |
;|6. Test                       |
;|______________________________|         
;; --------------------------------------------------
;; Function 1
;; ; Wball -> Wball
;; produce the next Water balloon position in the screen
(check-expect (advance-wball (make-wball 0 0)) (make-wball 1 1))
(check-expect (advance-wball (make-wball 10 20)) (make-wball 11 21))
    
;(define (advance-wball wb) wb)   ;Stub
; <Use template from Wball>

(define (advance-wball wb)
     (make-wball (+ (wball-pos wb) 1) (+ (wball-degree wb) 1)))
     
;; --------------------------------------------------
;; Function 2
;; Wball -> Image
;; render the Water balloon in the position and degree appropiate
(check-expect (render-wball (make-wball 0 0))
              (place-image (rotate (- (modulo 0 360)) WATER-BALLOON) 0 CTR-Y MTS))

;(define (render-wball ws) MTS)  ;Stub
; <Use Template from Wball>

(define (render-wball wb)
     (place-image (rotate (- (modulo (wball-degree wb) 360)) WATER-BALLOON) (wball-pos wb) CTR-Y MTS))            
;; --------------------------------------------------
;; Function 3
;; Wball KeyEvent -> Wball
;; Restart the walking of the water balloon
(check-expect (handle-key (make-wball 10 3) " ") (make-wball 0 0))
(check-expect (handle-key (make-wball 10 50) " ") (make-wball 0 0))

;(define (handle-key wb ke) c) ;Stub

(define (handle-key wb ke)
  (cond [(key=? ke " ") (make-wball 0 0)]
        [else wb]))   
;; --------------------------------------------------
```
## QUIZ - FLOWER GROWING UP - MOUSE RESTART    
PROBLEM:  
Design a World Program with Compound Data. You can be as creative  
as you like, but keep it simple. Above all, follow the recipes!  
You must also stay within the scope of the first part of the course.  
Do not use language features we have not seen in the videos.   

If you need inspiration, you can choose to create a program  
that allows you to click on a spot on the screen to create a flower, 
which then grows over time. If you click again the first flower  
is replaced by a new one at the new position.  

**CREATE A PROGRAM THAT ALLOWS YOU TO CLICK ON A SPOT ON THE SCREEN  
TO CREATE A FLOWER, WHICH THEN GROWS OVER TIME. IF YOU CLICK AGAIN  
THE FIRST FLOWER IS REPLACED BY A NEW ONE AT THE NEW POSITION.**  

You should do all your design work in DrRacket.  
Following the step-by-step recipe in DrRacket will help you be sure  
that you have a quality solution.  

**You will find the image and the racket file in the attached files**
```racket
(require 2htdp/image)
(require 2htdp/universe)

;; A flower appears in the screen from small to big rotating in its center

;; ==================================================
;; Domain analysis (use a piece of paper!)

;; Constant:
;;  - width
;;  - height
;;  - mts: Backgroud
;;  - flower image

;; Changing:
;; - X coordinate of the flower
;; - Y coordinate of the flower
;; - Size of the flower

;; Maybe I can add this for the next version
;; - Degree rotation of the flower

;; Identify big-bang options
;; - on-tick
;; - to-draw
;; - on-mouse
;; ==================================================
;; Constants:
(define WIDTH 400)
(define HEIGHT 600)
(define MTS (empty-scene WIDTH HEIGHT))
(define IMG-FLOWER .)
(define SCALE-FACTOR 0.2)
    
;; ==================================================
;; Data Definitions:
; ______________________________
;|Data definititon recipe HtDD  |
;|1. Structure definition       |
;|2. Type comment               |
;|3. Interpretation             |
;|4. Examples                   | 
;|5. A template                 |
;|6. Templates Rules used       |
;|______________________________|

(define-struct flower (x y size))
;; Flower is (make-flower (Number Number Number))
;; interp. (make-flower x y size) is a flower in the x and y position
;;         in the screeen with a size determined
;;         X is the x coordinate in the screen
;;         Y is the y coordinate in the screen
;;         Size is how bing is the flower size

(define F1 (make-flower 0 0 0))
(define F2 (make-flower 5 20 3))
(define F3 (make-flower (/ WIDTH 2) (/ HEIGHT 2) 20))

#;
(define (fn-for-flower f)
  (... (flower-x f)        ;Number
       (flower-y f)        ;Number
       (flower-size f)))   ;Number

;; Template rules used:
;; Compound: 3 fields

;; ==================================================
;; Functions:
;; --------------------------------------------------
;; Big-Bang

;; Flower -> Flower
;; A flower starts to grow up, start the world with (main (make-flower 200 300 1))
;; 
(define (main f)
  (big-bang f                          ; Flower
            (on-tick   put-flower 0.08)     ; Flower ->  Flower
            (to-draw   render-flower)  ; Flower -> Image
            (on-mouse  handle-mouse))) ; Flower Integer Integer MouseEvent -> Flower

; Big-bang more options not used:
;            (stop-when ...)      ; WS -> Boolean
;            (on-mouse  ...)      ; WS Integer Integer MouseEvent -> WS
;            (on-key    ...)))    ; WS KeyEvent -> WS
            
;; --------------------------------------------------      
; ______________________________
;|- HtDF Recipe                 |
;|1. Signature                  |
;|2. Purpose                    |
;|3. Stub                       |
;|4. Examples                   | 
;|5. Code Body                  |
;|6. Test                       |
;|______________________________|          
;; --------------------------------------------------
;; Function 1
;; Flower -> Flower
;; produce the current flower in the position selected
(check-expect (put-flower (make-flower 0 0 2)) (make-flower 0 0 (+ 2 SCALE-FACTOR)))
(check-expect (put-flower (make-flower 20 50 10)) (make-flower 20 50 (+ 10 SCALE-FACTOR)))

; (define (put-flower f) IMG-FLOWER)  ;Stub

; <Use template from flower>  
(define (put-flower f)
  (make-flower (flower-x f) (flower-y f) (+ (flower-size f) SCALE-FACTOR))) 
;; --------------------------------------------------
;; Function 2
;; Flower -> Image
;; render the flower in the correct position and size
(check-expect (render-flower (make-flower 20 20 2)) 
              (place-image (scale 2 IMG-FLOWER) 20 20 MTS))


;(define (render-flower f) MTS)  ;stub

; <Use template from flower>  
(define (render-flower f)
  (place-image (scale (flower-size f) IMG-FLOWER) (flower-x f) (flower-y f) MTS))

;; --------------------------------------------------
;; Function 3
;; Flower Integer Integer MouseEvent -> Flower
;; When the mouse is clicked in the screen the flower now appear in this position 

(define (handle-mouse f x y me)
  (cond [(mouse=? me "button-down") (make-flower x y SCALE-FACTOR)]
        [else f]))
;; -------------------------------------------------- 
```
