;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1. List Mechanisms|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
