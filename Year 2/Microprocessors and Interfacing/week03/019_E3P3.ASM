.MODEL SMALL
.STACK 20
.DATA
              ORG 1200H
       ARRAY1 DB  05H, 15H, 25H, 35H, 45H, 55H, 65H, 75H, 85H, 95H

              ORG 1220H
       ARRAY2 DB  0A1H, 0A2H, 0A3H, 0A4H, 0A5H, 0A6H, 0A7H, 0A8H, 0A9H, 0AAH

       COUNT  DW  0AH

.CODE
       START: 
              MOV  AX, @DATA
              MOV  DS, AX

              MOV  CX, COUNT
              MOV  SI, 0

       REPEAT:
              MOV  AL, ARRAY1 [SI]
              XCHG AL, ARRAY2 [SI]
              MOV  ARRAY1 [SI], AL

              INC  SI

              LOOP REPEAT

              INT  3
END START