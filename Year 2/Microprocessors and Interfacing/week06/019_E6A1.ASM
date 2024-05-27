.MODEL SMALL
.STACK 20
PRINT MACRO MSG
              MOV AH, 09H
              LEA DX, MSG
              INT 21H
ENDM

READ MACRO STR
             MOV AH, 0AH
             LEA DX, STR
             INT 21H
ENDM

.DATA
        MSG                  DB  0DH, 0AH, 'ENTER A FILENAME: $'
        FILE_NOT_FOUND_ERROR DB  0DH, 0AH, 'FILE NOT FOUND$'
        READ_ERROR           DB  0DH, 0AH, 'FILE READ ERROR$'
        NEW_LINE             DB  0DH, 0AH, '$'
        BUFFER               DB  100 DUP(?)
                             DB  '$'
        FNAME                DB  80
                             DB  ?
                             DB  80 DUP(0)
        NULL                 EQU 0

.CODE
        START:    
                  MOV   AX, @DATA
                  MOV   DS, AX

                  PRINT MSG
                  READ  FNAME                       ; Reading User Input

        ; Input String is stored as [Size of String][String]
                  LEA   SI, FNAME+2
                  MOV   CH, 00                      ; clearing CH
                  MOV   CL, FNAME+1                 ; Moving Size of Input String to CL
                  ADD   SI, CX                      ; Moving SI to End of String
        ; Note: File Handling operations require 0 Terminated File Name
                  MOV   BYTE PTR[SI], NULL          ; Setting End of String with '0' (NULL)

        ; Opeing Existing File Operation
                  MOV   AH, 3DH
                  LEA   DX, FNAME+2                 ; Assigning DX the starting adderss of File Name
                  MOV   AL, 0                       ; Open File in Read Mode
        ;   MOV   CX, 0                       ; ??
                  INT   21H
        ; AX stores the File Handle
                  MOV   BX, AX                      ; Storing File Handle into BX before modifying AX

                  PRINT NEW_LINE

                  JNC   READ_FILE                   ; Carry Flag is Set if there is error in Opening File

                  PRINT FILE_NOT_FOUND_ERROR
                  JMP   EXIT

        READ_FILE:
        ; Read File Operation
        ; File handle referenced from BX while reading
                  MOV   AH, 3FH
                  MOV   CX, 100                     ; Count of Bytes to read from File
                  LEA   DX, BUFFER                  ; String to Store Bytes to
                  INT   21H
                  JC    ERROR                       ; Carry Flag is Set if there is error in Reading File

        ; File Contents are 0 (NULL) terminated
                  CMP   AX, NULL                    ; Comparing AX to EOF
                  JE    EOF                         ; If EOF, Jump

        ; Else Print Buffer and Loop
                  PRINT BUFFER
                  JMP   READ_FILE

        ERROR:                                      ; Error in Reading File
                  PRINT READ_ERROR
                  JMP   EXIT

        EOF:                                        ; End of File
        ; Close File Operation
                  MOV   AH, 3EH
        ;   MOV   BX, AX                      ; BX Holds the File Handle
                  INT   21H

        EXIT:     
                  MOV   AH, 4CH                     ; End Program
                  INT   21H

END START
