CODE SEGMENT
   ; Port Addresses of Ports for the 8255A PPI
   PORTA    EQU  00H
   PORTB    EQU  02H
   PORTC    EQU  04H

   CTRLREG  EQU  06H            ; Port Address for the Control Register
   CTRLWORD EQU  10000000B
   ; 10000000B (80H) is the Control Word for the PPI
   ;
   ; D7    D6    D5    D4    D3    D2    D1    D0        (8-bit number)
   ; 1     0     0     0     0     0     0     0
   ; Set PPI to I/O Mode (D7 is set) and
   ; Set all Ports to Simple and Output Modes (All others are cleared)
   ;
   ; More info on this can be found here:
   ; [https://github.com/joejo-joestar/uni-codes/blob/09b6c9fb4a770a9a4db902f7408d3b57134582b1/Year%202/Microprocessors%20and%20Interfacing/.FYI1.md]

            ORG  0000H

   START:
            MOV  DX, CTRLREG
            MOV  AL, CTRLWORD
            OUT  DX, AL
   ; OUT instruction Outputs data in accumulator (AL / AX)
   ; To port address stored in DX

            MOV  SI, 0S

   L1:      MOV  CX, 2FFFH      ; Delay to retain current output (TODO: Find how much delay tho)

   L2:
            MOV  AL, CW[SI]     ; For Clockwise Rotation
   ;    MOV  AL, CCW[SI]       ; For Counter Clockwise Rotation

            MOV  DX, PORTC
            OUT  DX, AL

            LOOP L2

            INC  SI
            CMP  SI, 4          ; For the 4 Steps of the motor
            JL   L1

            JMP  START          ; Looping Indefinitely

   ; The Stepper motor has 4 electromagnets (Say A, B, C and D)that
   ; turn on and off based on the given input
   ;
   ; Take for eg the input: 1101,
   ; A    B    C    D
   ; 1    1    0    1
   ;
   ; This means that the magnets A, B and D will be Active
   ; And C will be Inactive
   ; And the Motor will rotate to the right

   ; Clockwise Rotation
            ORG  1000H          ; Starting Address (to rotate in positive direction)
   CW       DB   1101B
            DB   1011B
            DB   0111B
            DB   1110B

   ; Counter Clockwise Rotation
            ORG  1500H          ; Starting Address (to rotate in negative direction)
   CCW      DB   1110B
            DB   0111B
            DB   1011B
            DB   1101B
CODE ENDS
END
