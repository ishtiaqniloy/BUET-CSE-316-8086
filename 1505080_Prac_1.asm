TITLE PRACTICE PROBLEM 1

.MODEL SMALL    
    
   
.DATA
   STR1 DB 'Input a lowercase character: $'
   STR2 DB 'The converted uppercase character is: $' 
       
        
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
        SUB BL, 'a'
        ADD BL, 'A'
        
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





