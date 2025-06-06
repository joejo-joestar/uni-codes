.MODEL SMALL
.STACK 20

PRINT MACRO MSG
            MOV AH, 09H
            LEA DX, MSG
            INT 21H
ENDM

.DATA
      DAY   DB ?, ?, '-'
      MONTH DB ?, ?, '-'
      YEAR  DB ?, ?, ?, ?, '$'
.CODE
      START:
            MOV   AX, @DATA
            MOV   DS, AX
            MOV   ES, AX
            MOV   AH, 2AH
            INT   21H

            PUSH  CX

            PUSH  DX

            MOV   AL, DL
            LEA   SI, DAY
            MOV   AH, 00H

            CALL  CONV

            POP   DX

            MOV   AL, DH
            LEA   SI, MONTH
            MOV   AH, 00H

            CALL  CONV

            POP   AX
            LEA   SI, YEAR
            CALL  CONV
            PRINT DAY
            MOV   AH, 4CH
            INT   21H

CONV PROC NEAR
            MOV   CX, 0000H
            MOV   BX, 000AH
      NEXT:
            MOV   DX, 0000
            DIV   BX
            ADD   DL, 30H
            PUSH  DX
            INC   CX
            CMP   AX, 000AH
            JGE   NEXT
            ADD   AL, 30H
            MOV   [SI], AL
      UP:
            POP   AX
            INC   SI
            MOV   [SI], AL
            LOOP  UP
            RET
CONV ENDP
END START