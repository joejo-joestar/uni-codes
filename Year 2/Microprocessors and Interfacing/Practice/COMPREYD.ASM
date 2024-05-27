.MODEL SMALL
.STACK 20

.DATA
    MSG  DB "ENTER STRING: $"
    CRLF DB 0DH, 0AH, '$'
    INP  DB 50
         DB 0
         DB 50 DUP ('$')

.CODE
    START:   
             MOV  AX, @DATA
             MOV  DS, AX

             LEA  DX, MSG
             MOV  AH, 09H
             INT  21H

             LEA  DX, INP
             MOV  AH, 0AH
             INT  21H

             LEA  DX, CRLF
             MOV  AH, 09H
             INT  21H

             MOV  CX, 0
             MOV  BX, 0
             MOV  CL, INP+1
             MOV  BL, INP+1
             DEC  BL

             MOV  AX, 0

    L1:      MOV  SI, 0
    L2:      
             MOV  AL, INP[SI+2]
             CMP  AL, INP[SI+3]
             JBE  SKIPSWAP

    ;   swapping
             XCHG AL, INP[SI+3]
             MOV  INP[SI+2], AL

    SKIPSWAP:
             INC  SI
             CMP  SI, BX
             JNZ  L2

             LOOP L1

             LEA  DX, INP+2
             MOV  AH, 09H
             INT  21H

             MOV  AH, 4CH
             INT  21H

END START