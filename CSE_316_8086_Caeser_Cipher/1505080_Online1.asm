TITLE 1505080_ONLINE1 

.MODEL SMALL    
    
   
.DATA 
        
.CODE

MAIN PROC
        
        ;INPUT
        
        MOV AH,1    
        
        INT 21h     ;1st input 
        MOV BH, AL
                
    
        INT 21h     ;2nd input
        MOV BL, AL         
        
             
        INT 21h     ;3rd input
        MOV CH, AL
        
    
        INT 21h     ;4th input
        MOV CL, AL
        SUB CL, '0'
        
        
        ;OUTPUT
        
        ADD BH, CL
        ADD BL, CL
        ADD CH, CL
        
        
        MOV AH, 2                   
        
        MOV DL, 0Dh ;Carriage return
        INT 21h
        
        MOV DL, BH
        INT 21h
        
        MOV DL, BL
        INT 21h
        
        MOV DL, CH
        INT 21h
        
        MOV DL, ' '
        INT 21h
 
 
 
           
        MOV AH, 4Ch ;RETURN
        INT 21h
        
         
        
        
    MAIN ENDP

END MAIN





