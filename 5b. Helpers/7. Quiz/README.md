## Design Quiz
```racket
(require 2htdp/image)
;; SPD2-Design-Quiz-1.rkt


;; ======================================================================
;; Constants
(define COOKIES .)

;; ======================================================================
;; Data Definitions

;; Natural is one of:
;;  - 0
;;  - (add1 Natural)
;; interp. a natural number
(define N0 0)         ;0
(define N1 (add1 N0)) ;1
(define N2 (add1 N1)) ;2

#;
(define (fn-for-natural n)
  (cond [(zero? n) (...)]
        [else
         (... n   ; n is added because it's often useful                   
              (fn-for-natural (sub1 n)))]))

;; Template rules used:
;;  - one-of: two cases
;;  - atomic distinct: 0
;;  - compound: 2 fields
;;  - self-reference: (sub1 n) is Natural
```
**PROBLEM 1:**     

Complete the design of a function called pyramid that takes a natural  
number n and an image, and constructs an n-tall, n-wide pyramid of  
copies of that image.  

For instance, a 3-wide pyramid of cookies would look like this:  

.  

```racket
;; Natural Image -> Image
;; produce an n-wide pyramid of the given image
(check-expect (pyramid 0 COOKIES) empty-image)
(check-expect (pyramid 1 COOKIES) COOKIES)
(check-expect (pyramid 2 COOKIES)
              (above COOKIES
                     (beside COOKIES COOKIES)))
(check-expect (pyramid 3 COOKIES)
              (above COOKIES                              ;1
                     (beside COOKIES COOKIES)             ;2
                     (beside COOKIES COOKIES COOKIES)))   ;3 

;(define (pyramid n i) empty-image) ; stub

(define (pyramid n i)
  (cond [(zero? n) empty-image]
        [else
         (above (pyramid (sub1 n) i)
                (beside-img n i))]))     

;; Natural Image -> Image
;; Put beside a number of image(same image) indicates
(check-expect (beside-img 0 COOKIES) empty-image)
(check-expect (beside-img 1 COOKIES) (beside COOKIES empty-image))
(check-expect (beside-img 2 COOKIES) (beside COOKIES COOKIES empty-image))
(check-expect (beside-img 3 COOKIES) (beside COOKIES COOKIES COOKIES empty-image))
              
; (define (beside-img n img) empty-image) ;Stub
(define (beside-img n img)
  (cond [(zero? n) empty-image]
        [else
         (beside COOKIES (beside-img (sub1 n) img))]))
```
**Problem 2:**    
Consider a test tube filled with solid blobs and bubbles.  Over time the  
solids sink to the bottom of the test tube, and as a consequence the bubbles  
percolate to the top.  Let's capture this idea in BSL.  

Complete the design of a function that takes a list of blobs and sinks each  
solid blob by one. It's okay to assume that a solid blob sinks past any  
neighbor just below it.  

To assist you, we supply the relevant data definitions.  

```racket
;; Blob is one of:
;; - "solid"
;; - "bubble"
;; interp.  a gelatinous blob, either a solid or a bubble
;; Examples are redundant for enumerations
#;
(define (fn-for-blob b)
  (cond [(string=? b "solid") (...)]
        [(string=? b "bubble") (...)]))

;; Template rules used:
;; - one-of: 2 cases
;; - atomic distinct: "solid"
;; - atomic distinct: "bubble"


;; ListOfBlob is one of:
;; - empty
;; - (cons Blob ListOfBlob)
;; interp. a sequence of blobs in a test tube, listed from top to bottom.
(define LOB0 empty) ; empty test tube
(define LOB2 (cons "solid" (cons "bubble" empty))) ; solid blob above a bubble
(define LOB3 (cons "solid" (cons "solid" (cons "bubble" empty))))

#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (fn-for-blob (first lob))
              (fn-for-lob (rest lob)))]))

;; Template rules used
;; - one-of: 2 cases
;; - atomic distinct: empty
;; - compound: 2 fields
;; - reference: (first lob) is Blob
;; - self-reference: (rest lob) is ListOfBlob

;; ListOfBlob -> ListOfBlob
;; produce a list of blobs that sinks the given solid blobs by one

(check-expect (sink empty) empty)

(check-expect (sink (cons "bubble" (cons "solid" (cons "bubble" empty))))
                    (cons "bubble" (cons "bubble" (cons "solid" empty))))

(check-expect (sink (cons "solid" (cons "solid" (cons "bubble" empty))))
                    (cons "bubble" (cons "solid" (cons "solid" empty))))

(check-expect (sink (cons "solid" (cons "bubble" (cons "bubble" empty))))
                    (cons "bubble" (cons "solid" (cons "bubble" empty)))) ;burda

(check-expect (sink (cons "solid" (cons "bubble" (cons "solid" empty))))
                    (cons "bubble" (cons "solid" (cons "solid" empty))))

(check-expect (sink (cons "bubble" (cons "solid" (cons "solid" empty))))
                    (cons "bubble" (cons "solid" (cons "solid" empty))))

(check-expect (sink (cons "solid" (cons "solid" (cons "bubble" (cons "bubble" empty)))))
                    (cons "bubble" (cons "solid"(cons "solid" (cons "bubble" empty)))))

;(define (sink lob) empty) ; stub
(define (sink lob)
  (cond [(empty? lob) empty]
        [else 
         (if (string=? (first lob) "bubble")                                 ;B
             (cons (first lob) (move-up-blob (rest lob)))                    ;B S B -> B B S) (B B S -> B B S) ( B B B -> BBB)
             (if (solid-bubble-blobs (rest lob))                             ; Solid  (S B)? ( B S ) ( B B ) 
                 (move-up-blob (cons (first lob) (move-up-blob (rest lob)))) ; ( S S B) ->  (B S S)
                                                                             ; ( S B S) ( S B B )
                 (move-up-blob lob)))]))

;; ListOfBlob -> ListOfBlob
;; Move the bubble up and the solid down comparing 2 elements according the configuration
(check-expect (move-up-blob (cons "solid" (cons "bubble" empty)))
                            (cons "bubble" (cons "solid" empty)))

(check-expect (move-up-blob (cons "bubble" (cons "solid" (cons "bubble" empty))))
                            (cons "bubble" (cons "solid" (cons "bubble" empty))))

(check-expect (move-up-blob (cons "solid" (cons "bubble" (cons "bubble" empty))))
                            (cons "bubble" (cons "solid" (cons "bubble" empty))))

(check-expect (move-up-blob (cons "solid" (cons "solid" (cons "bubble" empty))))
                            (cons "solid" (cons "solid" (cons "bubble" empty))))

(check-expect (move-up-blob (cons "bubble" (cons "bubble" (cons "solid" empty))))
                            (cons "bubble" (cons "bubble" (cons "solid" empty)))) 

; (define (move-up-blob lob) lob) 
(define (move-up-blob lob)
  (cond [(empty? lob) empty] 
        [else
         (if (solid-bubble-blobs lob)
             (cons (second lob) (cons (first lob) (rest (rest lob))))
             lob)]))


;; ListOfBlob -> Boolean
;; produce true if the first element is solid and the second is bubble

(check-expect (solid-bubble-blobs empty) false)
(check-expect (solid-bubble-blobs (cons "bubble" empty)) false)
(check-expect (solid-bubble-blobs (cons "solid" (cons "bubble" empty))) true)
(check-expect (solid-bubble-blobs (cons "solid" (cons "solid" (cons "bubble" empty)))) false)

;;(define (solid-bubble-blobs lob) false) ; Stub

(define (solid-bubble-blobs lob) 
  (cond [(empty? lob) false]
        [else
         (and (string=? (first lob) "solid") (string=? (second lob) "bubble"))]))   
```
