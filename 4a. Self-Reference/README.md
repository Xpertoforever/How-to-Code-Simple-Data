# SELF-REFERENCE

## List Mechanisms  
We will learn how to make a list; how to get the first, second or rest or any other element from the list
```racket
(require 2htdp/image)

;empty
;
;(cons "Flames" empty)
;(cons "Leafs" (cons "Flames" empty))
;
;(cons (string-append "C" "anucks") empty)
;
;(cons 10 (cons 9 (cons 10 empty)))        ; a list of 3 elements
;
;(cons (square 10 "solid" "blue")
;      (cons (triangle 20 "solid" "green")
;            empty))

(define L1 (cons "Flames" empty))
(define L2 (cons "Leafs" (cons "Flames" empty)))
(define L3 (cons (square 10 "solid" "blue")
      (cons (triangle 20 "solid" "green")
            empty)))
; Cons a two arguments constructor
; first selects the first element of a list
; rest consumes a list with at least one element and produce
;;     the list after the first element
;; Selectors 
(first L1)
(first L2)
(first L3)

(rest L1)
(rest L2)
(rest L3)

(... L2)  ;How do I get the second element of L2
(first (rest L2))

(... L2) ;How do I get the thrid element
(first (rest (rest L2)))

(empty? empty)
(empty? L1)
(empty? 1)

```
## List Data Definition
```racket
;; ListOfString is one of:
;; - empty
;; - (cons String ListOfString)
;; interp. a list of strings
(define LOS1 empty)
(define LOS2 (cons "McGill" empty))
(define LOS3 (cons "UBC" (cons "McGill" empty)))

(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (first los)     ; String
              (fn-for-los (rest los )))])) ; ListOfString

;; Template rules used:
;; -one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons String ListOfString)  
;; - !!! Coming Soon !!!
```
