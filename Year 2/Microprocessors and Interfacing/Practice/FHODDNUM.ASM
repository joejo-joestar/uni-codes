.MODEL SMALL
.STACK 2O
PRINTCHAR MACRO CHAR
    MOV AH, 02H
    MOV DL, CHAR
    ADD DL, 30H
    INT 21H
ENDM

.DATA
    FNAME DB "ID", 0
    BUFFER DB 50 DUP ('$')
    ERRO DB "ERROR!$"

.CODE
    START:
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 3DH
    MOV AL, 0
    LEA DX, FNAME
    INT 21H
    JC ERROR

    MOV BX, AX
      
        MOV AH, 3FH
        MOV CX, 50
        LEA DX, BUFFER
        INT 21H
        JC ERROR
        PUSH AX

        ; CMP AX, 0
        ; JE EOF

        ; LOOP L

    EOF:
        MOV AH, 3EH
        INT 21H

    JMP ODD

    ERROR:
        LEA DX, ERRO
        MOV AH, 09H
        INT 21H
        JMP EXIT

    ODD:
        ; MOV AX, 0
        LEA SI, BUFFER
        ; MOV CX, 0
        MOV BX, 0
        ; MOV CX, AX; SIZE
        POP CX
        MOV AX, 0

        L2:
            LODSB
            CMP AL, '0'
            JB SKIP
            CMP AL, '9'
            JA SKIP
            AND AL, 01B
            JZ SKIP

            INC BX

        SKIP:
            LOOP L2

        PRINTCHAR BL

        EXIT:
            MOV AH, 4CH
            INT 21H

END START
