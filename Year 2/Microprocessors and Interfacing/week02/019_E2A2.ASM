.MODEL SMALL
.STACK 20
.DATA
             ORG 1000H
      NUM1   DW  0300H      ; = 768D
      NUM2   DB  85H        ; = (unsigned) 133D = (signed) -123D
      US_QUO DW  ?
      S_QUO  DW  ?

.CODE
      START:
            MOV  AX, @DATA
            MOV  DS, AX

            MOV  AX, NUM1        ; Assigning AX = NUM1
            DIV  NUM2            ; Unsigned div (AL = AX // NUM2) & (AH = AX % NUM2)
            MOV  US_QUO, AX      ; Assigning US_QUO = AX

            MOV  AX, 0           ; Clearing AX
            MOV  AX, NUM1        ; Assigning AX = NUM1
            IDIV NUM2            ; Signed div (AL = AX // NUM2) & (AH = AX % NUM2)
            MOV  S_QUO, AX       ; Assigning S_QUO = AX

      ; Both Division Operators store the Quotient in the AL Register and the Remainder in the AH Register
      ; Here, for eg, US_QUO: Quotient = 0005H and Remainder = 0085H
      ; And S_QUO: Quotient = 00FAH and Remainder = 001EH

            INT  3               ; Breakpoint Interrupt

END START
