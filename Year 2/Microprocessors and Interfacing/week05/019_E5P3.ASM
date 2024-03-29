.MODEL SMALL
.STACK 20

DISP MACRO MSG
         MOV AH, 09H
         LEA DX, MSG
         INT 21H
ENDM

.DATA
    MSG1 DB 0DH, 0AH, 'Input a string:$'

    SRC  DB 80
         DB ?
         DB 30 DUP (?)
    MSG2 DB 0DH, 0AH, 'The reversed string is:'
    REV  DB 30 DUP (?)

.CODE
    START:
          MOV   AX, @DATA
          MOV   DS, AX
          MOV   ES, AX
          DISP  MSG1
          LEA   DX, SRC
          MOV   AH, 0AH
          INT   21H
          LEA   SI, SRC+2
          LEA   DI, REV-1
          MOV   CL, SRC+1
          MOV   CH, 00
          ADD   DI, CX
          MOV   BYTE PTR [DI+1], '$'
          CLD
    NEXT: 
          MOVSB
          SUB   DI, 0002
          LOOP  NEXT

          DISP  MSG2
          MOV   AH, 4CH
          INT   21H
END START