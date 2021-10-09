## PROBLEM 2: SPING BEARS  
In this problem you will design another world program. In this program the changing   
information will be more complex - your type definitions will involve arbitrary   
sized data as well as the reference rule and compound data. But by doing your   
design in two phases you will be able to manage this complexity. As a whole, this problem   
will represent an excellent summary of the material covered so far in the course, and world   
programs in particular.  
 
This world is about spinning bears. The world will start with an empty screen. Clicking  
anywhere on the screen will cause a bear to appear at that spot. The bear starts out upright,  
but then rotates counterclockwise at a constant speed. Each time the mouse is clicked on the   
screen, a new upright bear appears and starts spinning.  

So each bear has its own x and y position, as well as its angle of rotation. And there are an  
arbitrary amount of bears.  

To start, design a world that has only one spinning bear. Initially, the world will start  
with one bear spinning in the center at the screen. Clicking the mouse at a spot on the  
world will replace the old bear with a new bear at the new spot. You can do this part   
with only material up through compound.   

Once this is working you should expand the program to include an arbitrary number of bears.  
Here is an image of a bear for you to use: .  
```racket
(require 2htdp/image)
(require 2htdp/universe)
;; ♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒
;; ♒ A bear sping spining appear on the screen when we click    ♒  
;; ♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒♒

;; ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
;; Domain Analysis:
;; ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
;; Constant:
;;  - Width
;;  - Height
;;  - Image: Bear
;;  - Background
;;  - Empty image 

;; Changing:
;;  - Angle
;;  - position

;; Identify big-bang options
;;  - on-tick
;;  - to-draw
;;  - on-mouse
;; ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
;; Constants:
;; ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
(define WIDTH 400)
(define HEIGHT 600)
(define SPEED 1)
(define MTS (empty-scene WIDTH HEIGHT))
(define IMG-EMPTY (empty-scene 0 0))
(define IMG-BEAR .)
    
;; ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
;; Data Definitions:
;; ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
; ______________________________
;|Data definititon recipe HtDD  |
;|1. Structure definition       |
;|2. Type comment               |
;|3. Interpretation             |
;|4. Examples                   | 
;|5. A template                 |
;|6. Templates Rules used       |
;|______________________________|
;; ➽ Di --------------------------------------------
(define-struct bear (x y angle))
;; bear is (make-bear Number Number Number)
;; interp. (make-bear x y angle) is a bear with x and y coordinates and angle rotation
;;         X is the x or horizontal coordinates
;;         Y is the y or vertical coordinates
;;         angle is the angle rotation of the image
(define B1 (make-bear 0 0 0))
(define B2 (make-bear 20 20 30))
(define B3 (make-bear 15 60 20))

#;
(define (fn-for-bear b)
   (... (bear-x b)       
        (bear-y b)
        (bear-angle b)))    

;; Template rules used:
;; - compound: 3 fields
;; ✚ Df --------------------------------------------

;; ➽ Di --------------------------------------------
;; ListOfBear is one of:
;; - empty
;; - (cons bear ListOfBear)
;; interp. list of bears

(define LOB1 empty)
(define LOB2 (cons B1 empty))
(define LOB3 (cons B1 (cons B2 empty)))

#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)] 
        [else
         (... (fn-for-bear (first lob))
              (fn-for-lob (rest lob)))]))

;; Template rules used:
;; - one of: 2 cases
;; - atomic non-distinct: empty
;; - compound: (cons bear ListOfBear)
;; - Reference: (first lob) is Bear
;; - Self-reference: (rest lob) is ListOfBear
;; ✚ Df --------------------------------------------
;; ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
;; Functions:
;; ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  
;; ➽ BBi -------------------------------------------
;; Big-Bang
;; LisOfBear -> LisOfBear
;; start the world with (main empty)
;; 
(define (main lob)
  (big-bang lob                              ; LisOfBear
            (on-tick   spin-bears)          ; LisOfBear -> LisOfBear
            (to-draw   render-bears)         ; LisOfBear -> Image
           (on-mouse  handle-mouse)))        ; LisOfBear Integer Integer MouseEvent -> LisOfBear
; Big-bang other functions not used:
;            (stop-when ...)      ; WS -> Boolean
;            (on-mouse  ...)      ; WS Integer Integer MouseEvent -> WS
;            (on-key    ...)))    ; WS KeyEvent -> WS
;; ✚ BBf -------------------------------------------
; ______________________________
;|- HtDF Recipe                 |
;|1. Signature                  |
;|2. Purpose                    |
;|3. Stub                       | 
;|4. Examples                   | 
;|5. Code Body                  |
;|6. Test                       |
;|______________________________|         
;; ➽ Fi--------------------------------------------
;; LisOfBear -> LisOfBear
;; spin of the bears, adding the angle in the screen
(check-expect (spin-bears empty) empty)
(check-expect (spin-bears (cons (make-bear 0 0 0) empty))
              (cons (make-bear 0 0 (+ 0 SPEED)) empty))
(check-expect (spin-bears (cons (make-bear 10 20 5) (cons (make-bear 50 40 15) empty)))
              (cons (make-bear 10 20 (+ 5 SPEED)) (cons (make-bear 50 40 (+ 15 SPEED)) empty)))

;(define (spin-bears lob) lob) ; Stub 

; <Use template from ListOfBear>
(define (spin-bears lob)
  (cond [(empty? lob) empty] 
        [else
         (cons (spin-bear (first lob)) (spin-bears (rest lob)))]))
;; ✚ Ff--------------------------------------------
;; ➽ Fi--------------------------------------------
;; Bear -> Bear
;; spin a bear
(check-expect (spin-bear (make-bear 0 0 0)) (make-bear 0 0 (+ 0 SPEED)))
(check-expect (spin-bear (make-bear 20 50 10)) (make-bear 20 50 (+ 10 SPEED)))

;(define (spin-bear b) b) ;Stub

; <Use template from bear>
(define (spin-bear b)
   (make-bear (bear-x b)        
              (bear-y b)
              (+ (bear-angle b) SPEED))) 
;; ✚ Ff--------------------------------------------
;; ➽ Fi--------------------------------------------
;; LisOfBear -> Image
;; Render all the bears in the screen
(check-expect (render-bears empty) MTS)
(check-expect (render-bears (cons (make-bear 20 40 60) empty))
              (place-image (rotate (modulo 60 360) IMG-BEAR) 20 40 MTS))
(check-expect (render-bears (cons (make-bear 20 40 60) (cons (make-bear 70 80 90) empty)))
              (place-image (rotate (modulo 60 360) IMG-BEAR) 20 40
                           (place-image (rotate (modulo 90 360) IMG-BEAR) 70 80 MTS)))

;(define (render-bears lob) MTS) ; Stub 

; <Use template from ListOfBear>
(define (render-bears lob)
  (cond [(empty? lob) MTS] 
        [else
         (render-bear-img (first lob) (render-bears (rest lob)))]))
;; ✚ Ff--------------------------------------------
;; ➽ Fi--------------------------------------------
;; Bear -> Bear
;; place the bear with x y coordinate in the img formed
(check-expect (render-bear-img (make-bear 10 10 20) MTS)
              (place-image (rotate (modulo 20 360) IMG-BEAR) 10 10 MTS))

; (define (render-bear-img b img) MTS) ;Stub

; <Use Template from Bear>
(define (render-bear-img b img)
   (place-image (rotate (modulo (bear-angle b) 360) IMG-BEAR) (bear-x b) (bear-y b) img))
;; ✚ Ff--------------------------------------------
;; ➽ Fi--------------------------------------------
;; LisOfBear Integer Integer MouseEvent -> LisOfBear
;; When the mouse is clicked in the screen a new flower is added 

(define (handle-mouse lob x y me)
  (cond [(mouse=? me "button-down") (cons (make-bear x y 0) lob)]
        [else lob]))   
;; ✚ Ff--------------------------------------------
```
