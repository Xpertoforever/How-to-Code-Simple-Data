;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |2. cond Expressions Part 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(cond [(> 1 2) "bigger"]
      [(= 1 2) "equal"]
      [(< 1 2) "smaller"]

(cond [false  "bigger"]
      [(= 1 2) "equal"]
      [(< 1 2) "smaller"]

(cond [(= 1 2) "equal"]
      [(< 1 2) "smaller"]

(cond [false "equal"]
      [(< 1 2) "smaller"]

(cond [(< 1 2) "smaller"]

(cond [true "smaller"]

"smaller"      