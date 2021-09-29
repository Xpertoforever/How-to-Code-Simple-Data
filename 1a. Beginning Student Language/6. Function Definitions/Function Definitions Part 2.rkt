;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Function Definitions Part 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; function-definitions-starter.rkt

;To form a function definition:

;(define (<Function_Name> <Parameter(s)> ...)
;        <Expression>)

(define (bulb c)
  (circle 40 "solid" c))

(bulb (string-append "re" "d"))



