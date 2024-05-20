; Macro for generating Delay
DELAY MACRO L               ; Label name is Parameter
          PUSH CX
          MOV  CX, 0FFFH
    L:    LOOP L
          POP  CX
ENDM

CODE SEGMENT
    PORTA    EQU   00H
    PORTB    EQU   02H
    PORTC    EQU   04H

    CTRLREG  EQU   06H
    CTRLWORD EQU   10000000B

    LEDON    EQU   00000001B

    START:   
    ; Setting
             MOV   AL, CTRLWORD
             OUT   CTRLREG, AL

             MOV   AL, LEDON
             MOV   CX, 08H

    ; TY @Sapphire-Starflower

    ; Loop to output though Port A (First half of the LED Array)
    PALOOP:  
             OUT   PORTA, AL
             DELAY L1
             SHL   AL, 01H
             LOOP  PALOOP

    ; Clearing Port A
             MOV   AL, 00H
             OUT   PORTA, AL

    ; Resetting AL and CX for next half
             MOV   AL, LEDON
             MOV   CX, 08H
    ; Loop to output though Port B (Second half of the LED Array)
    PBLOOP:  
             OUT   PORTB, AL
             DELAY L2
             SHL   AL, 01H
             LOOP  PBLOOP

             JMP   START

CODE ENDS
END
