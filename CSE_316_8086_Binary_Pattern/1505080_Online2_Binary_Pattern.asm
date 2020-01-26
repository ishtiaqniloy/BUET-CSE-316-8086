TITLE 1505080_ONLINE2 

.MODEL SMALL    
    
   
.DATA
    INPUT DB ?
    EVEN_STR DB  'EVEN$'
    ODD_STR DB 'ODD$'
     
        
.CODE

MAIN PROC
    
        MOV DX, @DATA
        MOV DS, DX
        
        ;INPUT
        
        MOV AH,1    
        
        INT 21h     ;1st input 
        MOV INPUT, AL
                
        MOV BL, 1
        SHL BL, 7
        
        
        ;OUTPUT
        
        MOV AH, 2                   
        
        MOV DL, 0Ah ;New line
        INT 21h
        
        MOV DL, 0Dh ;Carriage return
        INT 21h
        
        
        
        TOP:
        
        CMP BL, 0
        JE END_LOOP
        
        MOV BH, INPUT
        AND BH, BL
        
        CMP BH, 0
        JE IF_LABEL
        
        ;ELSE CLAUSE
        MOV AH, 2
        
        MOV DL, '1'
        INT 21h
        
        JMP END_IF 
        
        
        IF_LABEL:
        ;IF CLAUSE
        MOV AH, 2
        
        MOV DL, '0'
        INT 21h
        
        END_IF:
        
        SHR BL, 1
        
        
        JMP TOP
        
        
        END_LOOP:
        
        
        MOV AH, 2                   
        
        MOV DL, 0Ah ;New line
        INT 21h
        
        MOV DL, 0Dh ;Carriage return
        INT 21h
        
        
        AND BH, 1
        CMP BH, 0
        JE IF_LABEL2
        
        ;ELSE CLAUSE
        LEA DX, ODD_STR    
        MOV AH, 9
        INT 21h
        
        JMP END_IF2 
        
        
        IF_LABEL2:
        ;IF CLAUSE
        LEA DX, EVEN_STR    
        MOV AH, 9
        INT 21h
        
        END_IF2:
        
        
  
 
 
 
           
        MOV AH, 4Ch ;RETURN
        INT 21h
        
         
        
        
    MAIN ENDP

END MAIN





