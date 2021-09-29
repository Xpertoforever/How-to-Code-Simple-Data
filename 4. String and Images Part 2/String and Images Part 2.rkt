;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |String and Images Part 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image);it tells to DrRacket
;;we want to use the image functions from the
; 2nd edition of the how to Design Program book

;(circle 10 "solid" "red"); (circle radius "solid" "color")
;(circle 20 "solid" "green")
;(circle 50 "solid" "black")
;(circle 30 "outline" "purple")

;(define x "blue")
;(circle 30 "outline" x)


;(rectangle 30 60 "outline" "black")
;(rectangle 60 20 "solid" "yellow")
;(rectangle 40 40 "solid" "blue")
;(rectangle witdh heigh "atribute" "colour")

;(text "Sample" 30 "blue")
;(text "SAMPLE" 50 "purple")

;(above (circle 10 "solid" "black")
;       (circle 10 "solid" "red")
;       (circle 10 "solid" "blue"))
(above (rectangle 10 10 "solid" "blue")
       (rectangle 10 10 "solid" "black")
       (rectangle 10 10 "solid" "red"))

(beside (circle 10 "solid" "black")  
       (circle 10 "solid" "red")  
       (circle 10 "solid" "blue"))

(overlay (circle 5 "solid" "black")  
       (circle 10 "solid" "red")  
       (circle 20 "solid" "blue"))  
       
