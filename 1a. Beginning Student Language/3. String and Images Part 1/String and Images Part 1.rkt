;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |String and Images Part 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; To form a String
;"String" ; a expression between double quote
;"apple"
;"Ada"

;(string-append "Ada" "Lovelace")
;string-appen put one or more strings one after the other in a single string

;(string-append "Ada" " " "Lovelace")

;> Observation
;123 ; this is a number
;"123" ; this is a string

(string-length "123456")
(substring "012345678" 2 5) ; 0-based index