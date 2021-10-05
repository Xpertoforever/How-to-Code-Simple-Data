## PROBLEM 1    
PROBLEM:  
Design an animation of a simple countdown.   
Your program should display a simple countdown, that starts at ten, and  
decreases by one each clock tick until it reaches zero, and stays there.  
To make your countdown progress at a reasonable speed, you can use the   
rate option to on-tick. If you say, for example,   
(on-tick advance-countdown 1) then big-bang will wait 1 second between   
calls to advance-countdown.  
Remember to follow the HtDW recipe! Be sure to do a proper domain   
analysis before starting to work on the code file.  
Once you are finished the simple version of the program, you can improve  
it by reseting the countdown to ten when you press the spacebar.  

```racket
(require 2htdp/image)
(require 2htdp/universe)
;; A countdown from 10 to 0

;; ==================================================
;; Constants:
(define WIDTH 50)
(define HEIGHT 50)
(define MTS (empty-scene WIDTH HEIGHT))
(define TEXT-SIZE 30)
(define TEXT-COLOUR "black")
    
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

;; Countdown is Natural[1, 10]
;; interp. currently second left for the countdown
(define cd1 0)
(define cd2 5)
(define cd3 10)
#;
(define (fn-for-countdown cd)
        (... cd))

;; Template rules used:
;; - Atomic Non-Distinct: Natural[1, 10]

;; ==================================================
;; Functions:
;; --------------------------------------------------
;; Big-Bang

;; Countdown -> Countdown
;; start the world with (main 10)
;; 
(define (main cd)
  (big-bang cd                                    ; Countdown
            (on-tick   advance-countdown 1)       ; Countdown -> Countdown
            (to-draw   render)                    ; Countdown -> Image
            (on-key    handle-key)))              ; Countdown KeyEvent -> Countdown
;; Big-bang more options not used     
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
;; Countdown -> Countdown
;; produce the next Countdown number decreasing 1 unit
(check-expect (advance-countdown 10) 9)
(check-expect (advance-countdown 5) 4)
(check-expect (advance-countdown 0) 0)

;(define (advance-countdown cd) 0) ;Stub

; <Use template from Countdown>
(define (advance-countdown cd)
        (if (and (> cd 0) (<= cd 10)) 
           (- cd 1)
            0 ))
        
;; --------------------------------------------------
;; Function 2
;; Countdown -> Image
;; render correct countdown number 
(check-expect (render 10)
              (overlay (text (number->string 10) TEXT-SIZE TEXT-COLOUR)
                       MTS))
(check-expect (render 0)
              (overlay (text (number->string 0) TEXT-SIZE TEXT-COLOUR)
                       MTS))
; (define (render cd) MTS) ;Stub

; <Use template from Countdown>
(define (render cd)
        (overlay (text (number->string cd) TEXT-SIZE TEXT-COLOUR) MTS))            
;; --------------------------------------------------          
;; Function 3
;; KeyEvent -> Countdown
;; reset countdown to the beggining the number 10
(check-expect (handle-key 10 " ") 10)
(check-expect (handle-key 0 "a") 0)
(check-expect (handle-key 0 " ") 10)
(check-expect (handle-key 0 "a") 0)

;(define (handle-key cd ke) 0) ;stub

(define (handle-key c ke)
  (cond [(key=? ke " ") 10]
        [else c]))
```

## PROBLEM 2 - Simple version  
PROBLEM:  
Design an animation of a traffic light.   
Your program should show a traffic light that is red, then green,   
then yellow, then red etc. For this program, your changing world   
state data definition should be an enumeration.  
Here is what your program might look like if the initial world   
state was the red traffic light:  
.  
Next:    
.  
Next:  
.  
Next is red, and so on.  

To make your lights change at a reasonable speed, you can use the   
rate option to on-tick. If you say, for example, (on-tick next-color 1)   
then big-bang will wait 1 second between calls to next-color.  

Remember to follow the HtDW recipe! Be sure to do a proper domain   
analysis before starting to work on the code file.  

Note: If you want to design a slightly simpler version of the program,  
you can modify it to display a single circle that changes color, rather  
than three stacked circles.   

```racket
(require 2htdp/image)
(require 2htdp/universe)

;; A traffic Light 

;; ==================================================
;; Constants:
(define WITDH 40)
(define HEIGHT 40)
(define MTS (empty-scene WITDH HEIGHT))
(define CIRCLE-R 15)
(define LIGHT-RED (overlay (circle CIRCLE-R "solid" "red") MTS))
(define LIGHT-YELLOW (overlay (circle CIRCLE-R "solid" "yellow") MTS))
(define LIGHT-GREEN (overlay (circle CIRCLE-R "solid" "green") MTS))
    
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

;; Trafficlignt is one of:
;; - "red"
;; - "yellow"
;; - "red"
;; Interp. the light of a traffic light
;; <examples are redundant for enumerations>

;#
(define (fn-for-trafficlight tl)
  (cond [(string=? tl "red") (...)]
        [(string=? tl "yellow") (...)]
        [(string=? tl "green") (...)]))

;; Template rules used:
;; - one of 3 cases:
;; - Atomic distinct value: "red" "yellow" "green"

;; ==================================================
;; Functions:
;; --------------------------------------------------
;; Big-Bang

;; TrafficLight -> TrafficLight
;; start the world with (main "red")
;; 
(define (main tl)
  (big-bang tl                     ; Trafficlight
            (on-tick   next-light 4)       ; Trafficlight -> Trafficlight
            (to-draw   render)))   ; Trafficlight -> Image
     
;;Big-bang more options not used:    
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
;; Trafficlight -> Trafficlight
;; produce the next traffic light 
(check-expect (next-light "green") "yellow")
;(define (next-light tl) MTS) ;stub

;<Use template from Trafficlight>
(define (next-light tl)
  (cond [(string=? tl "red") "green"]
        [(string=? tl "yellow") "red"]
        [(string=? tl "green") "yellow"]))

;; --------------------------------------------------
;; Function 2
;; Trafficlight -> Image
;; render the corresponding traffic light
(check-expect (render "red" ) LIGHT-RED)

;(define (render lt) MTS)

(define (render tl)
  (cond [(string=? tl "red") LIGHT-RED]
        [(string=? tl "yellow") LIGHT-YELLOW]
        [(string=? tl "green") LIGHT-GREEN]))
            
;; -------------------------------------------------- 

```
