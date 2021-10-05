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
