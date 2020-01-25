;PRACTICE PROBLEM 5
.MODEL SMALL    
    
   
.DATA
   
        
.CODE

MAIN PROC
    
        MOV CL, 68
        
        
        MOV AH, 2
        MOV DL, CL
        INT 21h   
         
        
        MOV AH, 4Ch ;RETURN
        INT 21h
        
         
        
        
    MAIN ENDP

END MAIN





