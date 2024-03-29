.MODEL SMALL ; Declaring size of memory
.STACK 20 ; Defining Size od Stack
.DATA                 ; Data Segment
         ORG 1000H    ; Origin address
    NUM1 DB  80H      ; Assigning NUM1 as (80)H
    NUM2 DB  86H      ; Assigning NUM2 as (86)H
    RES  DW  ?        ; Declaring a Variable "RES"

.CODE                      ; Code Segment
    START:
          MOV AX, @DATA    ; Assigning AX = DATA
          MOV DS, AX       ; Assigning DS = AX

          MOV AH, 0        ; Clearing AH

          MOV AL, NUM1     ; Assigning AL = NUM1
          ADD AL, NUM2     ; Adding and Assigning AL = AL + NUM2

          ADC AH, 0        ; Add with Carry to AH

          MOV RES, AX      ; Assigning RES = AX

          INT 3            ; Breakpoint interrupt
END START
