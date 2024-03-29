.MODEL SMALL
.STACK 20

PRINT_SEPERATOR MACRO
                    MOV DL, ':'
                    MOV AH, 02
                    INT 21H
ENDM

.DATA
    MSG  DB "PRESENT TIME IS: $"

.CODE
    START:
          MOV             AX, @DATA
          MOV             DS, AX

          MOV             AH, 00       ; Set vid mode
          MOV             AL, 03H      ; text mode, 80x25, 16 color
          INT             10H

          MOV             AH, 02       ; Set Cursor Pos
          MOV             BH, 0        ; page num
          MOV             DH, 12       ; row
          MOV             DL, 30       ; col
          INT             10H

          LEA             DX, MSG
          MOV             AH, 09
          INT             21H

          MOV             AH, 2CH ; Get System Time
          INT             21H

          MOV             AL, CH ; CH = Hours
          CALL            DISP

          PRINT_SEPERATOR

          MOV             AL, CL ; CL = Mins
          CALL            DISP

          PRINT_SEPERATOR

          MOV             AL, DH ; DH = Secs
          CALL            DISP

          MOV             AH, 02
          MOV             BH, 0
          MOV             DH, 24
          MOV             DL, 00
          INT             10H

          MOV             AH, 4CH
          INT             21H

DISP PROC NEAR
          AAM
          ADD             AX, 3030H
          MOV             BX, AX
          MOV             DL, BH
          MOV             AH, 02
          INT             21H
          MOV             DL, BL
          MOV             AH, 02
          INT             21H
          RET
          ENDP
END START