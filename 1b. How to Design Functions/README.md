# Full Speed HtDF Recipe

## **Recipe HtDF**  
How To Design Functions (HtDF)
1. Signature, purpose and stub.
2. Define examples, wrap each in check-expect.
3. Template and inventory.
4. Code the function body.
5. Test and debug until correct

i.g.
```racket
;; Number -> Number                  ;Signature
;; produce 2 times the given number  ;Purpose
(check-expect (double 3) 6)          ;Examples/Tests
(check-expect (double 4.2) 8.4)

;(define (double n) 0)               ;Stub 

;(define (double n)                  ;Template
;        (... n))

(define (double n)                   ;Body
        (* 2 n))
```
