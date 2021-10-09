## PROBLEM 1: Decreasing Natural  
 PROBLEM:  
 Design a function called decreasing-image that consumes a Natural n and produces an image of all the numbers   
 from n to 0 side by side.   
 
 So (decreasing-image 3) should produce .  
 ```racket
 (require 2htdp/image)
;; ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
;; Constants:
;; ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
(define TEXT-HEIGHT 30)
(define TEXT-COLOR "black")
(define SPACING (text " " TEXT-HEIGHT TEXT-COLOR))
;; ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
;; Functions:
;; ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
;; ➽ Fi--------------------------------------------
;; Natural -> Image
;; produce the images of all the number until zero, from the providen number
(check-expect (decreasing-image 0) (text (number->string 0) TEXT-HEIGHT TEXT-COLOR))
(check-expect (decreasing-image 2)
              (beside (text (number->string 2) TEXT-HEIGHT TEXT-COLOR)
                      (text " " TEXT-HEIGHT TEXT-COLOR)
                      (text (number->string 1) TEXT-HEIGHT TEXT-COLOR)
                      (text " " TEXT-HEIGHT TEXT-COLOR)
                      (text (number->string 0) TEXT-HEIGHT TEXT-COLOR)))

;(define (decreasing-image n) (text n 10 "black")) ;Stub

(define (decreasing-image n)
  (cond [(zero? n) (text (number->string 0) TEXT-HEIGHT TEXT-COLOR)]
        [else
         (beside (natural-image n) (text " " TEXT-HEIGHT TEXT-COLOR) (decreasing-image (sub1 n)))]))
;; ✚ Ff--------------------------------------------
;; ➽ Fi--------------------------------------------
;; Natural -> Image
;; produce the image text of the natural number
(check-expect (natural-image 0) (text (number->string 0) TEXT-HEIGHT TEXT-COLOR)) 
(check-expect (natural-image 5) (text (number->string 5) TEXT-HEIGHT TEXT-COLOR))

;(define (natural-image n) (text n 10 "black")) ;Stub
(define (natural-image n)
  (text (number->string n) TEXT-HEIGHT TEXT-COLOR))
;; ✚ Ff--------------------------------------------
 ```
