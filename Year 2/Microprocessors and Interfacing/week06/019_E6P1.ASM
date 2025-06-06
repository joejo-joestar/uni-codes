.MODEL SMALL
.STACK 20
PRINT MACRO MSG
            MOV AH, 09H
            LEA DX, MSG
            INT 21H
ENDM

READ MACRO STR
           LEA DX, STR
           MOV AH, 0AH
           INT 21H
ENDM

.DATA
      MSG1  DB 0DH, 0AH, 'Enter a filename: $'
      MSG2  DB 0DH, 0AH, 'File is created$'
      MSG3  DB 0DH, 0AH, 'Error in File creation$'
      MSG4  DB 0DH, 0AH, 'Enter a text: $'
      MSG5  DB 0DH, 0AH, 'Error in File opening$'
      MSG6  DB 0DH, 0AH, 'Error in writing$'
      MSG7  DB 0DH, 0AH, 'Creating and writing successful$'
      FNAME DB 80 
            DB ?
            DB 80 DUP(0)
      TEXT  DB 80
            DB ?
            DB 80 DUP(?)

.CODE
      START:
            MOV   AX, @DATA
            MOV   DS, AX
            PRINT MSG1
            READ  FNAME
            LEA   SI, FNAME+2
            MOV   CL, FNAME+1
            MOV   CH, 00
            ADD   SI, CX
            MOV   BYTE PTR[SI], 00
            LEA   DX, FNAME+2
            MOV   AH, 3CH
            MOV   CX, 0000H
            INT   21H
            JNC   SUCC1
            PRINT MSG3
            JMP   EXIT

      SUCC1:
            PRINT MSG2
            PRINT MSG4
            READ  TEXT
            MOV   AH, 3DH
            MOV   AL, 02H
            LEA   DX, FNAME+2
            INT   21H
            JNC   SUCC2
            PRINT MSG5
            JMP   EXIT

      SUCC2:
            MOV   BX, AX
            MOV   AH, 40H
            MOV   CH, 00H
            MOV   CL, TEXT+1
            LEA   DX, TEXT+2
            INT   21H
            JNC   SUCC3
            PRINT MSG6
            MOV   AH, 3EH
            INT   21H
            JMP   EXIT

      SUCC3:
            PRINT MSG7

      EXIT: 
            MOV   AH, 4CH
            INT   21H
END START