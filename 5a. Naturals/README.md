## Natural Number  
;; add1 produce a natural 1 bigger
;; sub1 produce a natural 1 smaller
```racket
(add1 0)
(add1 (add1 0))
(sub1 2)
(sub1 (sub1 2))
```
**PROBLEM**  
Now that we understand how to form data definitions for abitrary-sized data we can   
look at how to design functions that "count down" on natural numbers.  Here's the   
key inight - ask yourself how many natural numbers are there?  

A lot, many... an arbitrary number:  

0                      ;0  
(add1 0)               ;1  
(add1 (add1 0))        ;2  
(add1 (add1 (add1 0))) ;3  

and so on  

What that is saying is that (add1 <some natural>) produces a natural,   
similarly (sub1 <some natural other than 0>) produces a natural.  

So add1 is kind of like cons, it takes a natural and makes a bigger one   
(cons makes a longer list). And sub1 is kind of like rest it takes a natural  
(other than 0) and gives the next smallest one (rest gives shorter list).  
                                                                      
Consider this type comment: 
  
```racket  
;; Natural is one of:
;;  - 0
;;  - (add1 Natural)
;; interp. a natural number
(define N0 0)         ;0
(define N1 (add1 N0)) ;1
(define N2 (add1 N1)) ;2

(define (fn-for-natural n)
  (cond [(zero? n) (...)]
        [else
         (... ;n                           ;template rules wouldn't normally put this
          ;                            ;here, but we will see that we end up coming
          ;                            ;back to add it
          (fn-for-natural (sub1 n)))]))

;; Template rules used:
;;  - one-of: two cases
;;  - atomic distinct: 0
;;  - compound: (add1 Natural)
;;  - self-reference: (sub1 n) is Natural
```
  
**PROBLEMs:**    

(A) Design a function that consumes Natural number n and produces the sum of all  
    the naturals in [0, n].  
    
(B) Design a function that consumes Natural number n and produces a list of all  
    the naturals of the form (cons n (cons n-1 ... empty)) not including 0.  
    
```racket    
;; Natural -> Natural
;; produce sum of Natural[0, n]
(check-expect (sum 0) 0)
(check-expect (sum 1) 1)
(check-expect (sum 3) (+ 3 2 1 0))

;(define (sum n) 0) ;Stub 

(define (sum n)
  (cond [(zero? n) 0]
        [else
         (+ n (sum (sub1 n)))]))

;; Natural -> ListOfNatural
;; produce (cons n (cons n-1 .... empty); not including 0
;; Comsume a number a produce a list of them decressing by 1 until 1
(check-expect (list-number 0) empty)
(check-expect (list-number 3) (cons 3 (cons 2 (cons 1 empty))))

; (define (list-number n) lob) ;Stub

(define (list-number n)
  (cond [(zero? n) empty]
        [else
         (cons n  (list-number(sub1 n)))]))
    
```
## A Parlor Trick  
**PROBLEM:**  

Your friend has just given you a new pad, and it runs a prototype version of Racket.   

This is great, you can make it do anything. There's just one problem, this version of   
racket doesn't include numbers as primitive data. There just are no numbers in it!  

But you need natural numbers to write your next program.  

No problem you say, because you remember the well-formed self-referential data definition   
for Natural, as well as the idea that add1 is kind of like cons, and sub1 is kind of like  
rest. Your idea is to make add1 actually be cons, and sub1 actually be rest...  
```racket
;; NATURAL is one of:
;; - empty
;; - (cons "!" NATURAL)
;; interp. a natural number, the number of "!" in the list is the number
(define N0 empty)          ;0
(define N1 (cons "!" N0))  ;1
(define N2 (cons "!" N1))  ;2
(define N3 (cons "!" N2))  ;3
(define N4 (cons "!" N3))  ;4
(define N5 (cons "!" N4))  ;5
(define N6 (cons "!" N5))  ;6
(define N7 (cons "!" N6))  ;7
(define N8 (cons "!" N7))  ;8
(define N9 (cons "!" N8))  ;9

;; These are the primitives that operate NATURAL:
(define (ZERO? n) (empty? n))   ;Any         -> Boolean
(define (ADD1 n) (cons "!" n))  ;NATURAL     -> NATURAL
(define (SUB1 n) (rest n))      ;NATURAL[>0] ->NATURAL

(define (fn-for-NATURAL n)
  (cond [(ZERO? n) (...)]
        [else
         (... n
              (fn-for-NATURAL (SUB1 n)))]))

;; NATURAL NATURAL -> NATURAL
;; produce a + b
(check-expect (ADD N2 N0) N2)
(check-expect (ADD N0 N3) N3)
(check-expect (ADD N3 N4) N7)

;(define (ADD a b) N0)) ; Stub 

(define (ADD a b)
  (cond [(ZERO? b) a]
        [else
         (ADD (ADD1 a)
              (SUB1 b))]))

;; NATURAL NATURAL -> NATURAL
;; produce a - b
(check-expect (SUBTRACT N2 N0) N2)
(check-expect (SUBTRACT N6 N2) N4)

;(define (SUBTRACT a b) N0) ;Stub

; template on b
(define (SUBTRACT a b)
  (cond [(ZERO? b) a]
        [else
         (SUBTRACT (SUB1 a)
                   (SUB1 b))]))


  
```

  
