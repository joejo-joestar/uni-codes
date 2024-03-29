.MODEL SMALL
.STACK 20
.DATA

                 ORG 1000H
       NUM       DW  95H, 82H, 72H, 65H, 52H, 45H, 32H, 00H

       ODDCOUNT  DW  0
       EVENCOUNT DW  0

                 ORG 1020H
       ODDNO     DW  8 DUP (0)
       EVENNO    DW  8 DUP (0)

       COUNT     DW  08H

.CODE
       START: 
              MOV  AX, @DATA
              MOV  DS, AX

              MOV  SI, 0                ; Clearing SI
              MOV  DL, 02H              ; Setting DL = 2h

              MOV  BX, 0                ; Clearing BX

              MOV  CX, COUNT            ; Setting CX = 8H

       CHECK: 
              MOV  AX, NUM[SI]
              DIV  DL                   ; NUM[SI] / 2
              CMP  AH, 0                ; Compare AH (Remainder) with 0
       ; NUM [SI] % 2 == 0, then Jump to IFEVEN
              JE   IFEVEN
       ; Else continue on to IFODD

       ; IFODD:
              MOV  BX, ODDCOUNT
              SHL  BX, 1                ; Multiplying 2H to BX
              MOV  AX, NUM[SI]
              MOV  ODDNO[BX], AX        ; Storing Odd nums in ODDNO Array
              INC  ODDCOUNT             ; Counting Odd numbers
              JMP  LAST                 ; Skipping IFEVEN part

       IFEVEN:
              MOV  BX, EVENCOUNT
              SHL  BX, 1                ; Multiplying 2H to BX
              MOV  AX, NUM[SI]          ; Storing Even nums in EVENNO Array
              MOV  EVENNO[BX], AX       ; Counting Even numbers
              INC  EVENCOUNT
       ; Continue on to LAST

       LAST:  
              INC  SI
              INC  SI
              LOOP CHECK

              INT  3
END START
