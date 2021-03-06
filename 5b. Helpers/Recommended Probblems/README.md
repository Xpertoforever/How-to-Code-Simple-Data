## RECOMMENDED PROBLEM :  
Design a simple interactive animation of rain falling down a screen. Wherever we click,  
a rain drop should be created and as time goes by it should fall. Over time the drops  
will reach the bottom of the screen and "fall off". You should filter these excess  
drops out of the world state - otherwise your program is continuing to tick and  
and draw them long after they are invisible.  

In your design pay particular attention to the helper rules. In our solution we use  
these rules to split out helpers:  
  - function composition  
  - reference  
  - knowledge domain shift  
    
NOTE: This is a fairly long problem.  While you should be getting more comfortable with   
world problems there is still a fair amount of work to do here. Our solution has 9  
functions including main. If you find it is taking you too long then jump ahead to the  
next homework problem and finish this later.  
```racket
;; Make it rain where we want it to.
(require 2htdp/image)
(require 2htdp/universe)

;; =================
;; Constants:

(define WIDTH  300)
(define HEIGHT 300)

(define SPEED 1)

(define DROP (ellipse 4 8 "solid" "blue"))

(define MTS (rectangle WIDTH HEIGHT "solid" "light blue"))

;; =================
;; Data definitions:

(define-struct drop (x y))
;; Drop is (make-drop Integer Integer)
;; interp. A raindrop on the screen, with x and y coordinates.

(define D1 (make-drop 10 30))

#;
(define (fn-for-drop d)
  (... (drop-x d) 
       (drop-y d)))

;; Template Rules used:
;; - compound: 2 fields


;; ListOfDrop is one of:
;;  - empty
;;  - (cons Drop ListOfDrop)
;; interp. a list of drops

(define LOD1 empty)
(define LOD2 (cons (make-drop 10 20) (cons (make-drop 3 6) empty)))

#;
(define (fn-for-lod lod)
  (cond [(empty? lod) (...)]
        [else
         (... (fn-for-drop (first lod))
              (fn-for-lod (rest lod)))]))

;; Template Rules used:
;; - one-of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Drop ListOfDrop)
;; - reference: (first lod) is Drop
;; - self reference: (rest lod) is ListOfDrop

;; =================
;; Functions:

;; ListOfDrop -> ListOfDrop
;; start rain program by evaluating (main empty)
(define (main lod)
  (big-bang lod
            (on-mouse handle-mouse)   ; ListOfDrop Integer Integer MouseEvent -> ListOfDrop
            (on-tick  next-drops)     ; ListOfDrop -> ListOfDrop
            (to-draw  render-drops))) ; ListOfDrop -> Image

;; ListOfDrop Integer Integer MouseEvent -> ListOfDrop
;; if mevt is "button-down" add a new drop at that position
;; !!!
;(define (handle-mouse lod x y mevt) empty) ; stub

(define (handle-mouse lod x y me)
  (cond [(mouse=? me "button-down") (cons (make-drop x y) lod)]
        [else lod]))   

;; ListOfDrop -> ListOfDrop 
;; produce filtered and ticked list of drops
(check-expect (next-drops empty) empty)
(check-expect (next-drops (cons (make-drop 20 40) empty)) (cons (make-drop 20 (+ 40 SPEED)) empty))
(check-expect (next-drops (cons (make-drop 40 50) (cons (make-drop 100 200) empty)))
                          (cons (make-drop 40 (+ 50 SPEED)) (cons (make-drop 100 (+ 200 SPEED)) empty)))
                                
(check-expect (next-drops (cons (make-drop 20 300) empty)) empty)
(check-expect (next-drops (cons (make-drop 20 300) (cons (make-drop 20 40) empty)))
                          (cons (make-drop 20 (+ 40 SPEED)) empty))

;(define (next-drops lod)empty) ; stub

(define (next-drops lod)
  (advance-drops (filter-drops lod)))

;; ListOfDrop -> ListOfDrop 
;; advance each drop by the speed
(check-expect (advance-drops empty) empty)
(check-expect (advance-drops (cons (make-drop 20 40) empty)) (cons (make-drop 20 (+ 40 SPEED)) empty)) 

; (define (advance-drops lod) lod) ; Stub

(define (advance-drops lod)
  (cond [(empty? lod) empty]
        [else
         (cons (add-pos-drop (first lod)) (advance-drops (rest lod)))])) 

;; Drop -> Drop
;; add the speed to incress the postion of the drop
(check-expect (add-pos-drop (make-drop 20 40)) (make-drop 20 (+ 40 SPEED)))

; (define (add-pos d) d) ;Stub
(define (add-pos-drop d)
  (make-drop (drop-x d) (+ (drop-y d) SPEED))) 

;; ListOfDrop -> ListOfDrop
;; filter the drops who passed the limit screen
(check-expect (filter-drops empty) empty)
(check-expect (filter-drops (cons (make-drop 20 40) empty)) (cons (make-drop 20 40) empty))
(check-expect (filter-drops (cons (make-drop 40 50) (cons (make-drop 100 200) empty))) 
                            (cons (make-drop 40 50) (cons (make-drop 100 200) empty)))

(check-expect (filter-drops (cons (make-drop 20 300) empty)) empty)
(check-expect (filter-drops (cons (make-drop 20 300) (cons (make-drop 20 40) empty)))
                            (cons (make-drop 20 40) empty)) 

;(define (filter-drops lod) lod) ; Stub

(define (filter-drops lod)
  (cond [(empty? lod) empty]
        [else 
         (take-drop (first lod) (filter-drops (rest lod)))])) ; (filter-drops (rest lod))]))

;; Drop ListOfDrop -> ListOfDrop
;; Take it when the drop is on the limit
;(check-expect (take-drop empty empty) empty)
(check-expect (take-drop (make-drop 20 40) (cons (make-drop 20 40) empty)) 
                         (cons (make-drop 20 40) (cons (make-drop 20 40) empty))) 

(check-expect (take-drop (make-drop 20 20) empty)
                         (cons (make-drop 20 20) empty)) 

(check-expect (take-drop (make-drop 20 300) empty)
                          empty)

(check-expect (take-drop (make-drop 20 300) (cons (make-drop 20 300) empty))
                         (cons (make-drop 20 300) empty))

(check-expect (take-drop (make-drop 20 300) (cons (make-drop 20 300) (cons (make-drop 20 40) empty)))
                            (cons (make-drop 20 300) (cons (make-drop 20 40) empty))) 

; (define (take-drop d lod) lod) ;Stub
(define (take-drop d lod) 
  (cond [(empty? lod)
         (if (on-the-limit? d)
             (cons d empty)
              empty)] 
        [else
         (if (on-the-limit? d) 
             (cons d (take-drop (first lod) (rest lod)))
              lod)])) 

;; Drop -> Boolean
;; produce true if the drop is on the limit
(check-expect (on-the-limit? (make-drop 20 300)) false)
(check-expect (on-the-limit? (make-drop 20 200)) true)

;(define (on-the-limit? d) true) ;Stub

(define (on-the-limit? d)
  (< (drop-y d) 300))

;; ListOfDrop -> Image
;; Render the drops onto MTS
(check-expect (render-drops empty) MTS)
(check-expect (render-drops (cons (make-drop 20 20) empty))
              (place-image DROP 20 20 MTS)) 
                            

;(define (render-drops lod) MTS) ; stub

(define (render-drops lod)
  (cond [(empty? lod) MTS]
        [else
         (render-drop (first lod) (render-drops (rest lod)))]))

;; Drop -> Image
;; render a drop in the position
(check-expect (render-drop (make-drop 20 20) MTS) (place-image DROP 20 20 MTS))

;(define (render-drop d) MTS) ;Stub

(define (render-drop d img)
  (place-image DROP (drop-x d) (drop-y d) img))
```
