.MODEL SMALL
.STACK 20

.CODE
        START:    
                  CALL READKB
                  MOV  BL, AL
                  CALL NEXTLINE

                  CALL READKB

                  MUL  BL

                  MOV  BL, AL
                  CALL NEXTLINE

                  CALL DISP

                  MOV  AH, 4CH
                  INT  21H

READKB PROC NEAR
                  MOV  AH, 01
                  INT  21H

                  CALL ASCII2HEX

                  RET
READKB ENDP

ASCII2HEX PROC NEAR
                  CMP  AL, 3AH
                  JC   SUB30

                  SUB  AL, 07H

        SUB30:    
                  SUB  AL, 30H
                  AND  AL, 0FH

                  RET
ASCII2HEX ENDP

NEXTLINE PROC NEAR
                  MOV  AH, 2

                  MOV  DL, 0DH
                  INT  21H

                  MOV  DL, 0AH
                  INT  21H

                  RET
NEXTLINE ENDP

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

HEX2ASCII PROC NEAR
                  CMP  AL, 0AH
                  JB   NUM

                  ADD  AL, 07
        NUM:      
                  ADD  AL, 30H

                  RET
HEX2ASCII ENDP

END START
