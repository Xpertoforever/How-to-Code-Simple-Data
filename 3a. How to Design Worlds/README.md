## The big-bang Mechanism  
The big-bang let us execute two or more functions together.   
```Racket  
If your program needs to:	 
Then it needs this option:   
change as time goes by (nearly all do)	on-tick   
display something (nearly all do)	      to-draw  
change in response to key presses	      on-key  
change in response to mouse activity  	on-mouse  
stop automatically	                    stop-when  
```
## Domain Analysis  

;Domain analysis (use a piece of paper!)  
;1. Sketch program scenarios  
;2. Identify constant information  
;3. Identify changing information  
;4. Identify big-bang options  

PROBLEM:  
Use the How to Design Worlds recipe to design an interactive  
program in which a cat starts at the left edge of the display   
and then walks across the screen to the right. When the cat  
reaches the right edge it should just keep going right off   
the screen.  

Once your design is complete revise it to add a new feature,  
which is that pressing the space key should cause the cat to  
go back to the left edge of the screen. When you do this, go  
all the way back to your domain analysis and incorporate the  
new feature.  

To help you get started, here is a picture of a cat, which we  
have taken from the 2nd edition of the How to Design Programs   
book on which this course is based.  

```Racket
;Domain analysis (use a piece of paper!)
;1. Sketch program scenarios
;2. Identify constant information
;3. Identify changing information
;4. Identify big-bang options

;; Sketch program

;; Constant:
;;  - width
;;  - height
;;  - Center-Y
;;  - mts: Backgroud
;;  - cat image

;; Changing:
;; - X coordinate of cat

;; Identify big-bang options
;; - on-tick
;; - to-draw
```
## Program Through main Functions   
- Using named constant provides a **single point of control**, changing HEIGHT also changes CTR-Y
- **Traceability** : the ability to see where each analysis element winds up in the resulting program.

**Very Important**  
Any program that has users will have to change  
Over time, users want new features, better performance, etc.   
**Being easy to change is one of the most important properties a program should have**  












