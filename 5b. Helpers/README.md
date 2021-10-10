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
## Laying out a List of Images
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
(check-expect (layout-images empty) BLANK)
(check-expect (layout-images (cons (rectangle 10 20 "solid" "blue")
                              (cons (rectangle 20 30 "solid" "red")
                                     empty)))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      BLANK))

;(define (layout-image loi) BLANK)) ;Stub

(define (layout-images loi)
  (cond [(empty? loi) BLANK]                   
        [else (beside (first loi)                 
                      (layout-images (rest loi)))]))
;; ListOfImage -> ListOfImage
;; sort images in increasing order of size
;; !!!
(define (sort-images loi) loi) ;Stub
```
## Operation on a List  
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
(check-expect (layout-images empty) BLANK)
(check-expect (layout-images (cons (rectangle 10 20 "solid" "blue")
                              (cons (rectangle 20 30 "solid" "red")
                                     empty)))
              (beside (rectangle 10 20 "solid" "blue")
                      (rectangle 20 30 "solid" "red")
                      BLANK))

;(define (layout-image loi) BLANK)) ;Stub

(define (layout-images loi)
  (cond [(empty? loi) BLANK]                   
        [else (beside (first loi)                 
                      (layout-images (rest loi)))]))
;; ListOfImage -> ListOfImage
;; sort images in increasing order of size
(check-expect (sort-images empty) empty)
(check-expect (sort-images (cons (rectangle 10 20 "solid" "blue")
                              (cons (rectangle 20 30 "solid" "red")
                                     empty)))
              (cons (rectangle 10 20 "solid" "blue")
                              (cons (rectangle 20 30 "solid" "red")
                                     empty)))

(check-expect (sort-images (cons (rectangle 20 30 "solid" "red")
                              (cons (rectangle 10 20 "solid" "blue")
                                     empty)))
              (cons (rectangle 10 20 "solid" "blue")
                              (cons (rectangle 20 30 "solid" "red")
                                     empty)))

;(define (sort-images loi) loi) ;Stub

(define (sort-images loi)
  (cond [(empty? loi) empty]                   
        [else (insert (first loi)                 
                   (sort-images (rest loi)))]))

;; Image ListOfImage -> ListOfImage
;; produce new list, with img in proper place in list( in increasin order of size)
;; !!!
(define (insert img) lst)  ;stub
```
## Domain Knowledge Shift  
```racket
;; Constants:

(define BLANK (square 0 "solid" "white"))
;; for testing:
(define I1 (rectangle 10 20 "solid" "blue"))
(define I2 (rectangle 20 30 "solid" "red"))
(define I3 (rectangle 30 40 "solid" "green"))
;; Data definitions:

;; ListOfImage is one of:
;; - empty
;; - (cons Image ListOfImage)
;; interp. An arbitrary number of images
(define LOI1 empty)
(define LOI2 (cons I1
                   (cons I2
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
(check-expect (arrange-images (cons I1 (cons I2 empty)))
              (beside I1 I2 BLANK))
(check-expect (arrange-images (cons I2 (cons I1 empty)))
              (beside I1 I2 BLANK))

;(define (arrange-images loi) BLANK) ; Stub

(define (arrange-image loi)
  (layout-images (sort-images loi)))

;; ListOfImage -> Image
;; place images beside each other in order of list
(check-expect (layout-images empty) BLANK)
(check-expect (layout-images (cons I1
                              (cons I2
                                     empty)))
              (beside I1
                      I2
                      BLANK))

;(define (layout-image loi) BLANK)) ;Stub

(define (layout-images loi)
  (cond [(empty? loi) BLANK]                   
        [else (beside (first loi)                 
                      (layout-images (rest loi)))]))
;; ListOfImage -> ListOfImage
;; sort images in increasing order of size
(check-expect (sort-images empty) empty)
(check-expect (sort-images (cons I1 (cons I2 empty)))
              (cons I1 (cons I2 empty)))

(check-expect (sort-images (cons I2 (cons I1 empty)))
              (cons I1 (cons I2 empty)))

(check-expect (sort-images (cons I3 (cons I1 (cons I2 empty))))
              (cons I1 (cons I2 (cons I3 empty))))
;(define (sort-images loi) loi) ;Stub

(define (sort-images loi)
  (cond [(empty? loi) empty]                   
        [else (insert (first loi)                 
                   (sort-images (rest loi)))]))

;; Image ListOfImage -> ListOfImage
;; produce new list, with img in proper place in loit( in increasin order of size)
;; ASSUME : loi is already sorted
(check-expect (insert I1 empty) (cons I1 empty))
(check-expect (insert I1 (cons I2 (cons I3 empty))) (cons I1 (cons I2 (cons I3 empty)))) 
(check-expect (insert I2 (cons I1 (cons I3 empty))) (cons I1 (cons I2 (cons I3 empty))))
(check-expect (insert I3 (cons I1 (cons I2 empty))) (cons I1 (cons I2 (cons I3 empty))))

;(define (insert img) loi)  ;stub

(define (insert img loi)
  (cond [(empty? loi) (cons img empty)]                   
        [else
         (if (larger? img (first loi))
             (cons (first loi)
                   (insert img (rest loi)))
             (cons img loi))]))

;; Image Image -> Boolean
;; produce true if img1 is larger than img2(byarea)
;; !!!
(define (larger? img1 img2) true)  ;Stub

```
## The Last Helper
```racket
;; Constants:

(define BLANK (square 0 "solid" "white"))
;; for testing:
(define I1 (rectangle 10 20 "solid" "blue"))
(define I2 (rectangle 20 30 "solid" "red"))
(define I3 (rectangle 30 40 "solid" "green"))
;; Data definitions:

;; ListOfImage is one of:
;; - empty
;; - (cons Image ListOfImage)
;; interp. An arbitrary number of images
(define LOI1 empty)
(define LOI2 (cons I1
                   (cons I2
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
(check-expect (arrange-images (cons I1 (cons I2 empty)))
              (beside I1 I2 BLANK))
(check-expect (arrange-images (cons I2 (cons I1 empty)))
              (beside I1 I2 BLANK))

;(define (arrange-images loi) BLANK) ; Stub

(define (arrange-images loi)
  (layout-images (sort-images loi)))

;; ListOfImage -> Image
;; place images beside each other in order of list
(check-expect (layout-images empty) BLANK)
(check-expect (layout-images (cons I1
                              (cons I2
                                     empty)))
              (beside I1
                      I2
                      BLANK))

;(define (layout-image loi) BLANK)) ;Stub

(define (layout-images loi)
  (cond [(empty? loi) BLANK]                   
        [else (beside (first loi)                 
                      (layout-images (rest loi)))]))
;; ListOfImage -> ListOfImage
;; sort images in increasing order of size
(check-expect (sort-images empty) empty)
(check-expect (sort-images (cons I1 (cons I2 empty)))
              (cons I1 (cons I2 empty)))

(check-expect (sort-images (cons I2 (cons I1 empty)))
              (cons I1 (cons I2 empty)))

(check-expect (sort-images (cons I3 (cons I1 (cons I2 empty))))
              (cons I1 (cons I2 (cons I3 empty))))
;(define (sort-images loi) loi) ;Stub

(define (sort-images loi)
  (cond [(empty? loi) empty]                   
        [else (insert (first loi)                 
                   (sort-images (rest loi)))]))

;; Image ListOfImage -> ListOfImage
;; produce new list, with img in proper place in loit( in increasin order of size)
;; ASSUME : loi is already sorted
(check-expect (insert I1 empty) (cons I1 empty))
(check-expect (insert I1 (cons I2 (cons I3 empty))) (cons I1 (cons I2 (cons I3 empty)))) 
(check-expect (insert I2 (cons I1 (cons I3 empty))) (cons I1 (cons I2 (cons I3 empty))))
(check-expect (insert I3 (cons I1 (cons I2 empty))) (cons I1 (cons I2 (cons I3 empty))))

;(define (insert img) loi)  ;stub

(define (insert img loi)
  (cond [(empty? loi) (cons img empty)]                   
        [else
         (if (larger? img (first loi))
             (cons (first loi)
                   (insert img (rest loi)))
             (cons img loi))]))

;; Image Image -> Boolean
;; produce true if img1 is larger than img2(byarea)
(check-expect (larger? (rectangle 3 4 "solid" "red") (rectangle 2 6 "solid" "red")) false)
(check-expect (larger? (rectangle 5 4 "solid" "red") (rectangle 2 6 "solid" "red")) true)
(check-expect (larger? (rectangle 3 5 "solid" "red") (rectangle 2 6 "solid" "red")) true)
(check-expect (larger? (rectangle 3 4 "solid" "red") (rectangle 5 6 "solid" "red")) false)
(check-expect (larger? (rectangle 3 4 "solid" "red") (rectangle 2 7 "solid" "red")) false)
              
;(define (larger? img1 img2) true)  ;Stub

(define (larger? img1 img2)
  (> (* (image-width img1) (image-height img1))
     (* (image-width img2) (image-height img2))))
```
