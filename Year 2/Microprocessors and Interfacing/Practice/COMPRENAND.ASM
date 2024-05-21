; NANDU'S CODE

.model small
.stack 20

disp macro message
         lea dx, message
         mov ah, 09h
         int 21h
endm

read macro inputString
         lea dx, inputString
         mov ah, 0ah
         int 21h
endm

.data
    nextLine      db 0dh, 0ah , "$"
    inputMessage1 db "Enter String: $"
    inputString   db 50
                  db ?
                  db 50 dup("$")

.code
    start:    
              mov  ax, @data
              mov  ds, ax

              disp inputMessage1
              read inputString
              disp nextLine

              xor  dx, dx                   ; why xoring?
    ;   mov  dx, 0                    ; wouldnt this also do the trick?
              mov  al, [inputString+1]      ; what?
              mov  dl, al
              dec  dl
              mov  cx, 0

    loop1:    
              mov  si, 0
    loop2:    
              mov  al, inputString[si+2]
              cmp  al, inputString[si+3]
              jb   increment                ; if s[2] < s[3] move on
    ;   else swap s[2] and s[3]
              xchg al, inputString[si+3]
              mov  inputString[si+2], al

    increment:
              inc  si
              cmp  si, dx                   ; comparing si with size of string?
              jnz  loop2
              inc  cx
              cmp  cl, inputString[1]
              jnz  loop1

              disp inputString+2
              mov  ah,4ch
              int  21h
end start