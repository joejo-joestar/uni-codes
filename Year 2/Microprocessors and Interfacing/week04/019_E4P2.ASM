.MODEL SMALL
.STACK 20
.DATA
              ORG 1000H
    HEX_DIGIT DB  38H
    ASCII     DB  ?

.CODE
    START:
          MOV AX, @DATA
          MOV DS, AX

          MOV AL, HEX_DIGIT
          CMP AL, 3AH

          JC  SUB30
          SUB AL, 07H

    SUB30:
          SUB AL,30H

          MOV ASCII, AL

          INT 3
END START
