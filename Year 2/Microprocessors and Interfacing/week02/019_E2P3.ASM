.MODEL SMALL
.STACK 20
.DATA
                 ORG 1000H
    NUM1         DB  35H
    NUM2         DB  82H
    UN_SIGN_PROD DW  ?
    SIGN_PROD    DW  ?

.CODE
    START:
          MOV  AX, @DATA
          MOV  DS, AX

          MOV  AL, NUM1
          MUL  NUM2
          MOV  UN_SIGN_PROD, AX

          MOV  AL, NUM1
          IMUL NUM2
          MOV  SIGN_PROD, AX

          INT  3
END START
