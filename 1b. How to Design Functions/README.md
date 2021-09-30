# Full Speed HtDF Recipe

## **Recipe HtDF**  
How To Design Functions (HtDF)
1. Signature, purpose and stub.
2. Define examples, wrap each in check-expect.
3. Template and inventory.
4. Code the function body.
5. Test and debug until correct

**How To Design Functions (HtDF) SHORT RECIPE**  
Recipe HtDF  
1. Signature
2. Purpose
3. Stub
4. Examples
5. Template
6. Body
7. Test  

**Example 1**  
Design a function that consume a number and produce twice that number. Call the function double.  
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

**Example 2 - Yell**  
DESIGN a function called yell that consumes strings like "hello" and adds "!" to produce strings like "hello!". Remember, when we say DESIGN, we mean follow the recipe. 
Leave behind commented out versions of the stub and template.  
```racket
;; String -> String  ;Signature
;; add "!" in the end of the given string ;Purpose
(check-expect (yell "Hello") "Hello!")  ;Examples
(check-expect (yell "abd") "abd!")

;(define (yell str) "")  ;Stub

;(define (yell str)  ;Template
;        (... str))

(define (yell str)  ;Code Body
        (string-append str "!"))

(yell "Wow")
```
**Example 3 - Area**  
PROBLEM:  
DESIGN a function called area that consumes the length of one side of a square and produces the area of the square. 
Remember, when we say DESIGN, we mean follow the recipe. Leave behind commented out versions of the stub and template.  
```racket
;; Number -> Number ;Signature
;; multiply the given number by itself ;Purpose
(check-expect (area 2) (* 2 2)) ;Examples
(check-expect (area 2.2) (* 2.2 2.2))

;(define (area s) 0) ;Stub

;(define (area s) ;template
;        (... s))

(define (area s) ;Body
        (sqr s))

(area 4)
```
