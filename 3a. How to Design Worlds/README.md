## The big-bang Mechanism  
The big-bang let us execute two or more functions together.   
```Racket  
If your program needs to:	              Then it needs this option:   
change as time goes by (nearly all do)	on-tick   
display something (nearly all do)	      to-draw  
change in response to key presses	      on-key  
change in response to mouse activity  	on-mouse  
stop automatically	                    stop-when  
```
## Domain Analysis  

;Domain analysis (use a piece of paper!)  
;1. Sketch program scenarios  
;2. Identify constant information  
;3. Identify changing information  
;4. Identify big-bang options  

PROBLEM:  
Use the How to Design Worlds recipe to design an interactive  
program in which a cat starts at the left edge of the display   
and then walks across the screen to the right. When the cat  
reaches the right edge it should just keep going right off   
the screen.  

Once your design is complete revise it to add a new feature,  
which is that pressing the space key should cause the cat to  
go back to the left edge of the screen. When you do this, go  
all the way back to your domain analysis and incorporate the  
new feature.  

To help you get started, here is a picture of a cat, which we  
have taken from the 2nd edition of the How to Design Programs   
book on which this course is based.  

```Racket
;Domain analysis (use a piece of paper!)
;1. Sketch program scenarios
;2. Identify constant information
;3. Identify changing information
;4. Identify big-bang options

;; Sketch program

;; Constant:
;;  - width
;;  - height
;;  - Center-Y
;;  - mts: Backgroud
;;  - cat image

;; Changing:
;; - X coordinate of cat

;; Identify big-bang options
;; - on-tick
;; - to-draw
```
## Program Through main Functions   
- Using named constant provides a **single point of control**, changing HEIGHT also changes CTR-Y
- **Traceability** : the ability to see where each analysis element winds up in the resulting program.

**Very Important**  
Any program that has users will have to change  
Over time, users want new features, better performance, etc.   
**Being easy to change is one of the most important properties a program should have**  

**A wish-list entry**  
Has a signature, purpose, !!! and a stub  
It is a promise to come back and finish this function later.  
In bigger programs you can have 10s or 100s of pending wish list entries,  
so it pays to be disciplined about writting down what you need to do later  

PROBLEM:   
Use the How to Design Worlds recipe to design an interactive  
program in which a cat starts at the left edge of the display   
and then walks across the screen to the right. When the cat  
reaches the right edge it should just keep going right off   
the screen.  
Once your design is complete revise it to add a new feature,   
which is that pressing the space key should cause the cat to  
go back to the left edge of the screen. When you do this, go  
all the way back to your domain analysis and incorporate the  
new feature.  
To help you get started, here is a picture of a cat, which we  
have taken from the 2nd edition of the How to Design Programs   
book on which this course is based.  
```Racket
(require 2htdp/image)
(require 2htdp/universe)

;; A cat that walks from left to right across the screen

;; =================
;; Constants:
(define WIDTH 600)
(define HEIGHT 400)
(define CRT-Y (/ HEIGHT 2))
(define MTS (empty-scene WIDTH HEIGHT))
(define CAT-IMG .)

;; =================
;; Data definitions:
(require 2htdp/image)
(require 2htdp/universe)

;; A cat that walks from left to right across the screen

;; =================
;; Constants:
(define WIDTH 600)
(define HEIGHT 400)
(define CRT-Y (/ HEIGHT 2))
(define MTS (empty-scene WIDTH HEIGHT))
(define CAT-IMG .)

;; Cat is Number
;; interp. x is the position of the in the screen coordinates

(define C1 0) ;left edge
(define C2 (/ HEIGHT 2)) ;middle
(define C3 HEIGHT) ;right edge
#;
(define (fn-for-cat c)
    (... c))

;; Template rules used:
;; atomic non-distinct: Number


;; =================
;; Functions:

;; Cat -> Cat
;; start the world with (main 0)
;; 
(define (main c)
   (big-bang c                              ; Cat
            (on-tick   advance-cat)         ; Cat -> Cat
            (to-draw   render)))            ; Cat -> Image
```

## Working through the Wish List
```Racket
(require 2htdp/image)
(require 2htdp/universe)

;; A cat that walks from left to right across the screen

;; =================
;; Constants:
(define WIDTH 600)
(define HEIGHT 400)
(define CRT-Y (/ HEIGHT 2))
(define MTS (empty-scene WIDTH HEIGHT))
(define CAT-IMG .)

;; =================
;; Data definitions:

;; Cat is Number
;; interp. x is the position of the in the screen coordinates

(define C1 0) ;left edge
(define C2 (/ HEIGHT 2)) ;middle
(define C3 HEIGHT) ;right edge
#;
(define (fn-for-cat c)
    (... c))

;; Template rules used:
;; atomic non-distinct: Number


;; =================
;; Functions:

;; Cat -> Cat
;; start the world with (main 0)
;; 
(define (main c)
   (big-bang c                              ; Cat
            (on-tick   advance-cat)         ; Cat -> Cat
            (to-draw   render)))            ; Cat -> Image


;; Cat -> Cat
;; produce the next by advancing it 1 pixel to right
(check-expect (advance-cat 3) 4)
(check-expect (advance-cat 5) 6)

;(define (advance-cat c) 0)    ;Stub 

;<Use template from Cat>
(define (advance-cat c)
    (+ c 1))

;; Cat -> Image
;; render the cat image at appropiate place on MTS 
(check-expect (render 4) (place-image CAT-IMG 4 CRT-Y MTS))

;(define (render c) MTS)

;<Use template from Cat>
(define (render c)
    (place-image CAT-IMG c CRT-Y MTS))
```
## Improving a World Program  
The analysis is a model of the program  
Because it correctly describes the structure of the program,  
but has less detail, we can plan our work on the program by marking up the analysis.  

**Adding SPEED**
Necessary to change the below parts as you can see:  
```Racket   
;; Constants:
(define SPEED 3)

;; Cat -> Cat
;; produce the next by advancing it 1 pixel to right
(check-expect (advance-cat 3) (+ 3 SPEED))
(check-expect (advance-cat 5) (+ 5 SPEED))

;(define (advance-cat c) 0)    ;Stub 

;<Use template from Cat>
(define (advance-cat c)
    (+ c SPEED))
```

**Adding KEYBOARD Interaction**

PROBLEM:  
Extend the program so that pressing the space key causes the cat to jump back to the left edge of the window.  

```Racket
;; =================
;; Functions:

;; Cat -> Cat
;; start the world with (main 0)
;; 
(define (main c)
   (big-bang c                              ; Cat
            (on-tick   advance-cat)         ; Cat -> Cat
            (to-draw   render)            ; Cat -> Image
            (on-key handle-key)))                ; Cat KeyEvent -> Cat

;; Cat KeyEvent -> Cat
;; reset cat to left edge when space key is pressed
(check-expect (handle-key 10 " ") 0)
(check-expect (handle-key 10 "a") 10)
(check-expect (handle-key 0 " ") 0)
(check-expect (handle-key 0 "a") 0)

;(define (handle-key c ke) 0) ;stub


(define (handle-key c ke)
  (cond [(key=? ke " ") 0]
        [else c]))
```

## **My HtDW Template**
```Racket
(require 2htdp/image)
(require 2htdp/universe)
;; My world program  (make this more specific)

;; ==================================================
;; Constants:

    
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

;; WS is ... (give WS a better name)



;; ==================================================
;; Functions:
;; --------------------------------------------------
;; Big-Bang

;; WS -> WS
;; start the world with ...
;; 
(define (main ws)
  (big-bang ws                   ; WS
            (on-tick   tock)     ; WS -> WS
            (to-draw   render)   ; WS -> Image
            (stop-when ...)      ; WS -> Boolean
            (on-mouse  ...)      ; WS Integer Integer MouseEvent -> WS
            (on-key    ...)))    ; WS KeyEvent -> WS
            
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
;; WS -> WS
;; produce the next ...
;; !!!
(define (tock ws) ...)

;; --------------------------------------------------
;; Function 2
;; WS -> Image
;; render ... 
;; !!!
(define (render ws) ...)
            
;; --------------------------------------------------            

```
