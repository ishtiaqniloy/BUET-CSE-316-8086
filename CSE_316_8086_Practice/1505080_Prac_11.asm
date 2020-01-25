                          TITLE PRACTICE PROBLEM 8

.MODEL SMALL    
    
   
.DATA
   STR1 DB 'Enter 3 single digit numbers: $'
   STR2 DB 'Result = $'
       
        
.CODE

MAIN PROC
        MOV DX, @DATA
        MOV DS, DX
        
        
        LEA DX, STR1    ;1st string
        MOV AH, 9
        INT 21h
        
    
        MOV AH,1    ;1st input 
        INT 21h
                
        MOV CH, AL
        
    
        MOV AH,1    ;2nd input 
        INT 21h
                 
        SUB CH, AL
        
        MOV AH,1    ;3rd input 
        INT 21h
        
        ADD CH, AL
        
        
        MOV AH, 2  ;new line
        MOV DL, 0Dh 
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        
        
        LEA DX, STR2    ;2nd string
        MOV AH, 9
        INT 21h
        
        
        MOV AH, 2   ;PRINTING SUM
        MOV DL, CH
        INT 21h
        
            
        MOV AH, 4Ch ;RETURN
        INT 21h
        
         
        
        
    MAIN ENDP

END MAIN





