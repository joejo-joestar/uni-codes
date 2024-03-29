DATA SEGMENT
         ORG 1000H    ; Origin address
    NUM1 DB  89       ; Assigning NUM1 as (89)D = (59)H
    NUM2 DB  78       ; Assigning NUM2 as (78)D = (4E)H
    RES  DW  ?        ; Declaring a variable "RES"
DATA ENDS

CODE SEGMENT
          ASSUME CS:CODE, DS:DATA    ; Declaring Code Segments and Data Segments
    START:
          MOV    AX, DATA            ; Assigning AX = DATA from the register
          MOV    DS, AX              ; Assigning DS = AX

          MOV    AH, 0               ; Clearing AH

          MOV    AL, NUM1            ; Assigning AL = NUM1 {(59)H} from DS
          ADD    AL, NUM2            ; Adding and Assigning AL = AL + NUM2 {(4E)H} from DS

          DAA                        ; Decimal Adjust AL after Addition

          ADC    AH, 0               ; Adding the Carry from previous step

          MOV    RES, AX             ; Assigning RES = AX

          INT    3                   ; Breakpoint interrupt
CODE ENDS
END START
