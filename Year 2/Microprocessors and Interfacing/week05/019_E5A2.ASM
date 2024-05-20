.MODEL SMALL
.STACK 20
PRINT MACRO MSG
            MOV AH, 09H
            LEA DX, MSG
            INT 21H
ENDM

DISP MACRO C
           ADD C, 30H
           MOV AH, 02H
           MOV DL, C
           INT 21H
ENDM

READ MACRO STR
           MOV AH, 0AH
           LEA DX, STR
           INT 21H
ENDM

.DATA
      MSG      DB 0DH, 0AH, 'ENTER A STRING: $'
      INP      DB 50
               DB ?
               DB 50 DUP (0)
      NEW_LINE DB 0DH, 0AH, '$'
      CHAR     DB 'A'

.CODE
      START:
            MOV   AX, @DATA
            MOV   DS, AX
            MOV   ES, AX

            PRINT MSG

            READ  INP
            LEA   DI, INP+2

            PRINT NEW_LINE

            MOV   AL, CHAR
            MOV   BL, 0
            MOV   CH, 0
            MOV   CL, INP+1

            CLD

      SCAN: 
            SCASB
            JNE   CHECK
            INC   BL

      CHECK:
            LOOP  SCAN

            MOV   AL, BL
            AAM
            MOV   BH, AH
            MOV   BL, AL

            DISP  BH
            DISP  BL

            MOV   AH, 4CH
            INT   21H

END START
