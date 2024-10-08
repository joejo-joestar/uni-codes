.MODEL SMALL
.STACK 20

.DATA
    SRCSTR DB 'ELECTRONICS'
    LEN    DW $-SRCSTR
    MSG    DB 'The Transferred String='
    DSTSTR DB 40 DUP ('$')

.CODE
    START:
          MOV AX, @DATA
          MOV DS, AX
          MOV ES, AX
          MOV CX, LEN
          LEA SI, SRCSTR
          LEA DI, DSTSTR
          CLD
          REP MOVSB
          LEA DX, MSG
          MOV AH, 09
          INT 21H
          MOV AH, 4CH
          INT 21H
END START