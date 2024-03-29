.MODEL SMALL
.STACK 20

PRINT MACRO MSG
          MOV AH, 09H
          LEA DX, MSG
          INT 21H
ENDM

READ_CHAR MACRO
              MOV AH, 01H
              INT 21H
ENDM

.DATA
    NOT_NUM     DB 'NON-'
    IS_NUM      DB 'NUMERIC KEY IS PRESSED$'
    INP_MESSAGE DB 'PLEASE ENTER A CHAR: $'
    CRLF        DB 0DH, 0AH, '$'

.CODE
    START:  
            MOV       AX, @DATA
            MOV       DS, AX

            PRINT     INP_MESSAGE

            READ_CHAR

            CMP       AL, 30H
            JL        IS_CHAR

            CMP       AL, 39H
            JG        IS_CHAR

            PRINT     CRLF
            PRINT     IS_NUM

            JMP       EXIT

    IS_CHAR:
            PRINT     CRLF
            PRINT     NOT_NUM

    EXIT:   
            MOV       AH, 4CH
            INT       21H

    END START