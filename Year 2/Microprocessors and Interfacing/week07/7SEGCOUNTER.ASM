CODE SEGMENT
       ; Port Addresses of Ports for the 8255A PPI
       PORTA      EQU  00H
       PORTB      EQU  02H
       PORTC      EQU  04H

       CTRLREG    EQU  06H                      ; Port Address for the Control Register
       CTRLWORD   EQU  10000000B
       ; 10000000B (80H) is the Control Word for the PPI
       ;
       ; D7    D6    D5    D4    D3    D2    D1    D0        (8-bit number)
       ; 1     0     0     0     0     0     0     0
       ; Set PPI to I/O Mode (D7 is set) and
       ; Set all Ports to Simple and Output Modes (All others are cleared)
       ;
       ; More info on this can be found here:
       ; [https://github.com/joejo-joestar/uni-codes/blob/09b6c9fb4a770a9a4db902f7408d3b57134582b1/Year%202/Microprocessors%20and%20Interfacing/.FYI1.md]

                  ORG  00H

       START:     
                  MOV  DX, CTRLREG
                  MOV  AL, CTRLWORD
                  OUT  DX, AL
       ; OUT instruction Outputs data in accumulator (AL / AX)
       ; To port address stored in DX

                  MOV  SI, 0

       L0:        MOV  CX, 1FFFH                ; Delay to retain current output (TODO: Find how much delay tho)

       L1:        
                  MOV  AL, DIGITS_INC[SI]       ; For 00H-0FH Counter
              ;     MOV  AL, DIGITS_DEC[SI]       ; For 0FH-00H Counter

                  MOV  DX, PORTA
                  OUT  DX, AL

                  LOOP L1

                  INC  SI                       ; Displaying next number
                  CMP  SI, 10H                  ; To Count till 0FH
                  JL   L0                       ; Reset Delay for next number

                  JMP  START                    ; Looping indefinietly (Resetting Counter)

       ; These Bytes are active low inputs for the 7 Segment Display
       ; (MSB is for the decimal in the bottom right corner)

       ; Forward Counter
                  ORG  1000H                    ; Starting Address of Digits (to count forwards)
       DIGITS_INC DB   11000000B                ; 0
                  DB   11111001B                ; 1
                  DB   10100100B                ; 2
                  DB   10110000B                ; 3

                  DB   10011001B                ; 4
                  DB   10010010B                ; 5
                  DB   10000010B                ; 6
                  DB   11011000B                ; 7

                  DB   10000000B                ; 8
                  DB   10010000B                ; 9
                  DB   10001000B                ; A
                  DB   10000011B                ; B

                  DB   11000110B                ; C
                  DB   10100001B                ; D
                  DB   10000110B                ; E
                  DB   10001110B                ; F

       ; Reverse Counter
                  ORG  1500H                    ; Starting Address of Digits (to count backwards)
       DIGITS_DEC DB   10001110B                ; F
                  DB   10000110B                ; E
                  DB   10100001B                ; D
                  DB   11000110B                ; C

                  DB   10000011B                ; B
                  DB   10001000B                ; A
                  DB   10010000B                ; 9
                  DB   10000000B                ; 8

                  DB   11011000B                ; 7
                  DB   10000010B                ; 6
                  DB   10010010B                ; 5
                  DB   10011001B                ; 4

                  DB   10110000B                ; 3
                  DB   10100100B                ; 2
                  DB   11111001B                ; 1
                  DB   11000000B                ; 0

CODE ENDS
END
