TITLE INPUT OUTPUT BY 1505080

.MODEL SMALL
    
.STACK 100h
   
.DATA
   STR1 DB 'Enter Number: $'
   STR2 DB 'Your Number : $'
   X DW ?
   SB DB ?
        
.CODE

MAIN PROC
        MOV DX, @DATA
        MOV DS, DX
        
        
        LEA DX, STR1    ;1st string
        MOV AH, 9
        INT 21h
        
        ;Start INPUT
        
        MOV X, 0
        MOV SB, 0   ;1 if negative
        
        
        INPUT_LOOP1:
        
        MOV AH,1        ;input 
        INT 21h  
        
        MOV BL, ' ' 
        CMP AL, BL
        JE END_INPUT_LOOP1
        
        MOV BL, '-' 
        CMP AL, BL
        JNE NOT_NEG
        
        MOV SB, 1
        JMP INPUT_LOOP1
        NOT_NEG:
           
        
        SUB AL, '0'
        
        MOV CL, AL   
        MOV CH, 0
        
        MOV AX, 10
        
        IMUL X
        
        ADD AX, CX
        
        MOV X, AX
        
        JMP INPUT_LOOP1
        
        END_INPUT_LOOP1:
        
        
        MOV BL, 1 
        CMP BL, SB
        JNE NOT_NEG2
        NEG X 
        NOT_NEG2:
        
        
        
        
        MOV CX, X
        
        
        
        
        
        
        ;Start OUTPUT
        
        
            
        MOV AH, 2       ;new line
        MOV DL, 0Dh 
        INT 21h
        MOV DL, 0Ah
        INT 21h 
        
        
        LEA DX, STR2    ;2nd string
        MOV AH, 9
        INT 21h
        

        
        CMP X, 0
        JGE NOT_NEG3
        
        MOV AH, 2       ;display minus
        MOV DL, '-' 
        INT 21h
        
        NEG X
        
        NOT_NEG3:
        
        
        
        CMP X, 0
        JNE NOT_ZERO
        
        MOV AH, 2       ;display zero
        MOV DL, '0' 
        INT 21h
        
        NOT_ZERO:
        
        
        
        MOV AX, '#'
        
        PUSH AX
         
        
        
        OUTPUT_LOOP1:
        
        CMP X, 0
        JE END_OUTPUT_LOOP1
        
        MOV BX, 10
        MOV DX, 0
        MOV AX, X
        
        IDIV BX
        
        PUSH DX
        MOV X, AX
        
        JMP OUTPUT_LOOP1
        
        
        END_OUTPUT_LOOP1:
                    
                    
        
        
        OUTPUT_LOOP2:
        
        POP BX
        
        CMP BX, '#'
        JE END_OUTPUT_LOOP2
        
        ADD BX, '0'
        
        MOV AH, 2       ;display digit
        MOV DL, BL 
        INT 21h
        
        JMP OUTPUT_LOOP2
        
        END_OUTPUT_LOOP2:
        
        
        
        
        
        
        MOV AH, 4Ch ;RETURN
        INT 21h
        
         
        
        
    MAIN ENDP

END MAIN