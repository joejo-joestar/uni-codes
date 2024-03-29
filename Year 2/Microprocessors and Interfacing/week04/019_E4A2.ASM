.MODEL SMALL
.STACK 20

.CODE
        START:
                 CALL READKB
                 MOV  BL, AL
                 CALL NEXTLINE

                 CALL DISP

                 MOV  AH, 4CH
                 INT  21H

READKB PROC NEAR
                 MOV  AH,01
                 INT  21H

                 RET
READKB ENDP

NEXTLINE PROC NEAR
                 MOV  AH, 2

                 MOV  DL, 0DH
                 INT  21H

                 MOV  DL, 0AH
                 INT  21H

                 RET
NEXTLINE ENDP

HEX2ASCII PROC NEAR
                 CMP  AL, 0AH
                 JB   NUM

                 ADD  AL, 07
        NUM:
                 ADD  AL, 30H

                 RET
HEX2ASCII ENDP

DISP PROC NEAR
                 MOV  AL, BL
                 AND  AL, 0F0H
                 ROR  AL, 4
                 CALL HEX2ASCII

                 MOV  DL, AL
                 MOV  AH, 02
                 INT  21H

                 MOV  AL, BL
                 AND  AL, 0FH
                 CALL HEX2ASCII

                 MOV  DL, AL
                 MOV  AH, 02
                 INT  21H

                 RET
DISP ENDP

END START
