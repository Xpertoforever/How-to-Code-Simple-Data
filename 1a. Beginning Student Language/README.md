# Expression
## Expression Part 1/2
### To form an expression
The starter file for this video is pythag-starter.rkt
* < Value >
* < primitive > < expression > ...

### Vocabulary
**Source:**
Course glossary
> https://courses.edx.org/courses/course-v1:UBCx+HtC1x+2T2017/d192723b104b4c8093aa0c0fc117e97f/

**Operator**
Primitive operators are provided by the BSL language to operate on primitive data. They include  +, -, string-append, substring, image-width and many others.

**Value**
A value is a data element, such as 1, "foo", (make-cat 10 20) etc.

**Primitive**
A primitive is a basic building block provided by BSL that we use when we design our programs. BSL provides primitive data and primitive operations on data.

## Expression Part 2/2
**Irracional number**  
(sqrt 2)  
The answer #i1.414213....  
The #i means that this number is pretty close, but not exactly

# String and Images 

## Part 1/2 : String   
**To form a String**  
-> Put a expression between double quote  
"String"  
"apple"  
"Ada"  

**string-append**  
string-appen put one or more strings one after the other in a single string  
(string-append "Ada" "Lovelace")  
-> "AdaLovelace"  
(string-append "Ada" " " "Lovelace")  
-> "Ada Lovelace"  

>**Observation**  
> 123 -> this is a number  
> "123" -> this is a string  

**string-lenght**  
Returns the number of characters in the string, the same as saying the length  
(string-length "123456")  
-> 6  

**substring**    
Form a new string from the string provides between intervals
0 - based index, we count the first like 0 position  
(substring "012345678" 2 5)
-> "235"  
(The same than consider [2 5> We include the first limit but not the second)

## Part 2/2 : Images  
We need to add in the top position  
**(require 2htdp/image)**  
It tells to DrRacket We want to use the image functions from the 2nd edition of the how to design programs book  

**circle**  
(circle radius "atribute1" "colour")  
i.g. (for example)  
- (circle 10 "solid" "red")
- (circle 20 "solid" "green")
- (circle 50 "solid" "black")
- (circle 30 "outline" "purple")

**Use variable**
To give value and set variables we use **define**
i.g.
- (define x 123) -> x is 123 (number)  
- (define y "red") -> y is "red" (string)  

**rectangle**  
(rectangle witdh heigh "atribute" "colour")  
i.g.  
- (rectangle 30 60 "outline" "black")
- (rectangle 60 20 "solid" "yellow")
- (rectangle 40 40 "solid" "blue")

**text**
Convert a text into a image  
(text "Text you want to use" size "colour")  
i.g.  
- (text "Sample" 30 "blue")
- (text "SAMPLE" 50 "purple")

**above / beside / overlay**  
This is a function that allows us to put the provide images in order according to what we use **above** **beside** **overlay**  
(above (Image top position) (Image down position) .... )  
i.g.  
(above (rectangle 10 10 "solid" "blue")  
       (rectangle 10 10 "solid" "black")  
       (rectangle 10 10 "solid" "red"))  
       
(beside (circle 10 "solid" "black")  
       (circle 10 "solid" "red")  
       (circle 10 "solid" "blue")) 

(overlay (circle 5 "solid" "black")  
       (circle 10 "solid" "red")  
       (circle 20 "solid" "blue"))  
       
# Constant Definitions 
To give value and set variables we use **define**  
(define NAME EXPRESSION)  
i.g.
(define WIDTH 400)  
(define HEIGHT 600)  
*IMPORTANT* (define ...) does not return any value just define  

**define Images**  
When you copy and paste an image into github, Github convert the image in "."

(define LEGO . ) ;this point beside LEGO is an image that could not be copy into Github.

**rotate the Images**  
(rotate degree Image or The Constant Definition)  
i.g.  
(rotate -10 LEGO)  
(rotate 10 LEGO)  
(define RCAT (rotate -10 LEGO))  
(define LCAT (rotate 10 LEGO))  


       
       
