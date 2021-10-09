## Function Composition  
**PROBLEM:**    
In this problem imagine you have a bunch of pictures that you would like to   
store as data and present in different ways. We'll do a simple version of that   
here, and set the stage for a more elaborate version later.  

(A) Design a data definition to represent an arbitrary number of images.  

(B) Design a function called arrange-images that consumes an arbitrary number  
    of images and lays them out left-to-right in increasing order of size.  
    
```racket
;; Constants:

(defin BLANK (square 0 "solid" "white"))
;; Data definitions:

;; ListOfImage is one of:
;; - empty
;; - (cons Image ListOfImage)
;; interp. An arbitrary number of images
(define LOI1 empty)
(define LOI2 (cons (rectangle 10 20 "solid" "blue")
                   (cons (rectangle 20 30 "solid" "red")
                         empty)))

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]                   
        [else (... (first loi)                 
                   (fn-for-loi (rest loi)))]))

;; Functions:

;; ListOfImage -> Image
;; lay out images left to right in increasing order of size
;; sort images in increasing order of size and then lay them out left to right
(check-expect (arrange-images empty) BLANK)
(check-expect (arrange-images (cons (rectangle 10 20 "solid" "blue")
                              (cons (rectangle 20 30 "solid" "red")
                                     empty))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      BLANK)))
(check-expect (arrange-images (cons (rectangle 20 30 "solid" "red")
                              (cons (rectangle 10 20 "solid" "blue")
                                     empty))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      BLANK)))

;(define (arrange-images loi) BLANK) ; Stub

(define (arrange-image loi)
  (layout-images (sort-images loi)))

;; ListOfImage -> Image
;; place images beside each other in order of list
;; !!!
(define (layout-image loi) BLANK)) ;Stub

;; ListOfImage -> ListOfImage
;; sort images in increasing order of size
;; !!!
(define (sort-images loi) loi) ;Stub
```
