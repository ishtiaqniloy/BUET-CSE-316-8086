TITLE PRACTICE PROBLEM 3

.MODEL SMALL    
    
   
.DATA
   STR1 DB 'Enter 1st Number: $'
   STR2 DB 'Enter 2nd Number: $'
   STR3 DB 'You have entered: $'
   STR4 DB 'After swapping: $' 
       
        
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
        
        MOV AH, 2  ;new line
        MOV DL, 0Dh 
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        LEA DX, STR2    ;2nd string
        MOV AH, 9
        INT 21h
        
    
        MOV AH,1    ;2nd input 
        INT 21h
        
        MOV CL, AL
        
        MOV AH, 2  ;new line
        MOV DL, 0Dh 
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        
        
        LEA DX, STR3    ;3rd string
        MOV AH, 9
        INT 21h
        
        
        MOV AH, 2   ;PRINTING NUMBERS
        MOV DL, CH
        INT 21h
        
        MOV DL, ' '
        INT 21h
        
        MOV DL, CL
        INT 21h
        
        
        MOV BH, CH  ;SWAPPING
        MOV CH, CL
        MOV CL, BH
        
        
        
        MOV AH, 2  ;new line
        MOV DL, 0Dh 
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        LEA DX, STR4    ;4TH string
        MOV AH, 9
        INT 21h
        
        
        MOV AH, 2   ;PRINTING NUMBERS
        MOV DL, CH
        INT 21h
        
        MOV DL, ' '
        INT 21h
        
        MOV DL, CL
        INT 21h
            
        MOV AH, 4Ch ;RETURN
        INT 21h
        
         
        
        
    MAIN ENDP

END MAIN





