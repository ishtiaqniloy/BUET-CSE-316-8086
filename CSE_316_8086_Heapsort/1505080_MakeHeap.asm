TITLE MAKEHEAP BY 1505080

.MODEL SMALL
    
.STACK 100h
   
.DATA
   STR1 DB 'Enter  Numbers: $'
   STR2 DB 'Output Numbers: $'
   X DW 0
   Y DW 0
   SB DB 0
   
   CNT DW 0
   IDX DW 1
   IDXH DW 1
   CURR DW 0
   PAR DW 0
   LC DW 0
   RC DW 0
   
   INPUT_ARR DW 20 DUP (0)
   HEAP_ARR DW 20 DUP (0)
   OUTPUT_ARR DW 20 DUP (0)  
          
.CODE

MAIN PROC
        MOV DX, @DATA
        MOV DS, DX
        
        
        ;INPUT (DONE)
        
        LEA DX, STR1    ;1st string
        MOV AH, 9
        INT 21h
                  
                  
        ;START ARRAY INPUT
        
        MOV IDX, 1
        LEA SI, INPUT_ARR
                
        
        ARRAY_INPUT:
        
        ;Start 1 INPUT
        
        
        MOV X, 0
        MOV SB, 0   ;1 if negative
        
        
        INPUT_LOOP1:
        
        MOV AH,1        ;input 
        INT 21h  
                  
        MOV BL, 'x'     ;end of input 
        CMP AL, BL
        JE END_ARRAY_INPUT
           

        
        MOV BL, ' '     ;end of this number 
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
        
        ;END 1 INPUT
        
        MOV AX, 2
        
        IMUL IDX
        MOV BX, AX
        
        MOV CX, X
               
        MOV SI[BX], CX
        
        INC IDX
        
        
        JMP ARRAY_INPUT
        
        
        
        END_ARRAY_INPUT:
        
        MOV BX, IDX
        MOV CNT, BX
        
        ;END OF INPUT
        
            
            
            
            
        ;PROCESSING
        
        
                         
                         
                         
        ;START MAKING HEAP  (DONE)
        
        
        MOV IDX, 1
        LEA SI, INPUT_ARR   ;INPUT ARRAY INTO SI
        
        MOV IDXH, 1
        LEA DI, HEAP_ARR    ;HEAP INTO DI
        
        HEAP_LOOP:
        
        MOV BX, CNT
        CMP IDX, BX
        JGE END_HEAP_LOOP   ;UPTO LAST INPUT   
        
        MOV AX, 2
        IMUL IDX
        MOV BX, AX
        MOV CX, SI[BX]
        MOV X, CX           ;DATA INPUT[IDX] INTO X
        
           
        MOV AX, 2
        IMUL IDXH
        MOV BX, AX      
        MOV CX, X           
        MOV DI[BX], CX      ;DATA FROM X TO HEAP[IDXH]
                       
                               
        MOV CX, IDXH
        MOV CURR, CX               
                       
        BUHEAPIFY_LOOP:
        
        MOV BX, 1
        CMP CURR, BX
        JLE END_BUHEAPIFY_LOOP  ;ROOT
        
        MOV DX, 0
        MOV AX, CURR
        MOV BX, 2
        IDIV BX
        MOV PAR, AX            ;PAR = CURR/2   
                
        
        MOV AX, 2
        IMUL CURR
        MOV BX, AX       
        MOV CX, DI[BX]
        MOV X, CX           ;HEAP[CURR] INTO X
             
             
        MOV AX, 2        
        IMUL PAR
        MOV BX, AX
        MOV CX, DI[BX]
        MOV Y, CX           ;HEAP[PAR] INTO Y
        
        
        MOV BX, Y
        CMP X, BX    ;CMP HEAP[CURR], HEAP[PAR]
        JGE END_BUHEAPIFY_LOOP
        
        MOV BX, Y
        XCHG BX, X      ;SWAP VALUES OF X AND Y
        MOV Y, BX                              
        
        
        MOV AX, 2
        IMUL CURR
        MOV BX, AX
        MOV CX, X       
        MOV DI[BX], CX ; X INTO HEAP[CURR]
                       
        MOV AX, 2
        IMUL PAR
        MOV BX, AX
        MOV CX, Y       
        MOV DI[BX], CX ;Y INTO HEAP[PAR] 
              
        
        MOV BX, PAR
        MOV CURR, BX    ;PAR = CURR
        
        
        
        JMP BUHEAPIFY_LOOP 
        
        END_BUHEAPIFY_LOOP:
        
        
        
        INC IDX
        INC IDXH
        
        
        JMP HEAP_LOOP
        
        END_HEAP_LOOP:
        
        
              
              
              
              
              
        
        ;OUTPUT (DONE)
        
        
        MOV AH, 2       ;new line
        MOV DL, 0Dh 
        INT 21h
        MOV DL, 0Ah
        INT 21h 
        
        
        LEA DX, STR2    ;2nd string
        MOV AH, 9
        INT 21h
        
        ;START ARRAY OUTPUT
        
        MOV IDX, 1
        LEA SI, HEAP_ARR    ;DESIRED ARRAY 
        
        
        ARRAY_OUTPUT:
        
        MOV BX, CNT
        CMP IDX, BX
        JGE END_ARRAY_OUTPUT
        
        ;Start 1 OUTPUT
       
        MOV AX, 2
        
        IMUL IDX
        MOV BX, AX
               
        MOV CX, SI[BX]
        MOV X, CX

        
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
        
        ;END 1 OUTPUT
        
        INC IDX
        
        
        MOV AH, 2       ;display BLANK SPACE
        MOV DL, ' ' 
        INT 21h
        
        JMP ARRAY_OUTPUT
        
        
        END_ARRAY_OUTPUT:
        
        
        
        
        
        
        
        
        
        
        MOV AH, 4Ch ;RETURN
        INT 21h
        
         
        
        
    MAIN ENDP

END MAIN