;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Booleans and if Expressions Part 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;There are 2 boolean values
;true
;false

(define WIDTH 100)
(define HEIGHT 100)

;(> WIDTH HEIGHT)
;(>= WIDTH HEIGHT)
;;Predicates are primitives or functions
;;that produce a boolean value (true or false)

;(= 1 2)
;(= 1 1)
;(> 3 9)

;(string=? "foo" "bar")
;(string=? "abc" "abc")

(define I1 (rectangle 10 20 "solid" "red"))
(define I2 (rectangle 20 10 "solid" "blue"))

(< (image-width I1)
   (image-width I2))
