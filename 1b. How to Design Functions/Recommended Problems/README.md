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
