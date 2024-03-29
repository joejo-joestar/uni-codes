; Write a program to multiply two 32-bit
; binary numbers stored starting from
; 0300H and 0310H respectively. And also
; store the result starting from 0320H.

.MODEL SMALL
.STACK 20

.DATA
            ORG 0300H
      NUM1  DW  0EEFFH, 9078H
      ; ORG 0310H
      NUM2  DW  0CCDDH, 0189H
      ; ORG 0320H
      PROD  DB  8 DUP (0)
      PROD1 DW  2 DUP (0)
      PROD2 DW  2 DUP (0)
      PROD3 DW  2 DUP (0)
      PROD4 DW  2 DUP (0)
      COUNT DB  4H
      TEMP  DW  ?

.CODE
      START:
            MOV  AX, @DATA
            MOV  DS, AX

            MOV  AX, NUM1[0]
            MUL  NUM2[0]
            MOV  PROD1[0], AX
            MOV  PROD1[2], DX

            MOV  AX, NUM1[2]
            MUL  NUM2[0]
            MOV  PROD2[0], AX
            MOV  PROD2[2], DX

            MOV  AX, NUM1[0]
            MUL  NUM2[2]
            MOV  PROD3[0], AX
            MOV  PROD3[2], DX

            MOV  AX, NUM1[2]
            MUL  NUM2[2]
            MOV  PROD4[0], AX
            MOV  PROD4[2], DX

      ;       MOV  CL, COUNT
      ;       MOV  SI, 0
      ; 1s:   
      ;       LOOP 1s

            INT  3


END START
