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
                  ORG  00H
       START:     
                  MOV  DX, PORT_CON
                  MOV  AL, 10000000B             ; 128D
                  OUT  DX, AL
       ; The OUT opcode outputs the byte / word/ double word
       ; stored in AL / AX / EAX through Port Address stored in DX

                  MOV  SI, 0
                  MOV  DI, 0

       L0:        MOV  CX, 1FFFH                 ; To Loop Indefintely

       L1:        MOV  AL, DIGITS_INC[SI]
                  MOV  DX, PORTA
                  OUT  DX, AL
                  LOOP L1

                  INC  SI
                  CMP  SI, 16
                  JL   L0

                  MOV  DX, PORT_CON
                  MOV  AL, 10000000B             ; 128D
                  OUT  DX, AL
                  JMP  START

       ; Forward Counter
                  ORG  1000H                     ; Starting Address of Digits (to count forwards)
       DIGITS_INC DB   11000000B                 ; 0
                  DB   11111001B                 ; 1
                  DB   10100100B                 ; 2
                  DB   10110000B                 ; 3

                  DB   10011001B                 ; 4
                  DB   10010010B                 ; 5
                  DB   10000010B                 ; 6
                  DB   11011000B                 ; 7

                  DB   10000000B                 ; 8
                  DB   10010000B                 ; 9
                  DB   10001000B                 ; A
                  DB   10000011B                 ; B

                  DB   11000110B                 ; C
                  DB   10100001B                 ; D
                  DB   10000110B                 ; E
                  DB   10001110B                 ; F

       ; Reverse Counter
                  ORG  1500H                     ; Starting Address of Digits (to count backwards)
       DIGITS_DEC DB   10001110B                 ; F
                  DB   10000110B                 ; E
                  DB   10100001B                 ; D
                  DB   11000110B                 ; C

                  DB   10000011B                 ; B
                  DB   10001000B                 ; A
                  DB   10010000B                 ; 9
                  DB   10000000B                 ; 8

                  DB   11011000B                 ; 7
                  DB   10000010B                 ; 6
                  DB   10010010B                 ; 5
                  DB   10011001B                 ; 4

                  DB   10110000B                 ; 3
                  DB   10100100B                 ; 2
                  DB   11111001B                 ; 1
                  DB   11000000B                 ; 0

CODE ENDS
END
