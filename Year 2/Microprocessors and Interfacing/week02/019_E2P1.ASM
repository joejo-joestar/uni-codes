.MODEL SMALL
.STACK 20
.DATA
          ORG 1000H
    NUM1  DB  25H, 35H, 45H, 32H, 56H, 98H, 76H, 76H
    NUM2  DB  90H, 56H, 43H, 75H, 89H, 10H, 34H, 22H
    ANS   DB  9 DUP (?)
    COUNT DW  8H

.CODE
    START:
           MOV  AX, @DATA
           MOV  DS, AX

           MOV  CX, COUNT

           MOV  SI, 0

           CLC

    REPEAT:
           MOV  AL, NUM1[SI]
           ADC  AL, NUM2[SI]

           MOV  ANS[SI], AL

           INC  SI

           LOOP REPEAT

           INT  3
END START
