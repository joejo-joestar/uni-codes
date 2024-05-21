.MODEL SMALL
.STACK 20

; Macro to display a character
DISPCHAR MACRO CHAR
                MOV AH, 02H
                MOV DL, CHAR
                INT 21H
ENDM

; Data Segemet Declaration
.DATA
            ORG 100H
       ID   DB  '2022A7PS0019U', '$'       ; Harcoded Value
       RES  DW  0                          ; To store result

.CODE
       START:
       ; Initializing DS
                 MOV      AX, @DATA
                 MOV      DS, AX

       ; Loading starting address of String
                 LEA      SI, ID

       ; Size of string for below loop
                 MOV      CL, 13D

       L:
                 MOV      AX, 0            ; Clearing AX
                 LODSB                     ; Loads Byte at DS:SI onto AL
                 CMP      AL, 3AH          ; Checking if Not a Number
                 JAE      SKIP

                 CALL     ASCII2HEX        ; Convert Ascii to Hex (just Sub 30H)
                 MUL      AX               ; Squaring Hex val in AX
                 ADC      RES, AX          ; Adding into Res
       SKIP:
                 LOOP     L

       ; Displaying individual digits: 008FH
       ; Displaying first digit: 0
                 MOV      AX, RES
                 AND      AX, 0F000H       ; Masking
                 ROR      AX, 12D
                 CALL     HEX2ASCII
                 DISPCHAR AL

       ; Displaying second digit: 0

                 MOV      AX, RES
                 AND      AX, 0F00H        ; Masking
                 ROR      AX, 08D
                 CALL     HEX2ASCII
                 DISPCHAR AL

       ; Displaying third digit: 8
                 MOV      AX, RES
                 AND      AX, 00F0H        ; Masking
                 ROR      AX, 04D
                 CALL     HEX2ASCII
                 DISPCHAR AL


       ; Displaying fourth digit: F
                 MOV      AX, RES
                 AND      AX, 000FH        ; Masking
                 CALL     HEX2ASCII
                 DISPCHAR AL

       ; Program End
                 MOV      AH, 4CH
                 INT      21H

       ; hex2ascii procedure
HEX2ASCII PROC NEAR
                 CMP      AL, 0AH
                 JB       NUM

                 ADD      AL, 07
       NUM:
                 ADD      AL, 30H

                 RET
HEX2ASCII ENDP

       ; ascii2hex procedure
ASCII2HEX PROC NEAR
                 SUB      AL, 30H
                 AND      AL, 0FH

                 RET
ASCII2HEX ENDP

    END START
