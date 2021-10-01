### PROBLEM 1:  
DESIGN function that consumes a string and determines whether its length is  
less than 5.  Follow the HtDF recipe and leave behind commented out versions    
of the stub and template.  
```racket
;; String -> Boolean  ;Signature
;; produce true if the string leght is less than 5  ;Purpose
(check-expect (less-than-5? "") true) ;Examples
(check-expect (less-than-5? "abc") true)
(check-expect (less-than-5? "12345") false)
(check-expect (less-than-5? "danielson") false)

;(define (less-than-5? s) true) ;Stub

;(define (less-than-5? s)  ;Template
;        (... s))

;(define (less-than-5? s)  ;Code body
;        (if (< (string-length s) 5)
;            true
;            false))

(define (less-than-5? s)  ;Code body
        (< (string-length s) 5)
```

### PROBLEM 2:  
Use the How to Design Functions (HtDF) recipe to design a function that consumes an image,    
and appears to put a box around it. Note that you can do this by creating an "outline"   
rectangle that is bigger than the image, and then using overlay to put it on top of the image.   
For example:  

```racket
;; Image -> Image  ;Signature
;; put inside an empty box around the image given  ;Purpose

(check-expect (boxify (circle 10 "solid" "red"))             ;Example
                      (overlay (rectangle 20 20 "outline" "black")
                               (circle 10 "solid" "red")))

(check-expect (boxify (star 40 "solid" "gray"))            ;Example
                      (overlay (rectangle 65 62 "outline" "black")
                               (star 40 "solid" "gray")))

;(define (boxify image) image-box) ;Stub

;(define (boxify image)  ;Template
;        (... image-box))

(define (boxify image)  ;Code body
        (overlay (rectangle (image-width image)
                            (image-height image)
                            "outline"
                            "black")
                 image))

(boxify (circle 10 "solid" "red"))   
(boxify (star 40 "solid" "gray"))
;(star 40 "solid" "gray")
;(image-height (star 40 "solid" "gray")) = 62
;(image-width (star 40 "solid" "gray")) = 65
```
