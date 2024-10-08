.MODEL SMALL
.STACK 20

.DATA
       ARRAY DB 35H, 56H, 82H, 89H, 90H, 23H, 12H, 51H, 88H
       LEN   DW $-ARRAY
       MSG1  DB 0DH, 0AH, ' Enter two digit numbers: $'
       MSG2  DB 0DH, 0AH, ' The number is present $'
       MSG3  DB 0DH, 0AH, ' The number is not present $'

.CODE

       START: 
              MOV   AX, @DATA
              MOV   DS, AX
              MOV   ES, AX

              MOV   CX, LEN
              LEA   DX, MSG1
              MOV   AH, 09
              INT   21H

              CALL  READKB
              ROR   AL, 4
              MOV   BL, AL

              CALL  READKB
              ADD   AL, BL

              LEA   DX, MSG2
              LEA   DI, ARRAY

              CLD

              REPNE SCASB
              JE    GO
              LEA   DX, MSG3
       GO:    
              MOV   AH, 09
              INT   21H
              MOV   AH, 4CH
              INT   21H

READKB PROC NEAR
              MOV   AH,01
              INT   21H
              CMP   AL, 3AH
              JC    SUB30
              SUB   AL, 07H
       SUB30: 
              SUB   AL, 30H
              RET
READKB ENDP

END START