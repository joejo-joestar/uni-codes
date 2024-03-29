.MODEL SMALL
.STACK 20
.DATA
         ORG 1000H
    NUM1 DB  95H, 85H, 75H, 65H, 55H, 45H, 35H, 25H

.CODE
    START:   
             MOV  AX, @DATA
             MOV  DS, AX

             MOV  CX, 8H            ; Set CX = 8
             MOV  BX, 8H            ; Set BX = 8

             MOV  SI, 0

    LOOP1:   

    LOOP2:   

             MOV  AL, NUM1[SI+1]
             CMP  AL, NUM1[SI]      ; Comparing Current NUM with Next NUM
             JNS  SKIP              ; Jump if Sign Flag is 0
    ;   to skip swapping if Current NUM is already less than the Next NUM

    SAWPPING:
             MOV  AL, NUM1[SI+1]
             XCHG AL, NUM1[SI]
             MOV  NUM1[SI+1], AL

    SKIP:                           ; Simple Increment
             INC  SI
             LOOP LOOP2

             MOV  SI, 0             ; Clearing SI
             MOV  CX, 8H            ; Restting CX to 8

             DEC  BX
             JNZ  LOOP1             ; Jump to LOOP1 till BX = 0

             INT  3
END START
