; Macro for generating Delay
DELAY MACRO L                   ; Label name is Parameter
            PUSH CX             ; Pushing Current CX into Stack
            MOV  CX, 0FFFH      ; Setting CX as some Large number for delay
      L:    LOOP L
            POP  CX             ; Popping count back into CX
ENDM

CODE SEGMENT
      ; Port Addresses of Ports for the 8255A PPI
      PORTA     EQU   00H
      PORTB     EQU   02H
      PORTC     EQU   04H

      CTRLREG   EQU   06H                ; Port Address for the Control Register
      CTRLWORD  EQU   10000000B
      ; 10000000B (80H) is the Control Word for the PPI
      ;
      ; D7    D6    D5    D4    D3    D2    D1    D0        (8-bit number)
      ; 1     0     0     0     0     0     0     0
      ; Set PPI to I/O Mode (D7 is set) and
      ; Set all Ports to Simple and Output Modes (All others are cleared)
      ;
      ; More info on this can be found here:
      ; [https://github.com/joejo-joestar/uni-codes/blob/09b6c9fb4a770a9a4db902f7408d3b57134582b1/Year%202/Microprocessors%20and%20Interfacing/.FYI1.md]


      LEDENABLE EQU   00000001B          ; 8-Bit number to enable LEDs one by one

      START:    
      ; Initialize the PPI
                MOV   AL, CTRLWORD
                OUT   CTRLREG, AL

                MOV   AL, LEDENABLE
                MOV   CX, 08H

      ; Loop to output though Port A (First half of the LED Array)
      FIRSTHALF:
                OUT   PORTA, AL
                DELAY L1
                SHL   AL, 01H
                LOOP  FIRSTHALF

      ; Clearing Port A
                MOV   AL, 00H
                OUT   PORTA, AL

      ; Resetting AL and CX for next half
                MOV   AL, LEDENABLE
                MOV   CX, 08H
      ; Loop to output though Port B (Second half of the LED Array)
      SECNDHALF:
                OUT   PORTB, AL
                DELAY L2
                SHL   AL, 01H
                LOOP  SECNDHALF

                JMP   START

CODE ENDS
END
