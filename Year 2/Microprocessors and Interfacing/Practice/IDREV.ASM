.MODEL SMALL
.STACK 2O

.DATA
    MSG DB "ENTER ID: $"
    INP DB 14
        DB 0
        DB 20 DUP ('$')
    CRLF DB 0AH, 0DH, '$'
    MSG2 DB "REVERSED STRING IS: $"
    REV DB 0

.CODE
    START:
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX

        LEA DX, MSG
        MOV AH, 09H
        INT 21H

        LEA DX, INP
        MOV AH, 0AH
        INT 21H

        LEA DX, CRLF
        MOV AH, 09H
        INT 21H

        MOV CX, 0
        MOV CL, INP+1

        LEA SI, INP+2
        LEA DI, REV
        ADD DI, CX

        MOV BYTE PTR [DI+1], '$'
        CLD

        L:
            MOVSB
            SUB DI, 2
            LOOP L

        LEA DX, MSG2
        MOV AH, 09H
        INT 21H

        LEA DX, REV
        MOV AH, 09H
        INT 21H

        MOV AH, 4CH
        INT 21H

END START

