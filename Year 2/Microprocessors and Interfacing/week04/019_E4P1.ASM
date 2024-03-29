.MODEL SMALL
.STACK 20
.DATA
         ORG 1000H
    BCD  DW  1234H    ; Decimal numbers
    dw 0001001000110100B
    1234d
    HEX  DW  0
.CODE
    START:
            MOV  AX, @DATA
            MOV  DS, AX

            MOV  AX, 0000H

            MOV  BX, 1        ; move the place of 1st digit (from right to left)
            CALL BCD2BIN

            MOV  BX, 10D      ; move the place of 2nd digit (from right to left)
            CALL BCD2BIN

            MOV  BX, 100D     ; move the place of 3rd digit (from right to left)
            CALL BCD2BIN

            MOV  BX, 1000D    ; move the place of 4th digit (from right to left)
            CALL BCD2BIN

            INT  3

BCD2BIN PROC NEAR             ; PROC(edure)
            MOV  AX, BCD

            AND  AX, 000FH    ; Bitwise AND Operation
    ; Using 000FH to Mask Value
    ; eg: for 2nd Call
    ; 4 1 2 3 : 0100 0001 0010 0011
    ; 0 0 0 F : 0000 0000 0000 1111
    ; Res     : 0000 0000 0000 0011

    ; 0010

    4*1+3*10

            MUL  BX
    ; Multiply res with 10D (Ah)
    ; so AX = 0002H * 000AH = 14H



            ADD  HEX, AX
    ; In 2nd Call,
    ; HEX = 0001
    ; and add 14H
    ; Therfore, HEX = 0014H + 0001H = 0015h

            MOV  CL, 04
            ROR  BCD, CL      ; Rotate CL number bits to Right
    ; So, BCD (Prev State): 4 1 2 3 : 0100 0001 0010 0011
    ;     BCD (After ROR) : 3 4 1 2 : 0011 0100 0001 0010

            RET               ; Return to Main
BCD2BIN ENDP

END START