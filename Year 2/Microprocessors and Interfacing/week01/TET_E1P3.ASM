.MODEL SMALL
.STACK 20
.DATA
            ORG 1000H
       NUM1 DB  89H
       NUM2 DB  78H
       RES  DW  ?

.CODE
       START1:
              MOV AX, @DATA
              MOV DS, AX
              MOV AH, 0

       START2:
              MOV AL, NUM1
              ADD AL, NUM2
              DAA
              ADC AH, 0
              MOV RES, AX
              INT 3
    END START1
