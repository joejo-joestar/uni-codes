.MODEL SMALL
.STACK 20
.DATA
    MSG2   DB 'NOT '
    MSG1   DB 'IDENTICAL$'
    ARRAY1 DB 95H, 82H, 72H, 65H, 52H, 45H, 32H, 00H
    ARRAY2 DB 95H, 82H, 72H, 65H, 52H, 45H, 32H, 00H

.CODE
    START:
                   MOV  AX, @DATA
                   MOV  DS, AX
                   MOV  ES, AX

                   MOV  CX, 8

                   LEA  SI, ARRAY1
                   LEA  DI, ARRAY2

                   CLD
                   REPE CMPSB
                   JE   IF_IDENTICAL

    ; IF_NOTIDENTICAL:
                   LEA  DX, MSG2
                   MOV  AH, 09
                   INT  21H

                   MOV  AH, 4CH
                   INT  21H

    IF_IDENTICAL:
                   LEA  DX, MSG1
                   MOV  AH, 09
                   INT  21H

                   MOV  AH, 4CH
                   INT  21H

END START