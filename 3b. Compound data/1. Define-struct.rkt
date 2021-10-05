;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1. Define-struct|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define-struct pos(x y))

;(make-pos 5 7) ;constructor
(define P1 (make-pos 5 7))
(define P2 (make-pos 2 8))

(pos-x P2) ;Selector
(pos-y P1)

(pos? P1) ;predicate
(pos? "Hello")

;To Form a Structure definition
; (define-struct <name_struct> (<name_field> ...))
; name_struct : Structure name
; name_fied: field names

; A structure definition define
; constructor : make-<structure-name>
; selector(s): <structure-name>-<field-name>
; predicate: <structure-name?>

;(define-struct pos(x y))
;make-pos ;constructor
;pos-x pos-y ;selectors
;pos? ;predicate
