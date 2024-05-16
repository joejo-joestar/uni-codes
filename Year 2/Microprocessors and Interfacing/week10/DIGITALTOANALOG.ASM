CODE SEGMENT
    PORTA  EQU  00H              ; Address of Port A = 00H
    CONFIG EQU  06H              ; Address of Config. Word = 06H
           ORG  100H
           MOV  DX, CONFIG
           MOV  AL, 10000000B    ; PORT C = output, PORT A = output in mode 0, PORT B = output in mode 0
           OUT  DX, AL
    START:
           MOV  AL, 00000000B    ; All pins of port A will be (0)
           MOV  DX, PORTA
           OUT  DX,AL

           MOV  CX, 0FFH         ; Small Delay
    L1:
           LOOP L1

           MOV  AL, 11111111B    ; All pins of port A will be (1)
           MOV  DX, PORTA
           OUT  DX,AL

           MOV  CX, 0FFH         ; Small Delay again
    L2:
           LOOP L2

           JMP  START            ; Loop forever
CODE ENDS
END