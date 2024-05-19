DATA SEGMENT
           ORG 1000H      ; Origin address
      NUM1 DB  89H        ; Assigning NUM1 as (89)H
      NUM2 DB  7CH        ; Assigning NUM2 as (7C)H
      ; DB is Define Byte: Data type which is 1 bytes long (1 memory Locations)
      RES  DW  ?          ; Declaring a variable "RES"
      ; DW is Define Word: Data type which is 2 bytes long (2 memory Locations)
DATA ENDS

CODE SEGMENT
            ASSUME CS: CODE, DS: DATA      ; Declaring Code Segments and Data Segments
      START:
            MOV    AX, DATA                ; Assigning AX = DATA from the register
            MOV    DS, AX                  ; Assigning DS = AX

            MOV    AH, 0                   ; Clearing AH

            MOV    AL, NUM1                ; Assigning AL = NUM1 from DS
            ADD    AL, NUM2                ; Adding and Assigning AL = AL + NUM2 from DS

            ADC    AH, 0                   ; Adding the Carry from previous step

            MOV    RES, AX                 ; Assigning RES = AX

            INT    3                       ; Breakpoint interrupt
CODE ENDS
END START
