DATA SEGMENT
    ; Assigning Values of Ports for Proteus
    PORTA    EQU 00H
    PORTB    EQU 02H
    PORTC    EQU 04H
    PORT_CON EQU 06H
DATA ENDS

CODE SEGMENT
          MOV  AX, DATA
          MOV  DS, AX

          ORG  0000H

    START:
          MOV  DX, PORT_CON
          MOV  AL, 10000000B
          OUT  DX, AL
          MOV  SI, 0
          MOV  DI, 0

    L0:   MOV  CX, 2FFFH

    L1:   MOV  AL, CW[DI]
          MOV  DX, PORTC
          OUT  DX, AL
          LOOP L1

          INC  DI
          CMP  DI, 4

          JL   L0
          JMP  START

    ; Clockwise Rotation
          ORG  1000H            ; Starting Address (to rotate in positive direction)
    CW    DB   1101B
          DB   1011B
          DB   0111B
          DB   1110B

    ; Counter Clockwise Rotation
          ORG  1500H            ; Starting Address (to rotate in negative direction)
    CCW   DB   1110B
          DB   0111B
          DB   1011B
          DB   1101B
CODE ENDS
END
