.MODEL SMALL
.STACK 20
.DATA
             ORG 1000H
       NUM   DB  25H, 35H, 45H, 32H, 56H, 98H, 76H, 76H
       COUNT DW  8H
       SUM   DW  ?

.CODE
       START: 
              MOV  AX, @DATA
              MOV  DS, AX

              MOV  CX, COUNT

              MOV  SI, 0H
              MOV  AX, 0H

       REPEAT:
              ADD  AL, NUM[SI]

              JNC  NEXT

              ADD  AH, 01

       NEXT:  
              INC  SI

              LOOP REPEAT

              MOV  SUM, AX

              INT  3
END START