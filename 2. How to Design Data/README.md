## **cond Expressions Part 1/**  

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


