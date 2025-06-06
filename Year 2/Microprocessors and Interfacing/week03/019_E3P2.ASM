.MODEL SMALL
.STACK 20
.DATA
          ORG 1200H
    ARRAY DB  25H, 35H, 45H, 32H, 56H, 25H, 76H, 76H, 28H, 56H, 05H, 35H, 25H, 00H, 98H, 21H

          ORG 1220H
    RES   DB  ?
    COUNT DW  10H

.CODE
    START:
           MOV  AX, @DATA
           MOV  DS, AX

           MOV  CX, COUNT

           MOV  SI, 0
           MOV  AL, 25H

    REPEAT:
           CMP  AL, ARRAY[SI]

           JNE  NEXT

           INC  RES

    NEXT:
           INC  SI

           LOOP REPEAT

           INT  3
END START