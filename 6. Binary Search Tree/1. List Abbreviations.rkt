;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |1. List Abbreviations|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Introduction to list
;(cons "a" (cons "b" (cons "c" empty)))
;(list "a" "b" "c")
;(list (+ 1 2) (+ 3 4) (+ 5 6))

;; Adding elements into a list
(define L1 (list "b" "c"))
(define L2 (list "d" "e" "f"))

;(cons "a" L1)
;(list "a" L1)
;(list L1 L2)

;; append
(append L1 L2)
(cons "a" (cons "b" (cons "c" empty)))
(list "a" "b" "c")
