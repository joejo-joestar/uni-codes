.MODEL SMALL
.DATA
    ARRY  DB 10H, 40H, 20H, 01H, 50H, 90H, 30H, 40H, 20H, 70H
    SML   DB ?
    LRG   DB ?
    COUNT DW 10

.CODE
    START:       
                 MOV  AX, @DATA
                 MOV  DS, AX

                 MOV  SI, 0
                 MOV  CX, COUNT

                 MOV  AL, ARRY[0]
                 MOV  SML, AL
                 MOV  LRG, AL

    ITERATOR:    
                 MOV  AL, ARRY[SI]

                 CMP  AL, SML
                 JB   LESS_THAN

                 CMP  AL, LRG
                 JA   GREATER_THAN

                 JMP  ITERATOR_END

    LESS_THAN:   
                 MOV  SML, AL
                 JMP  ITERATOR_END

    GREATER_THAN:
                 MOV  LRG, AL

    ITERATOR_END:
                 INC  SI
                 LOOP ITERATOR

                 INT  3

END START
