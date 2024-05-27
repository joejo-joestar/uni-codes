.MODEL SMALL
.STACK 20

.DATA
    MSG     DB "ID: $"
    INP     DB 13
            DB 0
            DB 20 DUP ('$')
    NUM     DB 20 DUP ('$')
    CRLF    DB 0DH, 0AH, '$'
.CODE
    START:
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX

        MOV CX, 0
        MOV AH, 09H
        LEA DX, MSG
        INT 21H

        MOV AH, 0AH
        LEA DX, INP
        INT 21H

        MOV AH, 09H
        LEA DX, CRLF
        INT 21H

        MOV CL, INP+1
        MOV DI, 0
        LEA SI, INP+2
        MOV AX, 0

        L:
            LODSB
            CMP AL, 39H
            JA SKIP

            CMP AL, 30H
            JB SKIP

            MOV NUM[DI], AL
            INC DI

        SKIP:
            LOOP L

        LEA DX, NUM
        MOV AH, 09H
        INT 21H

        MOV AH, 4CH
        INT 21H

END START
