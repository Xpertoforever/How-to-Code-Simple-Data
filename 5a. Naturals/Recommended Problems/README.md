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
## PROBLEM 2 Odd from Natural
 PROBLEM:  
  Design a function called odd-from-n that consumes a natural number n, and produces a list of all   
 the odd numbers from n down to 1.   
 
 Note that there is a primitive function, odd?, that produces true if a natural number is odd.   
 ```racket
 ;; Natural -> ListOfNatural
;; produce the odd list from the natural providen
(check-expect (odd-from-n 0) empty)
(check-expect (odd-from-n 3) (cons 3 (cons 1 empty)))
(check-expect (odd-from-n 6) (cons 5 (cons 3 (cons 1 empty))))

;(define (odd-from-n n) lon) ;Stub

(define (odd-from-n n)
  (cond [(zero? n) empty]
        [else
         (if (odd? n)
             (cons n (odd-from-n (sub1 n)))
             (odd-from-n (sub1 n)))]))

;;; Natural -> ListOfNatural
;;; produce the list of a odd natural numbers
;(check 
;
;(define (odd n) lob) ; Stub

 ```
