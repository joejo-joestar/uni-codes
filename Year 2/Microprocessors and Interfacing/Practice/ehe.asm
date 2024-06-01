CODE SEGMENT
    ; port bs
    pa      equ 00h
    pb      equ 02h

    cr      equ 06h
    led     equ 01b

    START:  
    ; initializing pa, pc in simple output and pb as simple input
            mov al, 10000010b
            out cr, al

    ; clearing both ports
            mov al, 0h
            out pa, al

    ENDLESS:                     ; loop to output continuously
    ; moving 01 to enable atleast 1 led
            mov bl, led

    ; take input from pb (001)
    ; (ppi inputs in active low ig (must check))
            in  al, pb           ; (al = 110b)

    ; inverting al ()
            not al               ; (al = 001b or 1h)

    ; moving to cl for rotating num stored in bl 1h times
            mov cl, al
            rol bl, cl

            mov al, bl           ; this is rqd since out only reads from accumulator
            out pa, al

            JMP ENDLESS
CODE ENDS
END START
