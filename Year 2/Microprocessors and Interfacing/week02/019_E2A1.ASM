.MODEL SMALL
.STACK 20
.DATA
         ORG 1000H    ; Setting orgin
    NUM  DW  8H       ; The Number to find factorial of
    RES  DW  ?        ; Defining an unknown variable

.CODE
    START:
          MOV  AX, @DATA    ; Moving Data to AX
          MOV  DS, AX       ; Moving AX to DS Register

          MOV  CX, NUM      ; Assigning CX = NUM

          MOV  AX, 1H       ; Assigning AX = 1

    FACT: 
          MUL  CX           ; Multiplying CX

          LOOP FACT         ; "Loops" back to Label "FACT" till CX > 0

          MOV  RES, AX      ; Assign RES = AX

          INT  3            ; Breakpoint Interrupt

END START
