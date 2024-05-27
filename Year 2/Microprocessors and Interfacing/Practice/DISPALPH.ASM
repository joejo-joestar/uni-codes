.MODEL SMALL
.STACK 20

.DATA
    MSG  DB "ID: $"
    INP  DB 20
         DB 0
         DB 20 DUP ('$')
    ALPH DB 20 DUP ('$')
    CRLF DB 0DH, 0AH, '$'

.CODE
    START: 
           MOV   AX, @DATA
           MOV   DS, AX
           MOV   ES, AX

           MOV   AH, 09H
           LEA   DX, MSG
           INT   21H

           MOV   AH, 0AH
           LEA   DX, INP
           INT   21H

           MOV   AH, 09H
           LEA   DX, CRLF
           INT   21H

           MOV   CX, 0
           MOV   CL, INP+1
           MOV   DI, 0
           LEA   SI, INP+2

    L:     
           LODSB
           CMP   AL, 39H
           JA    NONNUM

           CMP   AL, 30H
           JB    NONNUM

           LOOP  L
           JMP   FIN

    NONNUM:
           MOV   ALPH[DI], AL
           INC   DI
           LOOP  L

    FIN:   
           LEA   DX, ALPH
           MOV   AH, 09H
           INT   21H

           MOV   AH, 4CH
           INT   21H

END START
