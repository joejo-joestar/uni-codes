.MODEL SMALL
.STACK 20

.DATA
    MSG  DB 'PLEASE ENTER ID: $'
    INP  DB 50
         DB ?
         DB 50 DUP ('$')
    CRLF DB 0DH, 0AH, '$'
    RES  DB 0

.CODE
    START:

          MOV   AX, @DATA
          MOV   DS, AX

          LEA   DX, MSG
          MOV   AH, 09H
          INT   21H

          LEA   DX, INP
          MOV   AH, 0AH
          INT   21H

          LEA   DX, CRLF
          MOV   AH, 09H
          INT   21H

          MOV   CX, 0
          MOV   BX, 0
          MOV   CL, INP+1
          LEA   SI, INP+2

    L:    
          LODSB
          CMP   AL, 39H
          JA    SKIP

          SUB   AL, 30H

          AND   AL, 01H
          JZ    SKIP

          INC   BL
          MOV   RES, BL

    SKIP: LOOP  L

          ADD   RES, 30H
          MOV   DX, 0
          MOV   DL, RES
          MOV   AH, 02H
          INT   21H

          MOV   AH, 4CH
          INT   21H

END START