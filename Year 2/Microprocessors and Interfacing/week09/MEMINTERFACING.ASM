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

            MOV  AL, 0
            MOV  CX, 1FH        ; Count of Lines (Number of Lines to read from file)

   L1:      
            PUSH CX             ; Temporarily store current index (Count)

            MOV  DX, PORTA
            OUT  DX, AL

            INC  AL
            MOV  CX, 7FFFH      ; Delay for displaying outputs

   L2:      LOOP L2

            POP  CX             ; Retrieve stored index (Count)

            LOOP L1

            JMP  START          ; Loop Indefinitely

CODE ENDS
END START