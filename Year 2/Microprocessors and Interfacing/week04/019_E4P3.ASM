.MODEL SMALL
.STACK 20
.CODE
    START:
           MOV  AL, 45H
           MOV  BL, AL

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

           MOV  AH, 4CH

           INT  21H

    HEX2ASCII:
           CMP  AL, 0AH
           JB   NUM

           ADD  AL, 07

    NUM:
           ADD  AL, 30H

           RET
END START