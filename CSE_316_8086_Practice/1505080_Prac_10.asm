TITLE PRACTICE PROBLEM 10

.MODEL SMALL    
    
   
.DATA  
        
.CODE

MAIN PROC
        MOV AX, 31
        MOV BX, 14
        
        ADD BX, AX
        MOV CX, BX
            
        MOV AH, 4Ch
        INT 21h
        
         
        
        
    MAIN ENDP

END MAIN





