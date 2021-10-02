## **cond Expressions Part 1/2**  

**NEW Comment Option : #;**    
Comments out the entire expression or definition that follows it  

**OTHER: () and [] : Are the same in Racket?**  
The answer is Yes; both are equivalent  
but by convention we use:  
- [] around questions and answer pairs in cond 

**To form Condition Expressions**
```racket
(cond [ <Expression_Question> <Expression_Answer>]
      ...)
;Last question can be else
```
## **cond Expressions Part 2/2**  
Evaluating condition Expressions  
i.g.  
```racket
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
```
