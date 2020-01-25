TITLE PRACTICE PROBLEM 2

.MODEL SMALL    
    
   
.DATA
   STR1 DB 'Input a uppercase character: $'
   STR2 DB 'The converted lowercase character is: $' 
       
        
.CODE

MAIN PROC
        MOV DX, @DATA
        MOV DS, DX
        
        
        LEA DX, STR1
        MOV AH, 9
        INT 21h
        
    
        MOV AH,1
        INT 21h
        
        MOV BL, AL
        SUB BL, 'A'
        ADD BL, 'a'
        
        MOV AH, 2
        
        MOV DL, 0Dh
        INT 21h
        
        MOV DL, 0Ah
        INT 21h
        
        LEA DX, STR2
        MOV AH, 9
        INT 21h
        
        MOV AH, 2
        MOV DL, BL
        INT 21h
            
        MOV AH, 4Ch
        INT 21h
        
         
        
        
    MAIN ENDP

END MAIN





