TITLE PRACTICE PROBLEM 7

.MODEL SMALL    
    
   
.DATA
   STR1 DB 'Enter 3 single digit umbers: $'
   STR2 DB 'Sum = $'
       
        
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
                 
        ADD CH, AL
        SUB CH, '0'
        
        MOV AH,1    ;3rd input 
        INT 21h
        
        ADD CH, AL
        SUB CH, '0'
        
        
        
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





