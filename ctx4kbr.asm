        use32
        org 0
        
          db     'MENUET01'  ; 8-байтный идентификатор MenuetOS
          dd     1           ; версия заголовка (всегда 1)
          dd     START       ; адрес первой команды
          dd     I_END       ; размер программы
          dd     MEM         ; количество памяти
          dd     STACKTOP    ; адрес вершины стэка
          dd     0           ; адрес буфера для параметров
          dd     0           ; зарезервировано
        
        include "macros.inc" ; макросы облегчают жизнь ассемблерщиков!
        START:
        jmp     @12754

@10000:        ;separator
        push    EBP
        mov     EBP,  ESP
        mov     AL,   47
        mov     ESP,  EBP
        pop     EBP
        ret     0

@10001:        ;open
        push    EBP
        mov     EBP,  ESP
        db      0xB8
        db      0x5
        db      0x0
        db      0x0
        db      0x0
        db      0x8B
        db      0x5D
        db      0x8
        db      0xB9
        db      0x0
        db      0x0
        db      0x0
        db      0x0
        db      0xBA
        db      0x0
        db      0x0
        db      0x0
        db      0x0
        db      0xCD
        db      0x80
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10002:        ;create
        push    EBP
        mov     EBP,  ESP
        db      0xB8
        db      0x5
        db      0x0
        db      0x0
        db      0x0
        db      0x8B
        db      0x5D
        db      0x8
        db      0xB9
        db      0x41
        db      0x2
        db      0x0
        db      0x0
        db      0xBA
        db      0xA4
        db      0x1
        db      0x0
        db      0x0
        db      0xCD
        db      0x80
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10003:        ;read
        push    EBP
        mov     EBP,  ESP
        db      0xB8
        db      0x3
        db      0x0
        db      0x0
        db      0x0
        db      0x8B
        db      0x5D
        db      0x8
        db      0x8B
        db      0x4D
        db      0xC
        db      0x8B
        db      0x55
        db      0x10
        db      0xCD
        db      0x80
        db      0x9
        db      0xC0
        db      0x79
        db      0x2
        db      0x31
        db      0xC0
        mov     ESP,  EBP
        pop     EBP
        ret     12

@10004:        ;write
        push    EBP
        mov     EBP,  ESP
        db      0xB8
        db      0x4
        db      0x0
        db      0x0
        db      0x0
        db      0x8B
        db      0x5D
        db      0x8
        db      0x8B
        db      0x4D
        db      0xC
        db      0x8B
        db      0x55
        db      0x10
        db      0xCD
        db      0x80
        mov     ESP,  EBP
        pop     EBP
        ret     12

@10005:        ;close
        push    EBP
        mov     EBP,  ESP
        db      0xB8
        db      0x6
        db      0x0
        db      0x0
        db      0x0
        db      0x8B
        db      0x5D
        db      0x8
        db      0xCD
        db      0x80
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10006:        ;puts
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@10007: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        je      @10009
@10008: 
        inc     dword [EBP-4]
        jmp     @10007
@10009: 
        db      0xB8
        db      0x4
        db      0x0
        db      0x0
        db      0x0
        db      0xBB
        db      0x1
        db      0x0
        db      0x0
        db      0x0
        db      0x8B
        db      0x4D
        db      0x8
        db      0x8B
        db      0x55
        db      0xFC
        db      0xCD
        db      0x80
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10010:        ;halt
        push    EBP
        mov     EBP,  ESP
        db      0xB8
        db      0x1
        db      0x0
        db      0x0
        db      0x0
        db      0x8B
        db      0x5D
        db      0x8
        db      0xCD
        db      0x80
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10011:        ;isalpha
        push    EBP
        mov     EBP,  ESP
        mov     AL,   byte  [EBP+8]
        mov     BL,   65
        cmp     AL,   BL
        jb      @10013
@10012: 
        mov     AL,   byte  [EBP+8]
        cmp     AL,   90
        jbe     @10016
@10013: 
        mov     AL,   byte  [EBP+8]
        mov     BL,   97
        cmp     AL,   BL
        jb      @10015
@10014: 
        mov     AL,   byte  [EBP+8]
        cmp     AL,   122
        jbe     @10016
@10015: 
        mov     AL,   byte  [EBP+8]
        cmp     AL,   95
        jne     @10017
@10016: 
        mov     EAX,  0
        mov     ESP,  EBP
        pop     EBP
        ret     4
@10017: 
@10018: 
        mov     EAX,  1
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10019:        ;isdigit
        push    EBP
        mov     EBP,  ESP
        mov     AL,   byte  [EBP+8]
        mov     BL,   48
        cmp     AL,   BL
        jb      @10021
@10020: 
        mov     AL,   byte  [EBP+8]
        cmp     AL,   57
        jbe     @10022
@10021: 
        mov     AL,   byte  [EBP+8]
        cmp     AL,   36
        jne     @10023
@10022: 
        mov     EAX,  0
        mov     ESP,  EBP
        pop     EBP
        ret     4
@10023: 
@10024: 
        mov     EAX,  1
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10025:        ;strlen
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@10026: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        je      @10028
@10027: 
        inc     dword [EBP-4]
        jmp     @10026
@10028: 
        mov     EAX,  dword [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10029:        ;strcmp
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@10030: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        mov     EBX,  dword [EBP-4]
        add     EBX,  dword [EBP+12]
        mov     BL,   byte  [EBX+0]
        cmp     AL,   BL
        jne     @10035
@10031: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        jne     @10033
@10032: 
        mov     EAX,  0
        mov     ESP,  EBP
        pop     EBP
        ret     8
@10033: 
@10034: 
        inc     dword [EBP-4]
        jmp     @10030
@10035: 
        mov     EAX,  1
        mov     ESP,  EBP
        pop     EBP
        ret     8

@10036:        ;strcpy
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@10037: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+12]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        je      @10039
@10038: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+12]
        mov     AL,   byte  [EAX+0]
        mov     EBX,  dword [EBP-4]
        add     EBX,  dword [EBP+8]
        mov     byte  [EBX+0], AL
        inc     dword [EBP-4]
        jmp     @10037
@10039: 
        mov     AL,   0
        mov     EBX,  dword [EBP-4]
        add     EBX,  dword [EBP+8]
        mov     byte  [EBX+0], AL
        mov     EAX,  dword [EBP+8]
        mov     ESP,  EBP
        pop     EBP
        ret     8

@10040:        ;strcat
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10025    ; strlen
        add     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  dword [EBP+8]
        mov     ESP,  EBP
        pop     EBP
        ret     8

@10041:        ;str2
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  24
        mov     EAX,  @@TEXT+962
        mov     dword [EBP-4], EAX
        mov     EAX,  @@TEXT+995
        mov     dword [EBP-8], EAX
        mov     EAX,  0
        mov     dword [EBP-12], EAX
@10042: 
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  0
        ja      @10044
@10043: 
        mov     EAX,  dword [EBP-12]
        cmp     EAX,  0
        jne     @10045
@10044: 
        mov     EAX,  dword [EBP+12]
        mov     EBX,  dword [EBP+8]
        xchg    EAX,  EBX
        xor     EDX,  EDX
        div     EBX
        xchg    EAX,  EDX
        add     EAX,  dword [EBP-8]
        mov     AL,   byte  [EAX+0]
        mov     EBX,  dword [EBP-12]
        add     EBX,  dword [EBP-4]
        mov     byte  [EBX+0], AL
        inc     dword [EBP-12]
        mov     EAX,  dword [EBP+12]
        mov     EBX,  dword [EBP+8]
        xchg    EAX,  EBX
        xor     EDX,  EDX
        div     EBX
        mov     dword [EBP+8], EAX
        jmp     @10042
@10045: 
        mov     AL,   0
        mov     EBX,  dword [EBP-12]
        add     EBX,  dword [EBP-4]
        mov     byte  [EBX+0], AL
        mov     EAX,  0
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP-12]
        sub     EAX,  1
        mov     dword [EBP-20], EAX
@10046: 
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [EBP-16]
        cmp     EAX,  EBX
        jbe     @10048
@10047: 
        mov     EAX,  dword [EBP-16]
        add     EAX,  dword [EBP-4]
        mov     AL,   byte  [EAX+0]
        mov     byte  [EBP-24], AL
        mov     EAX,  dword [EBP-20]
        add     EAX,  dword [EBP-4]
        mov     AL,   byte  [EAX+0]
        mov     EBX,  dword [EBP-16]
        add     EBX,  dword [EBP-4]
        mov     byte  [EBX+0], AL
        mov     AL,   byte  [EBP-24]
        mov     EBX,  dword [EBP-20]
        add     EBX,  dword [EBP-4]
        mov     byte  [EBX+0], AL
        dec     dword [EBP-20]
        inc     dword [EBP-16]
        jmp     @10046
@10048: 
        mov     EAX,  dword [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     8

@10049:        ;str
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  10
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10041    ; str2
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10050:        ;Stop
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  256
        mov     EAX,  @@TEXT+1012
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@DATA+4749768
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+1014
        push    EAX
        call    @10006    ; puts
        mov     EAX,  dword [@@DATA+4749804]
        push    EAX
        call    @10049    ; str
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+1016
        push    EAX
        call    @10006    ; puts
        mov     EAX,  dword [@@DATA+4749808]
        push    EAX
        call    @10049    ; str
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+1018
        push    EAX
        call    @10006    ; puts
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+1022
        push    EAX
        call    @10006    ; puts
@10051: 
        mov     EAX,  dword [@@DATA+4716984]
        cmp     EAX,  0
        jbe     @10053
@10052: 
        dec     dword [@@DATA+4716984]
        mov     EAX,  dword [@@DATA+4716984]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+4716600]
        push    EAX
        call    @10005    ; close
        jmp     @10051
@10053: 
        mov     EAX,  dword [@@DATA+4749800]
        push    EAX
        call    @10005    ; close
        mov     EAX,  1
        push    EAX
        call    @10010    ; halt
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10054:        ;val
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  28
        mov     EAX,  @@TEXT+1025
        mov     dword [EBP-4], EAX
        mov     EAX,  65536
        mov     dword [EBP-8], EAX
        mov     EAX,  10
        mov     dword [EBP-12], EAX
        mov     EAX,  0
        mov     dword [EBP-16], EAX
        mov     EAX,  0
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   36
        jne     @10056
@10055: 
        mov     EAX,  16
        mov     dword [EBP-12], EAX
        mov     EAX,  1
        mov     dword [EBP-16], EAX
        jmp     @10060
@10056: 
        mov     EAX,  0
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   48
        jne     @10059
@10057: 
        mov     EAX,  1
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   120
        jne     @10059
@10058: 
        mov     EAX,  16
        mov     dword [EBP-12], EAX
        mov     EAX,  2
        mov     dword [EBP-16], EAX
@10059: 
@10060: 
        mov     EAX,  0
        mov     dword [EBP-20], EAX
        mov     EAX,  0
        mov     dword [EBP-24], EAX
@10061: 
        mov     EAX,  dword [EBP-16]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        je      @10072
@10062: 
        mov     EAX,  0
        mov     dword [EBP-28], EAX
@10063: 
        mov     EAX,  dword [EBP-28]
        add     EAX,  dword [EBP-4]
        mov     AL,   byte  [EAX+0]
        mov     EBX,  dword [EBP-16]
        add     EBX,  dword [EBP+8]
        mov     BL,   byte  [EBX+0]
        cmp     AL,   BL
        je      @10068
@10064: 
        inc     dword [EBP-28]
        mov     EAX,  dword [EBP-12]
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        ja      @10066
@10065: 
        mov     EAX,  @@TEXT+154
        push    EAX
        call    @10050    ; Stop
@10066: 
@10067: 
        jmp     @10063
@10068: 
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [EBP-12]
        mul     EBX
        mov     EBX,  dword [EBP-28]
        add     EAX,  EBX
        mov     dword [EBP-28], EAX
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [EBP-28]
        xchg    EAX,  EBX
        xor     EDX,  EDX
        div     EBX
        xchg    EAX,  EDX
        mov     dword [EBP-20], EAX
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [EBP-12]
        mul     EBX
        push    EAX
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [EBP-28]
        xchg    EAX,  EBX
        xor     EDX,  EDX
        div     EBX
        pop     EBX
        add     EAX,  EBX
        mov     dword [EBP-28], EAX
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [EBP-28]
        xchg    EAX,  EBX
        xor     EDX,  EDX
        div     EBX
        xchg    EAX,  EDX
        mov     dword [EBP-24], EAX
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [EBP-28]
        xchg    EAX,  EBX
        xor     EDX,  EDX
        div     EBX
        mov     dword [EBP-28], EAX
        mov     EAX,  dword [EBP-28]
        cmp     EAX,  0
        jbe     @10070
@10069: 
        mov     EAX,  @@TEXT+186
        push    EAX
        call    @10050    ; Stop
@10070: 
@10071: 
        inc     dword [EBP-16]
        jmp     @10061
@10072: 
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [EBP-8]
        mul     EBX
        mov     EBX,  dword [EBP-20]
        add     EAX,  EBX
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10073:        ;Copy
        push    EBP
        mov     EBP,  ESP
@10074: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP+16]
        cmp     EAX,  EBX
        jbe     @10080
@10075: 
        mov     EAX,  dword [EBP+16]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  0
        jne     @10080
@10076: 
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+16]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10078
@10077: 
        mov     EAX,  @@TEXT+241
        push    EAX
        call    @10050    ; Stop
@10078: 
@10079: 
        inc     dword [EBP+16]
        jmp     @10074
@10080: 
        mov     EAX,  dword [EBP+12]
        mov     AL,   byte  [EAX+0]
        push    EAX
        call    @10011    ; isalpha
        cmp     EAX,  0
        je      @10082
@10081: 
        mov     EAX,  @@TEXT+241
        push    EAX
        call    @10050    ; Stop
@10082: 
@10083: 
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     ESP,  EBP
        pop     EBP
        ret     12

@10084:        ;Find
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@10085: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-4]
        cmp     EAX,  EBX
        jbe     @10093
@10086: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        mov     EAX,  dword [EBP-4]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10091
@10087: 
@10088: 
        mov     EAX,  dword [EBP-4]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  1
        jne     @10090
@10089: 
        mov     EAX,  dword [EBP-4]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        mov     dword [EBP-4], EAX
        jmp     @10088
@10090: 
        jmp     @10093
@10091: 
@10092: 
        inc     dword [EBP-4]
        jmp     @10085
@10093: 
        mov     EAX,  dword [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10094:        ;FindIncl
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@10095: 
        mov     EAX,  dword [@@DATA+4716564]
        mov     EBX,  dword [EBP-4]
        cmp     EAX,  EBX
        jbe     @10100
@10096: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        mov     EAX,  dword [EBP-4]
        imul    EAX,  256
        add     EAX,  @@DATA+4585492
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10098
@10097: 
        jmp     @10100
@10098: 
@10099: 
        inc     dword [EBP-4]
        jmp     @10095
@10100: 
        mov     EAX,  dword [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10101:        ;Word
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        inc     dword [@@DATA+73728]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10102:        ;Base
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  3
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+36], EAX
        mov     EAX,  dword [EBP+12]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        inc     dword [@@DATA+73728]
        mov     ESP,  EBP
        pop     EBP
        ret     8

@10103:        ;Read
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  260
        mov     EAX,  dword [@@DATA+4749816]
        cmp     EAX,  0
        je      @10105
@10104: 
        mov     AL,   32
        mov     ESP,  EBP
        pop     EBP
        ret     0
@10105: 
@10106: 
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@10107: 
        mov     EAX,  dword [@@DATA+4749760]
        mov     EBX,  dword [@@DATA+4749764]
        cmp     EAX,  EBX
        ja      @10120
@10108: 
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  0
        jne     @10113
@10109: 
        mov     EAX,  4096
        push    EAX
        mov     EAX,  dword [@@DATA+4716988]
        add     EAX,  @@DATA+4716992
        push    EAX
        mov     EAX,  dword [@@DATA+4749800]
        push    EAX
        call    @10003    ; read
        mov     EBX,  dword [@@DATA+4716988]
        add     EAX,  EBX
        mov     dword [@@DATA+4749760], EAX
        mov     EAX,  dword [@@DATA+4716988]
        mov     dword [@@DATA+4749764], EAX
        mov     EAX,  1
        mov     dword [EBP-4], EAX
        mov     EAX,  dword [@@DATA+4749820]
        cmp     EAX,  0
        je      @10111
@10110: 
        mov     EAX,  1
        mov     dword [@@DATA+4749804], EAX
        mov     EAX,  1
        mov     dword [@@DATA+4749808], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749820], EAX
@10111: 
@10112: 
        jmp     @10119
@10113: 
        mov     EAX,  dword [@@DATA+4716984]
        cmp     EAX,  1
        jae     @10116
@10115: 
        mov     AL,   0
        mov     ESP,  EBP
        pop     EBP
        ret     0
@10116: 
@10117: 
        mov     EAX,  @@TEXT+1046
        push    EAX
        mov     EAX,  dword [@@DATA+4749804]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+1044
        push    EAX
        mov     EAX,  @@DATA+4749768
        push    EAX
        mov     EAX,  @@TEXT+1042
        push    EAX
        lea     EAX,  [EBP-260]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10006    ; puts
        mov     EAX,  dword [@@DATA+4749800]
        push    EAX
        call    @10005    ; close
        dec     dword [@@DATA+4716984]
        mov     EAX,  dword [@@DATA+4716984]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+4716600]
        mov     dword [@@DATA+4749800], EAX
        mov     EAX,  dword [@@DATA+4716984]
        imul    EAX,  52
        add     EAX,  @@DATA+4716568
        push    EAX
        mov     EAX,  @@DATA+4749768
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  dword [@@DATA+4716984]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+4716604]
        mov     dword [@@DATA+4749760], EAX
        mov     EAX,  dword [@@DATA+4716984]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+4716608]
        mov     dword [@@DATA+4749764], EAX
        mov     EAX,  dword [@@DATA+4716984]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+4716612]
        mov     dword [@@DATA+4749804], EAX
        mov     EAX,  dword [@@DATA+4716984]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+4716616]
        mov     dword [@@DATA+4749808], EAX
        mov     EAX,  dword [@@DATA+4716988]
        sub     EAX,  4096
        mov     dword [@@DATA+4716988], EAX
        mov     EAX,  1
        mov     dword [@@DATA+4749816], EAX
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@10119: 
        jmp     @10107
@10120: 
        mov     EAX,  dword [@@DATA+4749764]
        mov     AL,   byte  [@@DATA+EAX+4716992]
        mov     ESP,  EBP
        pop     EBP
        ret     0

@10121:        ;Next
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  dword [@@DATA+4716984]
        mov     dword [@@DATA+4749812], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749816], EAX
        inc     dword [@@DATA+4749808]
        inc     dword [@@DATA+4749764]
        mov     ESP,  EBP
        pop     EBP
        ret     0

@10122:        ;Prev
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  dword [@@DATA+4716984]
        mov     dword [@@DATA+4749812], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749816], EAX
        dec     dword [@@DATA+4749808]
        dec     dword [@@DATA+4749764]
        mov     ESP,  EBP
        pop     EBP
        ret     0

@10123:        ;Sign
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        call    @10103    ; Read
        mov     byte  [EBP-4], AL
        call    @10121    ; Next
        mov     AL,   byte  [EBP-4]
        cmp     AL,   126
        jne     @10130
@10124: 
        call    @10103    ; Read
        mov     byte  [EBP-4], AL
        mov     AL,   byte  [EBP-4]
        cmp     AL,   110
        je      @10125
        cmp     AL,   114
        je      @10126
        cmp     AL,   116
        je      @10127
        cmp     AL,   48
        je      @10128
        jmp     @10129
@10125: 
        mov     AL,   10
        mov     byte  [EBP-4], AL
        jmp     @10129
@10126: 
        mov     AL,   13
        mov     byte  [EBP-4], AL
        jmp     @10129
@10127: 
        mov     AL,   9
        mov     byte  [EBP-4], AL
        jmp     @10129
@10128: 
        mov     AL,   0
        mov     byte  [EBP-4], AL
        jmp     @10129
@10129: 
        call    @10121    ; Next
@10130: 
@10131: 
        mov     AL,   byte  [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     0

@10132:        ;Line
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  @@TEXT+1050
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  1
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+44], EAX
        mov     EAX,  dword [@@DATA+391180]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+48], EAX
@10133: 
        call    @10103    ; Read
        cmp     AL,   34
        je      @10142
@10134: 
        call    @10103    ; Read
        cmp     AL,   13
        je      @10136
@10135: 
        call    @10103    ; Read
        cmp     AL,   10
        jne     @10137
@10136: 
        mov     EAX,  @@TEXT+464
        push    EAX
        call    @10050    ; Stop
@10137: 
@10138: 
        mov     EAX,  dword [@@DATA+391180]
        cmp     EAX,  262144
        jb      @10140
@10139: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@10140: 
@10141: 
        call    @10123    ; Sign
        mov     EBX,  dword [@@DATA+391180]
        mov     byte  [@@DATA+EBX+129036], AL
        inc     dword [@@DATA+391180]
        jmp     @10133
@10142: 
        call    @10121    ; Next
        mov     EAX,  dword [@@DATA+391180]
        cmp     EAX,  262144
        jb      @10144
@10143: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@10144: 
@10145: 
        mov     AL,   0
        mov     EBX,  dword [@@DATA+391180]
        mov     byte  [@@DATA+EBX+129036], AL
        inc     dword [@@DATA+391180]
        mov     EAX,  dword [@@DATA+391180]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+52], EAX
        mov     ESP,  EBP
        pop     EBP
        ret     0

@10146:        ;Scan
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  8
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@10147: 
@10149: 
        call    @10103    ; Read
        cmp     AL,   10
        je      @10153
@10150: 
        call    @10103    ; Read
        cmp     AL,   13
        je      @10153
@10151: 
        call    @10103    ; Read
        cmp     AL,   9
        je      @10153
@10152: 
        call    @10103    ; Read
        cmp     AL,   32
        jne     @10160
@10153: 
        call    @10103    ; Read
        cmp     AL,   10
        jne     @10158
@10154: 
        mov     EAX,  dword [@@DATA+4749804]
        mov     EBX,  100
        xor     EDX,  EDX
        div     EBX
        xchg    EAX,  EDX
        cmp     EAX,  0
        jne     @10156
@10155: 
        mov     EAX,  @@TEXT+1059
        push    EAX
        mov     EAX,  dword [@@DATA+4749804]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+1057
        push    EAX
        mov     EAX,  @@DATA+4749768
        push    EAX
        mov     EAX,  @@TEXT+1055
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10006    ; puts
@10156: 
@10157: 
        mov     EAX,  0
        mov     dword [@@DATA+4749808], EAX
        inc     dword [@@DATA+4749804]
@10158: 
@10159: 
        call    @10121    ; Next
        jmp     @10149
@10160: 
        call    @10103    ; Read
        cmp     AL,   47
        jne     @10177
@10161: 
        call    @10121    ; Next
        call    @10103    ; Read
        cmp     AL,   42
        jne     @10163
@10162: 
        call    @10121    ; Next
        inc     dword [EBP-4]
        jmp     @10147
@10163: 
@10164: 
        call    @10103    ; Read
        cmp     AL,   47
        jne     @10172
@10165: 
@10166: 
        call    @10103    ; Read
        cmp     AL,   10
        je      @10171
@10167: 
        call    @10103    ; Read
        cmp     AL,   0
        jne     @10169
@10168: 
        mov     EAX,  @@TEXT+122
        push    EAX
        call    @10050    ; Stop
@10169: 
@10170: 
        call    @10121    ; Next
        jmp     @10166
@10171: 
        jmp     @10147
@10172: 
@10173: 
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  0
        jbe     @10175
@10174: 
        jmp     @10147
@10175: 
@10176: 
        mov     EAX,  @@TEXT+1061
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     ESP,  EBP
        pop     EBP
        ret     4
@10177: 
@10178: 
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  0
        jne     @10180
@10179: 
        jmp     @10191
@10180: 
@10181: 
        call    @10103    ; Read
        cmp     AL,   42
        jne     @10186
@10182: 
        call    @10121    ; Next
        call    @10103    ; Read
        cmp     AL,   47
        jne     @10184
@10183: 
        call    @10121    ; Next
        dec     dword [EBP-4]
@10184: 
@10185: 
        jmp     @10147
@10186: 
@10187: 
        call    @10103    ; Read
        cmp     AL,   0
        jne     @10189
@10188: 
        mov     EAX,  @@TEXT+122
        push    EAX
        call    @10050    ; Stop
@10189: 
@10190: 
        call    @10121    ; Next
        jmp     @10147
@10191: 
        mov     EAX,  0
        mov     dword [EBP-8], EAX
@10192: 
        call    @10103    ; Read
        push    EAX
        call    @10011    ; isalpha
        cmp     EAX,  0
        je      @10194
@10193: 
        call    @10103    ; Read
        push    EAX
        call    @10019    ; isdigit
        cmp     EAX,  0
        jne     @10198
@10194: 
        call    @10103    ; Read
        mov     EBX,  dword [EBP-8]
        add     EBX,  dword [EBP+8]
        mov     byte  [EBX+0], AL
        inc     dword [EBP-8]
        mov     EAX,  dword [EBP-8]
        cmp     EAX,  32
        jb      @10196
@10195: 
        mov     EAX,  @@TEXT+211
        push    EAX
        call    @10050    ; Stop
@10196: 
@10197: 
        call    @10121    ; Next
        jmp     @10192
@10198: 
        mov     EAX,  dword [EBP-8]
        cmp     EAX,  0
        jne     @10217
@10199: 
        call    @10103    ; Read
        mov     EBX,  dword [EBP-8]
        add     EBX,  dword [EBP+8]
        mov     byte  [EBX+0], AL
        inc     dword [EBP-8]
        call    @10121    ; Next
        mov     EAX,  0
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   33
        je      @10200
        cmp     AL,   60
        je      @10204
        cmp     AL,   62
        je      @10208
        cmp     AL,   58
        je      @10212
        jmp     @10216
@10200: 
        call    @10103    ; Read
        cmp     AL,   61
        jne     @10202
@10201: 
        call    @10121    ; Next
        mov     EAX,  @@TEXT+1063
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     ESP,  EBP
        pop     EBP
        ret     4
@10202: 
@10203: 
        jmp     @10216
@10204: 
        call    @10103    ; Read
        cmp     AL,   61
        jne     @10206
@10205: 
        call    @10121    ; Next
        mov     EAX,  @@TEXT+1066
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     ESP,  EBP
        pop     EBP
        ret     4
@10206: 
@10207: 
        jmp     @10216
@10208: 
        call    @10103    ; Read
        cmp     AL,   61
        jne     @10210
@10209: 
        call    @10121    ; Next
        mov     EAX,  @@TEXT+1069
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     ESP,  EBP
        pop     EBP
        ret     4
@10210: 
@10211: 
        jmp     @10216
@10212: 
        call    @10103    ; Read
        cmp     AL,   61
        jne     @10214
@10213: 
        call    @10121    ; Next
        mov     EAX,  @@TEXT+1072
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     ESP,  EBP
        pop     EBP
        ret     4
@10214: 
@10215: 
        jmp     @10216
@10216: 
@10217: 
@10218: 
        mov     AL,   0
        mov     EBX,  dword [EBP-8]
        add     EBX,  dword [EBP+8]
        mov     byte  [EBX+0], AL
        mov     EAX,  dword [EBP+8]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10219:        ;List
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  16
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-4], EAX
@10220: 
        mov     EAX,  @@TEXT+1075
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10261
@10221: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10084    ; Find
        mov     dword [EBP-8], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        jbe     @10223
@10222: 
        mov     EAX,  dword [EBP-8]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  3
        je      @10224
@10223: 
        mov     EAX,  @@TEXT+696
        push    EAX
        call    @10050    ; Stop
@10224: 
@10225: 
@10226: 
        mov     EAX,  0
        mov     dword [EBP-12], EAX
@10228: 
        mov     EAX,  @@TEXT+1077
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10230
@10229: 
        inc     dword [EBP-12]
        jmp     @10228
@10230: 
        mov     EAX,  @@TEXT+1079
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        jne     @10233
@10231: 
        mov     EAX,  dword [EBP-12]
        cmp     EAX,  1
        jae     @10233
@10232: 
        mov     EAX,  @@TEXT+724
        push    EAX
        call    @10050    ; Stop
@10233: 
@10234: 
        mov     EAX,  dword [EBP-8]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  2
        jne     @10237
@10235: 
        mov     EAX,  dword [EBP-12]
        cmp     EAX,  1
        jae     @10237
@10236: 
        mov     EAX,  @@TEXT+744
        push    EAX
        call    @10050    ; Stop
@10237: 
@10238: 
        mov     EAX,  dword [EBP-4]
        mov     dword [EBP-16], EAX
@10239: 
        mov     EAX,  dword [@@DATA+126980]
        mov     EBX,  dword [EBP-16]
        cmp     EAX,  EBX
        jbe     @10244
@10240: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        mov     EAX,  dword [EBP-16]
        imul    EAX,  52
        add     EAX,  @@DATA+73732
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10242
@10241: 
        mov     EAX,  @@TEXT+291
        push    EAX
        call    @10050    ; Stop
@10242: 
@10243: 
        inc     dword [EBP-16]
        jmp     @10239
@10244: 
        mov     EAX,  dword [@@DATA+126980]
        cmp     EAX,  1024
        jb      @10246
@10245: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@10246: 
@10247: 
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73764], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        mov     EAX,  dword [@@DATA+126980]
        imul    EAX,  52
        add     EAX,  @@DATA+73732
        push    EAX
        call    @10073    ; Copy
        mov     EAX,  dword [EBP-12]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73768], EAX
        inc     dword [@@DATA+126980]
        mov     EAX,  @@TEXT+1084
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10249
@10248: 
        jmp     @10251
@10249: 
@10250: 
        jmp     @10226
@10251: 
        mov     EAX,  @@TEXT+1086
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10259
@10252: 
        mov     EAX,  @@TEXT+1088
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10254
@10253: 
        mov     EAX,  @@TEXT+828
        push    EAX
        call    @10050    ; Stop
@10254: 
@10255: 
        mov     EAX,  @@TEXT+1090
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10257
@10256: 
        mov     EAX,  @@TEXT+696
        push    EAX
        call    @10050    ; Stop
@10257: 
@10258: 
@10259: 
@10260: 
        jmp     @10220
@10261: 
        mov     EAX,  dword [@@DATA+126980]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10262:        ;Peek
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  dword [@@DATA+4585488]
        mov     dword [EBP-4], EAX
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  262144
        jb      @10264
@10263: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@10264: 
@10265: 
        mov     EAX,  262144
        mov     EBX,  dword [@@DATA+4585488]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  262144
        mov     EBX,  dword [@@DATA+4585488]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        inc     dword [@@DATA+4585488]
        mov     EAX,  dword [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     0

@10266:        ;Cast
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  8
        mov     EAX,  @@TEXT+1092
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+8]
        cmp     EAX,  EBX
        jne     @10269
@10267: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10269
@10268: 
        mov     EAX,  4
        mov     EBX,  dword [EBP+16]
        mov     EBX,  dword [EBX+0]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     ESP,  EBP
        pop     EBP
        ret     12
@10269: 
@10270: 
        call    @10262    ; Peek
        mov     dword [EBP-4], EAX
        call    @10262    ; Peek
        mov     dword [EBP-8], EAX
        mov     EAX,  46
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+8]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-4]
        mov     EBX,  dword [EBP+16]
        mov     dword [EBX+0], EAX
        mov     ESP,  EBP
        pop     EBP
        ret     12

@10271:        ;Test
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  8
        mov     EAX,  dword [EBP+16]
        mov     EBX,  dword [EBP+8]
        cmp     EAX,  EBX
        jne     @10274
@10272: 
        mov     EAX,  dword [EBP+20]
        mov     EBX,  dword [EBP+12]
        cmp     EAX,  EBX
        jne     @10274
@10273: 
        mov     ESP,  EBP
        pop     EBP
        ret     20
        jmp     @10349
@10274: 
        mov     EAX,  @@TEXT+1096
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+8]
        cmp     EAX,  EBX
        jne     @10278
@10275: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        jne     @10278
@10276: 
        mov     EAX,  dword [EBP+20]
        cmp     EAX,  1
        jne     @10278
@10277: 
        mov     EAX,  dword [EBP+24]
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10266    ; Cast
        mov     ESP,  EBP
        pop     EBP
        ret     20
        jmp     @10349
@10278: 
        mov     EAX,  @@TEXT+1101
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+8]
        cmp     EAX,  EBX
        jne     @10283
@10279: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        jne     @10283
@10280: 
        mov     EAX,  @@TEXT+1106
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+16]
        cmp     EAX,  EBX
        jne     @10283
@10281: 
        mov     EAX,  dword [EBP+20]
        cmp     EAX,  0
        jne     @10283
@10282: 
        mov     ESP,  EBP
        pop     EBP
        ret     20
        jmp     @10349
@10283: 
        mov     EAX,  @@TEXT+1111
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+8]
        cmp     EAX,  EBX
        jne     @10288
@10284: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        jne     @10288
@10285: 
        mov     EAX,  @@TEXT+1116
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+16]
        cmp     EAX,  EBX
        jne     @10288
@10286: 
        mov     EAX,  dword [EBP+20]
        cmp     EAX,  0
        jne     @10288
@10287: 
        mov     ESP,  EBP
        pop     EBP
        ret     20
        jmp     @10349
@10288: 
        mov     EAX,  @@TEXT+1120
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+8]
        cmp     EAX,  EBX
        jne     @10293
@10289: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        jne     @10293
@10290: 
        mov     EAX,  @@TEXT+1125
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+16]
        cmp     EAX,  EBX
        jne     @10293
@10291: 
        mov     EAX,  dword [EBP+20]
        cmp     EAX,  0
        jne     @10293
@10292: 
        mov     EAX,  dword [EBP+24]
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10266    ; Cast
        mov     ESP,  EBP
        pop     EBP
        ret     20
        jmp     @10349
@10293: 
        mov     EAX,  @@TEXT+1130
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+8]
        cmp     EAX,  EBX
        jne     @10298
@10294: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        jne     @10298
@10295: 
        mov     EAX,  @@TEXT+1135
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+16]
        cmp     EAX,  EBX
        jne     @10298
@10296: 
        mov     EAX,  dword [EBP+20]
        cmp     EAX,  0
        jne     @10298
@10297: 
        mov     ESP,  EBP
        pop     EBP
        ret     20
        jmp     @10349
@10298: 
        mov     EAX,  @@TEXT+1139
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+8]
        cmp     EAX,  EBX
        jne     @10303
@10299: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        jne     @10303
@10300: 
        mov     EAX,  @@TEXT+1143
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+16]
        cmp     EAX,  EBX
        jne     @10303
@10301: 
        mov     EAX,  dword [EBP+20]
        cmp     EAX,  0
        jne     @10303
@10302: 
        mov     EAX,  dword [EBP+24]
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10266    ; Cast
        mov     ESP,  EBP
        pop     EBP
        ret     20
        jmp     @10349
@10303: 
        mov     EAX,  @@TEXT+1148
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+8]
        cmp     EAX,  EBX
        jne     @10308
@10304: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        jne     @10308
@10305: 
        mov     EAX,  @@TEXT+1152
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+16]
        cmp     EAX,  EBX
        jne     @10308
@10306: 
        mov     EAX,  dword [EBP+20]
        cmp     EAX,  0
        jne     @10308
@10307: 
        mov     ESP,  EBP
        pop     EBP
        ret     20
        jmp     @10349
@10308: 
        mov     EAX,  @@TEXT+1157
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+8]
        cmp     EAX,  EBX
        jne     @10314
@10309: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        jbe     @10311
@10310: 
        mov     EAX,  dword [EBP+12]
        mov     EBX,  dword [EBP+20]
        cmp     EAX,  EBX
        je      @10313
@10311: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  1
        jne     @10314
@10312: 
        mov     EAX,  dword [EBP+20]
        cmp     EAX,  0
        jbe     @10314
@10313: 
        mov     ESP,  EBP
        pop     EBP
        ret     20
        jmp     @10349
@10314: 
        mov     EAX,  @@TEXT+1162
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+16]
        cmp     EAX,  EBX
        jne     @10320
@10315: 
        mov     EAX,  dword [EBP+20]
        cmp     EAX,  0
        jbe     @10317
@10316: 
        mov     EAX,  dword [EBP+20]
        mov     EBX,  dword [EBP+12]
        cmp     EAX,  EBX
        je      @10319
@10317: 
        mov     EAX,  dword [EBP+20]
        cmp     EAX,  1
        jne     @10320
@10318: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        jbe     @10320
@10319: 
        mov     ESP,  EBP
        pop     EBP
        ret     20
        jmp     @10349
@10320: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  3
        jne     @10348
@10321: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  2
        jne     @10348
@10322: 
        mov     EAX,  dword [EBP+16]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  5
        jne     @10348
@10323: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        mov     EBX,  dword [EBP+16]
        imul    EBX,  72
        mov     EBX,  dword [@@DATA+EBX+40]
        cmp     EAX,  EBX
        jne     @10346
@10324: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        mov     EBX,  dword [EBP+16]
        imul    EBX,  72
        mov     EBX,  dword [@@DATA+EBX+44]
        cmp     EAX,  EBX
        jne     @10344
@10325: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-4], EAX
        mov     EAX,  dword [EBP+16]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-8], EAX
@10326: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-4]
        cmp     EAX,  EBX
        ja      @10332
@10328: 
        mov     EAX,  dword [EBP+16]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        jbe     @10330
@10329: 
        jmp     @10343
@10330: 
@10331: 
        mov     ESP,  EBP
        pop     EBP
        ret     20
@10332: 
@10333: 
        mov     EAX,  dword [EBP+16]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        ja      @10335
@10334: 
        jmp     @10343
@10335: 
@10336: 
        mov     EAX,  dword [EBP-4]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        mov     EBX,  dword [EBP-8]
        imul    EBX,  52
        mov     EBX,  dword [@@DATA+EBX+73764]
        cmp     EAX,  EBX
        je      @10338
@10337: 
        jmp     @10343
@10338: 
@10339: 
        mov     EAX,  dword [EBP-4]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        mov     EBX,  dword [EBP-8]
        imul    EBX,  52
        mov     EBX,  dword [@@DATA+EBX+73768]
        cmp     EAX,  EBX
        je      @10341
@10340: 
        jmp     @10343
@10341: 
@10342: 
        inc     dword [EBP-8]
        inc     dword [EBP-4]
        jmp     @10326
@10343: 
@10344: 
@10345: 
@10346: 
@10347: 
@10348: 
@10349: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
        mov     ESP,  EBP
        pop     EBP
        ret     20

@10350:        ;Not
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  13
        je      @10351
        cmp     EAX,  14
        je      @10352
        cmp     EAX,  15
        je      @10353
        cmp     EAX,  16
        je      @10354
        cmp     EAX,  20
        je      @10355
        cmp     EAX,  21
        je      @10356
        cmp     EAX,  22
        je      @10357
        cmp     EAX,  23
        je      @10358
        cmp     EAX,  24
        je      @10359
        cmp     EAX,  25
        je      @10360
        jmp     @10361
@10351: 
        mov     EAX,  16
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @10350    ; Not
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @10350    ; Not
        jmp     @10362
@10352: 
        mov     EAX,  15
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10362
@10353: 
        mov     EAX,  14
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10362
@10354: 
        mov     EAX,  13
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @10350    ; Not
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @10350    ; Not
        jmp     @10362
@10355: 
        mov     EAX,  24
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10362
@10356: 
        mov     EAX,  25
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10362
@10357: 
        mov     EAX,  23
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10362
@10358: 
        mov     EAX,  22
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10362
@10359: 
        mov     EAX,  20
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10362
@10360: 
        mov     EAX,  21
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10362
@10361: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @10362
@10362: 
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10363:        ;Dup
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  262144
        jb      @10365
@10364: 
        mov     EAX,  dword [EBP+8]
        mov     ESP,  EBP
        pop     EBP
        ret     4
@10365: 
@10366: 
        call    @10262    ; Peek
        mov     dword [EBP-4], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @10363    ; Dup
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @10363    ; Dup
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  dword [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10367:        ;Expr
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  68
        mov     EAX,  0
        mov     dword [EBP-4], EAX
        mov     EAX,  0
        mov     dword [EBP-8], EAX
        mov     EAX,  @@TEXT+1167
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10372
@10368: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     dword [EBP-12], EAX
        mov     EAX,  @@TEXT+1169
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10370
@10369: 
        mov     EAX,  @@TEXT+304
        push    EAX
        call    @10050    ; Stop
@10370: 
@10371: 
        jmp     @10663
@10372: 
        mov     EAX,  @@TEXT+1171
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10389
@10373: 
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  1
        jbe     @10375
@10374: 
        mov     EAX,  @@TEXT+529
        push    EAX
        call    @10050    ; Stop
@10375: 
@10376: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  4
        push    EAX
        call    @10367    ; Expr
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  1024
        jae     @10379
@10377: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jbe     @10379
@10378: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10379: 
@10380: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1173
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10382
@10381: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1178
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10383
@10382: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  11
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-16]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        jmp     @10388
@10383: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  1024
        jb      @10385
@10384: 
        mov     EAX,  dword [EBP-16]
        push    EAX
        call    @10350    ; Not
        mov     EAX,  dword [EBP-16]
        mov     dword [EBP-12], EAX
        jmp     @10388
@10385: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10388: 
        mov     EAX,  1
        mov     dword [EBP-4], EAX
        jmp     @10663
@10389: 
        mov     EAX,  @@TEXT+1183
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10409
@10390: 
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  2
        jbe     @10392
@10391: 
        mov     EAX,  @@TEXT+529
        push    EAX
        call    @10050    ; Stop
@10392: 
@10393: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  12
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  4
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10403
@10394: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        cmp     EAX,  2147483648
        jbe     @10396
@10395: 
        mov     EAX,  @@TEXT+872
        push    EAX
        call    @10050    ; Stop
@10396: 
@10397: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        cmp     EAX,  0
        je      @10399
@10398: 
        mov     EAX,  4
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  @@TEXT+1185
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10402
@10399: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  @@TEXT+1189
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
@10402: 
        jmp     @10408
@10403: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        jne     @10405
@10404: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  @@TEXT+1194
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10408
@10405: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        push    EAX
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  @@TEXT+1199
        push    EAX
        call    @10084    ; Find
        push    EAX
        call    @10271    ; Test
        mov     EAX,  @@TEXT+1203
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
@10408: 
        mov     EAX,  1
        mov     dword [EBP-4], EAX
        jmp     @10663
@10409: 
        mov     EAX,  @@TEXT+1207
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10414
@10410: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10054    ; val
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  255
        jbe     @10412
@10411: 
        mov     EAX,  @@TEXT+186
        push    EAX
        call    @10050    ; Stop
@10412: 
@10413: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  2
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-16]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  @@TEXT+1209
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP+16]
        mov     dword [EBX+0], EAX
        jmp     @10663
@10414: 
        mov     EAX,  @@TEXT+1214
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10419
@10415: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  2
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        call    @10123    ; Sign
        and     EAX,  0FFH
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  @@TEXT+1216
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP+16]
        mov     dword [EBX+0], EAX
        call    @10103    ; Read
        cmp     AL,   39
        je      @10417
@10416: 
        mov     EAX,  @@TEXT+464
        push    EAX
        call    @10050    ; Stop
@10417: 
@10418: 
        call    @10121    ; Next
        jmp     @10663
@10419: 
        mov     EAX,  @@TEXT+1221
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10421
@10420: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  1
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  @@TEXT+1226
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  1
        mov     EBX,  dword [EBP+16]
        mov     dword [EBX+0], EAX
        jmp     @10663
@10421: 
        mov     EAX,  dword [EBP+20]
        mov     AL,   byte  [EAX+0]
        push    EAX
        call    @10019    ; isdigit
        cmp     EAX,  0
        jne     @10423
@10422: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  3
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10054    ; val
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  @@TEXT+1231
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP+16]
        mov     dword [EBX+0], EAX
        jmp     @10663
@10423: 
        mov     EAX,  0
        mov     EBX,  dword [EBP+16]
        mov     dword [EBX+0], EAX
@10425: 
        mov     EAX,  @@TEXT+1236
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10427
@10426: 
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        jmp     @10425
@10427: 
        mov     EAX,  0
        mov     dword [EBP-16], EAX
        mov     EAX,  0
        mov     dword [EBP-20], EAX
        mov     EAX,  0
        mov     dword [EBP-24], EAX
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  0
        jne     @10438
@10428: 
        mov     EAX,  @@TEXT+1238
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10436
@10429: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jbe     @10431
@10430: 
        mov     EAX,  @@TEXT+482
        push    EAX
        call    @10050    ; Stop
@10431: 
@10432: 
        mov     EAX,  1
        mov     EBX,  dword [EBP+16]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @10434
@10433: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@10434: 
@10435: 
        mov     EAX,  2
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  @@TEXT+1240
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        call    @10132    ; Line
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  6
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  @@TEXT+1241
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  1
        mov     dword [EBP-4], EAX
        inc     dword [@@DATA+73728]
@10436: 
@10437: 
@10438: 
@10439: 
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  0
        jne     @10447
@10440: 
        mov     EAX,  dword [@@DATA+4749828]
        mov     dword [EBP-28], EAX
@10441: 
        mov     EAX,  dword [@@DATA+126980]
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        jbe     @10446
@10442: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  52
        add     EAX,  @@DATA+73732
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10444
@10443: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  9
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [@@DATA+4749828]
        mov     EBX,  dword [EBP-28]
        xchg    EAX,  EBX
        sub     EAX,  EBX
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73772]
        mov     dword [EBP-20], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73776]
        mov     dword [EBP-24], EAX
        mov     EAX,  1
        mov     dword [EBP-4], EAX
        jmp     @10446
@10444: 
@10445: 
        inc     dword [EBP-28]
        jmp     @10441
@10446: 
@10447: 
@10448: 
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  0
        jne     @10456
@10449: 
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-28], EAX
@10450: 
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        jbe     @10455
@10451: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  52
        add     EAX,  @@DATA+73732
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10453
@10452: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  8
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        mov     dword [EBP-16], EAX
        mov     EAX,  1
        mov     dword [EBP-4], EAX
        jmp     @10455
@10453: 
@10454: 
        inc     dword [EBP-28]
        jmp     @10450
@10455: 
@10456: 
@10457: 
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  0
        jne     @10554
@10458: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10084    ; Find
        mov     dword [EBP-28], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        ja      @10460
@10459: 
        mov     EAX,  @@TEXT+264
        push    EAX
        call    @10050    ; Stop
@10460: 
@10461: 
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  2
        je      @10462
        cmp     EAX,  4
        je      @10472
        cmp     EAX,  5
        je      @10472
        cmp     EAX,  3
        je      @10499
        jmp     @10552
@10462: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        push    EAX
        mov     EAX,  @@TEXT+1246
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10464
@10463: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        jmp     @10471
@10464: 
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        push    EAX
        mov     EAX,  @@TEXT+1251
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10466
@10465: 
        mov     EAX,  4
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        jmp     @10471
@10466: 
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        cmp     EAX,  0
        jne     @10468
@10467: 
        mov     EAX,  2
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        jmp     @10471
@10468: 
        mov     EAX,  6
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
@10471: 
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10553
@10472: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  7
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  5
        jne     @10495
@10473: 
        mov     EAX,  @@TEXT+1255
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10487
@10474: 
        call    @10262    ; Peek
        mov     dword [EBP-32], EAX
        mov     EAX,  dword [EBP-32]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  31
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  1
        mov     dword [EBP-8], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        mov     dword [EBP-36], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-40], EAX
@10475: 
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-40]
        cmp     EAX,  EBX
        jbe     @10483
@10476: 
        call    @10262    ; Peek
        mov     dword [EBP-52], EAX
        mov     EAX,  49
        mov     EBX,  dword [EBP-52]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        lea     EAX,  [EBP-48]
        push    EAX
        lea     EAX,  [EBP-44]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-52]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-52]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        push    EAX
        mov     EAX,  dword [EBP-48]
        push    EAX
        mov     EAX,  dword [EBP-44]
        push    EAX
        mov     EAX,  dword [EBP-40]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        push    EAX
        mov     EAX,  dword [EBP-40]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        push    EAX
        call    @10271    ; Test
        mov     EAX,  dword [EBP-52]
        mov     EBX,  dword [EBP-36]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-52]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-36], EAX
        inc     dword [EBP-40]
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-40]
        cmp     EAX,  EBX
        jbe     @10481
@10477: 
        mov     EAX,  @@TEXT+1257
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10479
@10478: 
        mov     EAX,  @@TEXT+854
        push    EAX
        call    @10050    ; Stop
@10479: 
@10480: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
@10481: 
@10482: 
        jmp     @10475
@10483: 
        mov     EAX,  @@TEXT+1259
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10485
@10484: 
        mov     EAX,  @@TEXT+304
        push    EAX
        call    @10050    ; Stop
@10485: 
@10486: 
        jmp     @10494
@10487: 
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  5
        jae     @10490
@10489: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  1
        je      @10491
@10490: 
        mov     EAX,  @@TEXT+502
        push    EAX
        call    @10050    ; Stop
@10491: 
@10492: 
        mov     EAX,  5
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-12]
        mov     ESP,  EBP
        pop     EBP
        ret     16
@10494: 
        jmp     @10498
@10495: 
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-20], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     dword [EBP-24], EAX
@10498: 
        jmp     @10553
@10499: 
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  6
        jae     @10545
@10500: 
        mov     EAX,  @@TEXT+1261
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10502
@10501: 
        mov     EAX,  @@TEXT+304
        push    EAX
        call    @10050    ; Stop
@10502: 
@10503: 
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        call    @10262    ; Peek
        mov     dword [EBP-32], EAX
        mov     EAX,  46
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-32]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-16]
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  @@TEXT+1263
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10505
@10504: 
        mov     EAX,  @@TEXT+304
        push    EAX
        call    @10050    ; Stop
@10505: 
@10506: 
        mov     EAX,  @@TEXT+1265
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        jne     @10511
@10507: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  1
        jne     @10511
@10508: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1270
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10511
@10509: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  0
        jne     @10511
@10510: 
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10544
@10511: 
        mov     EAX,  @@TEXT+1275
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        jne     @10516
@10512: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jne     @10516
@10513: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1280
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10516
@10514: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  0
        jne     @10516
@10515: 
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10544
@10516: 
        mov     EAX,  @@TEXT+1285
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        jne     @10521
@10517: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jne     @10521
@10518: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1290
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10521
@10519: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  0
        jne     @10521
@10520: 
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10544
@10521: 
        mov     EAX,  @@TEXT+1295
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        jne     @10526
@10522: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jne     @10526
@10523: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1300
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10526
@10524: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  0
        jne     @10526
@10525: 
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10544
@10526: 
        mov     EAX,  @@TEXT+1304
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        jne     @10531
@10527: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jne     @10531
@10528: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1309
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10531
@10529: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  0
        jne     @10531
@10530: 
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10544
@10531: 
        mov     EAX,  @@TEXT+1314
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        jne     @10536
@10532: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jne     @10536
@10533: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1319
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10536
@10534: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  0
        jne     @10536
@10535: 
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10544
@10536: 
        mov     EAX,  @@TEXT+1324
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        jne     @10541
@10537: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jne     @10541
@10538: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1328
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10541
@10539: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  0
        jne     @10541
@10540: 
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10544
@10541: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10544: 
        jmp     @10551
@10545: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jbe     @10548
@10547: 
        mov     EAX,  @@TEXT+264
        push    EAX
        call    @10050    ; Stop
@10548: 
@10549: 
        mov     EAX,  262144
        mov     ESP,  EBP
        pop     EBP
        ret     16
@10551: 
        jmp     @10553
@10552: 
        mov     EAX,  @@TEXT+264
        push    EAX
        call    @10050    ; Stop
        jmp     @10553
@10553: 
@10554: 
@10555: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        mov     dword [EBP-28], EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        cmp     EAX,  262144
        jae     @10557
@10556: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-28], EAX
@10557: 
@10558: 
@10559: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  dword [EBP-20]
        mov     dword [EBP-32], EAX
@10561: 
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [EBP-20]
        cmp     EAX,  EBX
        jbe     @10573
@10562: 
        mov     EAX,  @@TEXT+1333
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10568
@10563: 
        mov     EAX,  dword [EBP-32]
        mov     EBX,  dword [EBP-20]
        cmp     EAX,  EBX
        jne     @10565
@10564: 
        mov     EAX,  @@TEXT+1335
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10566
@10565: 
        mov     EAX,  @@TEXT+304
        push    EAX
        call    @10050    ; Stop
@10566: 
@10567: 
        jmp     @10573
@10568: 
@10569: 
        call    @10262    ; Peek
        mov     dword [EBP-44], EAX
        mov     EAX,  33
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-20]
        shl     EAX,  2
        mov     EAX,  dword [@@DATA+EAX+126984]
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-40]
        push    EAX
        lea     EAX,  [EBP-36]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  @@TEXT+1337
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10571
@10570: 
        mov     EAX,  @@TEXT+304
        push    EAX
        call    @10050    ; Stop
@10571: 
@10572: 
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        push    EAX
        mov     EAX,  dword [EBP-40]
        push    EAX
        mov     EAX,  dword [EBP-36]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  @@TEXT+1339
        push    EAX
        call    @10084    ; Find
        push    EAX
        call    @10271    ; Test
        mov     EAX,  dword [EBP-44]
        mov     EBX,  dword [EBP-28]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-28], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        inc     dword [EBP-20]
        jmp     @10561
@10573: 
@10574: 
        mov     EAX,  @@TEXT+1344
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10582
@10575: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  1
        jae     @10577
@10576: 
        mov     EAX,  @@TEXT+502
        push    EAX
        call    @10050    ; Stop
@10577: 
@10578: 
        call    @10262    ; Peek
        mov     dword [EBP-44], EAX
        mov     EAX,  34
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-40]
        push    EAX
        lea     EAX,  [EBP-36]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  @@TEXT+1346
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10580
@10579: 
        mov     EAX,  @@TEXT+304
        push    EAX
        call    @10050    ; Stop
@10580: 
@10581: 
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        push    EAX
        mov     EAX,  dword [EBP-40]
        push    EAX
        mov     EAX,  dword [EBP-36]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  @@TEXT+1348
        push    EAX
        call    @10084    ; Find
        push    EAX
        call    @10271    ; Test
        mov     EAX,  dword [EBP-44]
        mov     EBX,  dword [EBP-28]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-28], EAX
        dec     dword [EBP-16]
        mov     EAX,  0
        mov     dword [EBP-8], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        jmp     @10574
@10582: 
        mov     EAX,  @@TEXT+1353
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10602
@10583: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  2
        je      @10585
@10584: 
        mov     EAX,  @@TEXT+668
        push    EAX
        call    @10050    ; Stop
@10585: 
@10586: 
@10587: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  0
        jbe     @10589
@10588: 
        call    @10262    ; Peek
        mov     dword [EBP-36], EAX
        mov     EAX,  34
        mov     EBX,  dword [EBP-36]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-36]
        mov     EBX,  dword [EBP-28]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-36]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-28], EAX
        dec     dword [EBP-16]
        mov     EAX,  0
        mov     dword [EBP-8], EAX
        jmp     @10587
@10589: 
        call    @10262    ; Peek
        mov     dword [EBP-36], EAX
        mov     EAX,  37
        mov     EBX,  dword [EBP-36]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-36]
        mov     EBX,  dword [EBP-28]
        mov     dword [EBX+0], EAX
        call    @10262    ; Peek
        mov     dword [EBP-40], EAX
        mov     EAX,  7
        mov     EBX,  dword [EBP-40]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        call    @10262    ; Peek
        mov     dword [EBP-44], EAX
        mov     EAX,  32
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-44]
        mov     EBX,  dword [EBP-40]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        call    @10262    ; Peek
        mov     dword [EBP-48], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-48]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-12]
        mov     EBX,  dword [EBP-48]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-48]
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-48]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-52], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-56], EAX
@10590: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-56]
        cmp     EAX,  EBX
        jbe     @10598
@10591: 
        call    @10262    ; Peek
        mov     dword [EBP-68], EAX
        mov     EAX,  49
        mov     EBX,  dword [EBP-68]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        lea     EAX,  [EBP-64]
        push    EAX
        lea     EAX,  [EBP-60]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-68]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-68]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        push    EAX
        mov     EAX,  dword [EBP-64]
        push    EAX
        mov     EAX,  dword [EBP-60]
        push    EAX
        mov     EAX,  dword [EBP-56]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        push    EAX
        mov     EAX,  dword [EBP-56]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        push    EAX
        call    @10271    ; Test
        mov     EAX,  dword [EBP-68]
        mov     EBX,  dword [EBP-52]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-68]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-52], EAX
        inc     dword [EBP-56]
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-56]
        cmp     EAX,  EBX
        jbe     @10596
@10592: 
        mov     EAX,  @@TEXT+1355
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10594
@10593: 
        mov     EAX,  @@TEXT+854
        push    EAX
        call    @10050    ; Stop
@10594: 
@10595: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
@10596: 
@10597: 
        jmp     @10590
@10598: 
        mov     EAX,  @@TEXT+1357
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10600
@10599: 
        mov     EAX,  @@TEXT+304
        push    EAX
        call    @10050    ; Stop
@10600: 
@10601: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        mov     dword [EBP-60], EAX
        mov     EAX,  dword [EBP-60]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-60]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        mov     dword [EBP-16], EAX
        mov     EAX,  0
        mov     dword [EBP-20], EAX
        mov     EAX,  0
        mov     dword [EBP-24], EAX
        mov     EAX,  1
        mov     dword [EBP-8], EAX
        mov     EAX,  dword [EBP-40]
        mov     dword [EBP-12], EAX
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-28], EAX
        jmp     @10625
@10602: 
        mov     EAX,  @@TEXT+1359
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10622
@10603: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  1
        je      @10605
@10604: 
        mov     EAX,  @@TEXT+431
        push    EAX
        call    @10050    ; Stop
@10605: 
@10606: 
@10607: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  0
        jbe     @10609
@10608: 
        call    @10262    ; Peek
        mov     dword [EBP-36], EAX
        mov     EAX,  34
        mov     EBX,  dword [EBP-36]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-36]
        mov     EBX,  dword [EBP-28]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-36]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-28], EAX
        dec     dword [EBP-16]
        mov     EAX,  0
        mov     dword [EBP-8], EAX
        jmp     @10607
@10609: 
        mov     EAX,  dword [EBP-8]
        cmp     EAX,  0
        je      @10611
@10610: 
        mov     EAX,  @@TEXT+915
        push    EAX
        call    @10050    ; Stop
@10611: 
@10612: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-36], EAX
@10613: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-36]
        cmp     EAX,  EBX
        ja      @10616
@10615: 
        mov     EAX,  @@TEXT+264
        push    EAX
        call    @10050    ; Stop
@10616: 
@10617: 
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP-36]
        imul    EAX,  52
        add     EAX,  @@DATA+73732
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10619
@10618: 
        jmp     @10621
@10619: 
@10620: 
        inc     dword [EBP-36]
        jmp     @10613
@10621: 
        call    @10262    ; Peek
        mov     dword [EBP-40], EAX
        mov     EAX,  35
        mov     EBX,  dword [EBP-40]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-36]
        mov     EBX,  dword [EBP-40]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-36]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-36]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP-36]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73772]
        mov     dword [EBP-20], EAX
        mov     EAX,  dword [EBP-36]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73776]
        mov     dword [EBP-24], EAX
        mov     EAX,  0
        mov     dword [EBP-8], EAX
        mov     EAX,  dword [EBP-40]
        mov     EBX,  dword [EBP-28]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-40]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-28], EAX
        jmp     @10625
@10622: 
        jmp     @10626
@10625: 
        jmp     @10559
@10626: 
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  6
        jb      @10634
@10627: 
        mov     EAX,  @@TEXT+1361
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10634
@10628: 
        mov     EAX,  @@TEXT+1363
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10634
@10629: 
        mov     EAX,  dword [EBP-8]
        cmp     EAX,  0
        je      @10631
@10630: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jbe     @10632
@10631: 
        mov     EAX,  @@TEXT+816
        push    EAX
        call    @10050    ; Stop
@10632: 
@10633: 
        mov     EAX,  0
        mov     dword [EBP-16], EAX
@10634: 
@10635: 
        mov     EAX,  262144
        mov     dword [EBP-32], EAX
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  5
        jae     @10645
@10636: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  dword [EBP-16]
        add     EAX,  1
        pop     EBX
        cmp     EAX,  EBX
        jae     @10638
@10637: 
        mov     EAX,  @@TEXT+502
        push    EAX
        call    @10050    ; Stop
@10638: 
@10639: 
        call    @10262    ; Peek
        mov     dword [EBP-32], EAX
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-16]
        cmp     EAX,  EBX
        jbe     @10641
@10640: 
        mov     EAX,  37
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10644
@10641: 
        mov     EAX,  36
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
@10644: 
        jmp     @10658
@10645: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-16]
        cmp     EAX,  EBX
        ja      @10654
@10647: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  2
        je      @10654
@10648: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        je      @10654
@10649: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  6
        je      @10654
@10650: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-16]
        cmp     EAX,  EBX
        jb      @10655
@10651: 
        mov     EAX,  dword [EBP-8]
        cmp     EAX,  0
        je      @10655
@10652: 
        mov     EAX,  @@TEXT+1366
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10654
@10653: 
        mov     EAX,  @@TEXT+1368
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10655
@10654: 
        mov     EAX,  @@TEXT+502
        push    EAX
        call    @10050    ; Stop
@10655: 
@10656: 
@10658: 
@10659: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-16]
        cmp     EAX,  EBX
        jae     @10661
@10660: 
        call    @10262    ; Peek
        mov     dword [EBP-36], EAX
        mov     EAX,  34
        mov     EBX,  dword [EBP-36]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-36]
        mov     EBX,  dword [EBP-28]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-36]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-28], EAX
        dec     dword [EBP-16]
        jmp     @10659
@10661: 
        mov     EAX,  dword [EBP-32]
        mov     EBX,  dword [EBP-28]
        mov     dword [EBX+0], EAX
        mov     EAX,  1
        mov     dword [EBP-4], EAX
@10663: 
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  0
        jne     @10668
@10664: 
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  5
        jb      @10666
@10665: 
        mov     EAX,  @@TEXT+502
        push    EAX
        call    @10050    ; Stop
@10666: 
@10667: 
        mov     EAX,  dword [@@DATA+4749812]
        mov     dword [@@DATA+4749840], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
@10668: 
@10669: 
@10670: 
        mov     EAX,  @@TEXT+1371
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10673
@10672: 
        mov     EAX,  13
        mov     dword [EBP-16], EAX
        mov     EAX,  1
        mov     dword [EBP-20], EAX
        jmp     @10702
@10673: 
        mov     EAX,  @@TEXT+1373
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10675
@10674: 
        mov     EAX,  14
        mov     dword [EBP-16], EAX
        mov     EAX,  1
        mov     dword [EBP-20], EAX
        jmp     @10702
@10675: 
        mov     EAX,  @@TEXT+1375
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10677
@10676: 
        mov     EAX,  16
        mov     dword [EBP-16], EAX
        mov     EAX,  1
        mov     dword [EBP-20], EAX
        jmp     @10702
@10677: 
        mov     EAX,  @@TEXT+1377
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10679
@10678: 
        mov     EAX,  20
        mov     dword [EBP-16], EAX
        mov     EAX,  2
        mov     dword [EBP-20], EAX
        jmp     @10702
@10679: 
        mov     EAX,  @@TEXT+1379
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10681
@10680: 
        mov     EAX,  21
        mov     dword [EBP-16], EAX
        mov     EAX,  2
        mov     dword [EBP-20], EAX
        jmp     @10702
@10681: 
        mov     EAX,  @@TEXT+1382
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10683
@10682: 
        mov     EAX,  22
        mov     dword [EBP-16], EAX
        mov     EAX,  2
        mov     dword [EBP-20], EAX
        jmp     @10702
@10683: 
        mov     EAX,  @@TEXT+1384
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10685
@10684: 
        mov     EAX,  23
        mov     dword [EBP-16], EAX
        mov     EAX,  2
        mov     dword [EBP-20], EAX
        jmp     @10702
@10685: 
        mov     EAX,  @@TEXT+1387
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10687
@10686: 
        mov     EAX,  24
        mov     dword [EBP-16], EAX
        mov     EAX,  2
        mov     dword [EBP-20], EAX
        jmp     @10702
@10687: 
        mov     EAX,  @@TEXT+1390
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10689
@10688: 
        mov     EAX,  25
        mov     dword [EBP-16], EAX
        mov     EAX,  2
        mov     dword [EBP-20], EAX
        jmp     @10702
@10689: 
        mov     EAX,  @@TEXT+1392
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10691
@10690: 
        mov     EAX,  26
        mov     dword [EBP-16], EAX
        mov     EAX,  3
        mov     dword [EBP-20], EAX
        jmp     @10702
@10691: 
        mov     EAX,  @@TEXT+1394
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10693
@10692: 
        mov     EAX,  27
        mov     dword [EBP-16], EAX
        mov     EAX,  3
        mov     dword [EBP-20], EAX
        jmp     @10702
@10693: 
        mov     EAX,  @@TEXT+1396
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10695
@10694: 
        mov     EAX,  28
        mov     dword [EBP-16], EAX
        mov     EAX,  4
        mov     dword [EBP-20], EAX
        jmp     @10702
@10695: 
        mov     EAX,  @@TEXT+1398
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10697
@10696: 
        mov     EAX,  29
        mov     dword [EBP-16], EAX
        mov     EAX,  4
        mov     dword [EBP-20], EAX
        jmp     @10702
@10697: 
        mov     EAX,  @@TEXT+1400
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10699
@10698: 
        mov     EAX,  30
        mov     dword [EBP-16], EAX
        mov     EAX,  4
        mov     dword [EBP-20], EAX
        jmp     @10702
@10699: 
        mov     EAX,  0
        mov     dword [EBP-20], EAX
@10702: 
        mov     EAX,  dword [EBP+8]
        mov     EBX,  dword [EBP-20]
        cmp     EAX,  EBX
        jb      @10704
@10703: 
        jmp     @10905
@10704: 
@10705: 
        call    @10262    ; Peek
        mov     dword [EBP-32], EAX
        mov     EAX,  dword [EBP-16]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-12]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-28]
        push    EAX
        lea     EAX,  [EBP-24]
        push    EAX
        mov     EAX,  dword [EBP-20]
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jne     @10732
@10706: 
        mov     EAX,  dword [EBP-28]
        cmp     EAX,  0
        jne     @10732
@10707: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-24]
        cmp     EAX,  EBX
        je      @10730
@10708: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1402
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10711
@10709: 
        mov     EAX,  @@TEXT+1407
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-24]
        cmp     EAX,  EBX
        jne     @10711
@10710: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        push    EAX
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  dword [EBP-24]
        push    EAX
        call    @10266    ; Cast
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10729
@10711: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1412
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10714
@10712: 
        mov     EAX,  @@TEXT+1417
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-24]
        cmp     EAX,  EBX
        jne     @10714
@10713: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        push    EAX
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  dword [EBP-24]
        push    EAX
        call    @10266    ; Cast
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10729
@10714: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1421
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10717
@10715: 
        mov     EAX,  @@TEXT+1426
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-24]
        cmp     EAX,  EBX
        jne     @10717
@10716: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        push    EAX
        mov     EAX,  dword [EBP-24]
        push    EAX
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        call    @10266    ; Cast
        jmp     @10729
@10717: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1431
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10720
@10718: 
        mov     EAX,  @@TEXT+1436
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-24]
        cmp     EAX,  EBX
        jne     @10720
@10719: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        push    EAX
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  dword [EBP-24]
        push    EAX
        call    @10266    ; Cast
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10729
@10720: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1440
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10723
@10721: 
        mov     EAX,  @@TEXT+1444
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-24]
        cmp     EAX,  EBX
        jne     @10723
@10722: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        push    EAX
        mov     EAX,  dword [EBP-24]
        push    EAX
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        call    @10266    ; Cast
        jmp     @10729
@10723: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1449
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10726
@10724: 
        mov     EAX,  @@TEXT+1453
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-24]
        cmp     EAX,  EBX
        jne     @10726
@10725: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        push    EAX
        mov     EAX,  dword [EBP-24]
        push    EAX
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        call    @10266    ; Cast
        jmp     @10729
@10726: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10729: 
@10730: 
@10731: 
        jmp     @10739
@10732: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        je      @10735
@10734: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  1
        je      @10736
@10735: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10736: 
@10737: 
@10739: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  0
        jbe     @10745
@10740: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  22
        je      @10743
@10741: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  23
        je      @10743
@10742: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10743: 
@10744: 
        mov     EAX,  1024
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10904
@10745: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  13
        jne     @10757
@10746: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1458
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10748
@10747: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1463
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10749
@10748: 
        mov     EAX,  17
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10752
@10749: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  1024
        jae     @10751
@10750: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10751: 
@10752: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10755
@10753: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10755
@10754: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        or      EAX,  EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  262144
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  262144
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  dword [EBP-32]
        add     EAX,  1
        mov     dword [@@DATA+4585488], EAX
@10755: 
@10756: 
        jmp     @10904
@10757: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  14
        jne     @10771
@10758: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1468
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10760
@10759: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1473
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10761
@10760: 
        mov     EAX,  18
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10766
@10761: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  1024
        jb      @10763
@10762: 
        call    @10262    ; Peek
        mov     dword [EBP-36], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-36]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     EBX,  dword [EBP-36]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     EBX,  dword [EBP-36]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  dword [EBP-36]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @10363    ; Dup
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        jmp     @10766
@10763: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10766: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10769
@10767: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10769
@10768: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        xor     EAX,  EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  262144
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  262144
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  dword [EBP-32]
        add     EAX,  1
        mov     dword [@@DATA+4585488], EAX
@10769: 
@10770: 
        jmp     @10904
@10771: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  16
        jne     @10783
@10772: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1478
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10774
@10773: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1483
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @10775
@10774: 
        mov     EAX,  19
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10778
@10775: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        cmp     EAX,  1024
        jae     @10777
@10776: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10777: 
@10778: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10781
@10779: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10781
@10780: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        and     EAX,  EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  262144
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  262144
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  dword [EBP-32]
        add     EAX,  1
        mov     dword [@@DATA+4585488], EAX
@10781: 
@10782: 
        jmp     @10904
@10783: 
        mov     EAX,  dword [EBP-16]
        mov     EBX,  20
        cmp     EAX,  EBX
        jb      @10792
@10784: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  25
        ja      @10792
@10785: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1488
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10790
@10786: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1493
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10790
@10787: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1498
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10790
@10788: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1503
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10790
@10789: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10790: 
@10791: 
        mov     EAX,  1024
        mov     EBX,  dword [EBP+12]
        mov     dword [EBX+0], EAX
        jmp     @10904
@10792: 
        mov     EAX,  dword [EBP-16]
        mov     EBX,  26
        cmp     EAX,  EBX
        jb      @10885
@10793: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  29
        ja      @10885
@10794: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1507
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10798
@10795: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1512
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10798
@10796: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1517
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10798
@10797: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10798: 
@10799: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  29
        jne     @10807
@10800: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10805
@10801: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        cmp     EAX,  0
        jne     @10803
@10802: 
        mov     EAX,  @@TEXT+872
        push    EAX
        call    @10050    ; Stop
@10803: 
@10804: 
@10805: 
@10806: 
@10807: 
@10808: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        je      @10810
@10809: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        jne     @10883
@10810: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        je      @10812
@10811: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        jne     @10881
@10812: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  26
        je      @10813
        cmp     EAX,  27
        je      @10813
        cmp     EAX,  28
        je      @10822
        cmp     EAX,  29
        je      @10822
        jmp     @10834
@10813: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        jne     @10820
@10814: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  26
        jne     @10816
@10815: 
        mov     EAX,  27
        mov     dword [EBP-16], EAX
        jmp     @10819
@10816: 
        mov     EAX,  26
        mov     dword [EBP-16], EAX
@10819: 
@10820: 
@10821: 
        jmp     @10834
@10822: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        jne     @10824
@10823: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391192]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
@10824: 
@10825: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        jne     @10827
@10826: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
@10827: 
@10828: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391184]
        cmp     EAX,  EBX
        jne     @10830
@10829: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @10833
@10830: 
        mov     EAX,  4
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
@10833: 
        jmp     @10834
@10834: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  26
        je      @10835
        cmp     EAX,  27
        je      @10846
        cmp     EAX,  28
        je      @10860
        cmp     EAX,  29
        je      @10867
        jmp     @10879
@10835: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10837
@10836: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        add     EAX,  EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        jmp     @10845
@10837: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391192]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        cmp     EAX,  EBX
        jbe     @10840
@10839: 
        mov     EAX,  4
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        sub     EAX,  EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        jmp     @10843
@10840: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391192]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        sub     EAX,  EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
@10843: 
@10845: 
        jmp     @10880
@10846: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10856
@10847: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        cmp     EAX,  EBX
        jae     @10852
@10848: 
        mov     EAX,  4
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391192]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        sub     EAX,  EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        cmp     EAX,  2147483648
        jbe     @10850
@10849: 
        mov     EAX,  @@TEXT+872
        push    EAX
        call    @10050    ; Stop
@10850: 
@10851: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        jmp     @10855
@10852: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        sub     EAX,  EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
@10855: 
        jmp     @10859
@10856: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391192]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        add     EAX,  EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  4
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
@10859: 
        jmp     @10880
@10860: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        mul     EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        jne     @10865
@10861: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        cmp     EAX,  2147483648
        jbe     @10863
@10862: 
        mov     EAX,  @@TEXT+872
        push    EAX
        call    @10050    ; Stop
@10863: 
@10864: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
@10865: 
@10866: 
        jmp     @10880
@10867: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        xor     EDX,  EDX
        div     EBX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        cmp     EAX,  0
        je      @10875
@10868: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        jne     @10873
@10869: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        cmp     EAX,  2147483648
        jbe     @10871
@10870: 
        mov     EAX,  @@TEXT+872
        push    EAX
        call    @10050    ; Stop
@10871: 
@10872: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
@10873: 
@10874: 
        jmp     @10878
@10875: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
@10878: 
        jmp     @10880
@10879: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @10880
@10880: 
        mov     EAX,  262144
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  262144
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  dword [EBP-32]
        add     EAX,  1
        mov     dword [@@DATA+4585488], EAX
@10881: 
@10882: 
@10883: 
@10884: 
        jmp     @10904
@10885: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  30
        jne     @10901
@10886: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1521
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10889
@10887: 
        mov     EAX,  dword [EBP+12]
        mov     EAX,  dword [EAX+0]
        push    EAX
        mov     EAX,  @@TEXT+1526
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        je      @10889
@10888: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10889: 
@10890: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10895
@10891: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        cmp     EAX,  0
        jne     @10893
@10892: 
        mov     EAX,  @@TEXT+872
        push    EAX
        call    @10050    ; Stop
@10893: 
@10894: 
@10895: 
@10896: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10899
@10897: 
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @10899
@10898: 
        mov     EAX,  3
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391196]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        xor     EDX,  EDX
        div     EBX
        xchg    EAX,  EDX
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  262144
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  262144
        mov     EBX,  dword [EBP-32]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  dword [EBP-32]
        add     EAX,  1
        mov     dword [@@DATA+4585488], EAX
@10899: 
@10900: 
        jmp     @10904
@10901: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@10904: 
        mov     EAX,  dword [EBP-32]
        mov     dword [EBP-12], EAX
        jmp     @10670
@10905: 
        mov     EAX,  dword [EBP-12]
        mov     ESP,  EBP
        pop     EBP
        ret     16

@10906:        ;Tabl
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  12
@10907: 
        mov     EAX,  @@TEXT+1531
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10918
@10908: 
        mov     EAX,  dword [@@DATA+129032]
        cmp     EAX,  512
        jb      @10910
@10909: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@10910: 
@10911: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-8]
        push    EAX
        lea     EAX,  [EBP-4]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     dword [EBP-12], EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        je      @10913
@10912: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10913: 
@10914: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [@@DATA+129032]
        shl     EBX,  2
        mov     dword [@@DATA+EBX+126984], EAX
        inc     dword [@@DATA+129032]
        mov     EAX,  @@TEXT+1533
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10916
@10915: 
        mov     EAX,  @@TEXT+304
        push    EAX
        call    @10050    ; Stop
@10916: 
@10917: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        jmp     @10907
@10918: 
        mov     EAX,  dword [@@DATA+129032]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10919:        ;Ctrl
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  60
        call    @10262    ; Peek
        mov     dword [EBP-4], EAX
        mov     EAX,  @@TEXT+1535
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10925
@10920: 
        mov     EAX,  39
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-4]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        mov     dword [EBP-8], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-12], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     dword [EBP-16], EAX
        mov     EAX,  0
        mov     dword [EBP-20], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
@10921: 
        mov     EAX,  dword [EBP-20]
        cmp     EAX,  0
        je      @10923
@10922: 
        mov     EAX,  @@TEXT+1544
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10924
@10923: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10919    ; Ctrl
        mov     EBX,  dword [EBP-8]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-8]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-8], EAX
        mov     EAX,  1
        mov     dword [EBP-20], EAX
        jmp     @10921
@10924: 
        mov     EAX,  dword [EBP-16]
        mov     dword [@@DATA+129032], EAX
        mov     EAX,  dword [EBP-12]
        mov     dword [@@DATA+126980], EAX
        jmp     @11264
@10925: 
        mov     EAX,  @@TEXT+1548
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10927
@10926: 
        mov     EAX,  @@TEXT+1551
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10962
@10927: 
        mov     EAX,  40
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  @@TEXT+1558
        mov     dword [EBP-8], EAX
        mov     EAX,  @@TEXT+1559
        mov     dword [EBP-12], EAX
        mov     EAX,  @@TEXT+1564
        mov     dword [EBP-16], EAX
        mov     EAX,  @@TEXT+1569
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10932
@10928: 
        mov     EAX,  @@TEXT+1576
        mov     dword [EBP-8], EAX
        mov     EAX,  @@TEXT+1581
        mov     dword [EBP-12], EAX
        mov     EAX,  @@TEXT+1583
        mov     dword [EBP-16], EAX
        mov     EAX,  @@TEXT+1591
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10930
@10929: 
        mov     EAX,  @@TEXT+321
        push    EAX
        call    @10050    ; Stop
@10930: 
@10931: 
        jmp     @10935
@10932: 
        mov     EAX,  dword [EBP-8]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
@10935: 
        mov     EAX,  dword [EBP-4]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        mov     dword [EBP-20], EAX
@10936: 
        mov     EAX,  @@TEXT+1596
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10961
@10937: 
        call    @10262    ; Peek
        mov     dword [EBP-24], EAX
        call    @10262    ; Peek
        mov     dword [EBP-28], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-24]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP-24]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-28]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-8]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10945
@10938: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-36]
        push    EAX
        lea     EAX,  [EBP-32]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-28]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10940
@10939: 
        mov     EAX,  @@TEXT+336
        push    EAX
        call    @10050    ; Stop
@10940: 
@10941: 
        mov     EAX,  dword [EBP-32]
        cmp     EAX,  1024
        jae     @10943
@10942: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10943: 
@10944: 
        jmp     @10954
@10945: 
        mov     EAX,  @@TEXT+1600
        push    EAX
        mov     EAX,  dword [EBP-16]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @10951
@10947: 
        mov     EAX,  @@TEXT+1608
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10949
@10948: 
        mov     EAX,  @@TEXT+365
        push    EAX
        call    @10050    ; Stop
@10949: 
@10950: 
@10951: 
@10952: 
        mov     EAX,  @@TEXT+1610
        mov     dword [EBP-8], EAX
        mov     EAX,  @@TEXT+1611
        mov     dword [EBP-16], EAX
@10954: 
        mov     EAX,  dword [EBP-28]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-32], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-36], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     dword [EBP-40], EAX
        mov     EAX,  0
        mov     dword [EBP-44], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
@10955: 
        mov     EAX,  dword [EBP-44]
        cmp     EAX,  0
        je      @10959
@10956: 
        mov     EAX,  dword [EBP-8]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10960
@10957: 
        mov     EAX,  dword [EBP-16]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10960
@10958: 
        mov     EAX,  @@TEXT+1612
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10960
@10959: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10919    ; Ctrl
        mov     EBX,  dword [EBP-32]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-32]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-32], EAX
        mov     EAX,  1
        mov     dword [EBP-44], EAX
        jmp     @10955
@10960: 
        mov     EAX,  dword [EBP-40]
        mov     dword [@@DATA+129032], EAX
        mov     EAX,  dword [EBP-36]
        mov     dword [@@DATA+126980], EAX
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [EBP-20]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-24]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-20], EAX
        jmp     @10936
@10961: 
        jmp     @11264
@10962: 
        mov     EAX,  @@TEXT+1616
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11037
@10963: 
        call    @10262    ; Peek
        mov     dword [EBP-8], EAX
        mov     EAX,  41
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-16]
        push    EAX
        lea     EAX,  [EBP-12]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  0
        je      @10965
@10964: 
        mov     EAX,  @@TEXT+571
        push    EAX
        call    @10050    ; Stop
@10965: 
@10966: 
        mov     EAX,  @@TEXT+1623
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-12]
        cmp     EAX,  EBX
        je      @10971
@10967: 
        mov     EAX,  @@TEXT+1628
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-12]
        cmp     EAX,  EBX
        je      @10971
@10968: 
        mov     EAX,  @@TEXT+1633
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-12]
        cmp     EAX,  EBX
        je      @10971
@10969: 
        mov     EAX,  @@TEXT+1638
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-12]
        cmp     EAX,  EBX
        je      @10971
@10970: 
        mov     EAX,  @@TEXT+571
        push    EAX
        call    @10050    ; Stop
@10971: 
@10972: 
        mov     EAX,  @@TEXT+1642
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10974
@10973: 
        mov     EAX,  @@TEXT+385
        push    EAX
        call    @10050    ; Stop
@10974: 
@10975: 
        mov     EAX,  @@TEXT+1645
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @10977
@10976: 
        mov     EAX,  @@TEXT+321
        push    EAX
        call    @10050    ; Stop
@10977: 
@10978: 
        mov     EAX,  dword [EBP-8]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-20], EAX
@10979: 
        mov     EAX,  @@TEXT+1650
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11026
@10980: 
        call    @10262    ; Peek
        mov     dword [EBP-24], EAX
        call    @10262    ; Peek
        mov     dword [EBP-28], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-24]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP-24]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-28]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        mov     dword [EBP-32], EAX
        mov     EAX,  @@TEXT+1655
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
@10981: 
        mov     EAX,  @@TEXT+1657
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11016
@10982: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-40]
        push    EAX
        lea     EAX,  [EBP-36]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     dword [EBP-44], EAX
        mov     EAX,  @@TEXT+1659
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-12]
        cmp     EAX,  EBX
        jne     @10987
@10983: 
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  2
        je      @10985
@10984: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10985: 
@10986: 
        jmp     @11006
@10987: 
        mov     EAX,  @@TEXT+1664
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-12]
        cmp     EAX,  EBX
        jne     @10992
@10988: 
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        je      @10990
@10989: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10990: 
@10991: 
        jmp     @11006
@10992: 
        mov     EAX,  @@TEXT+1669
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-12]
        cmp     EAX,  EBX
        jne     @10997
@10993: 
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        je      @10995
@10994: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@10995: 
@10996: 
        jmp     @11006
@10997: 
        mov     EAX,  @@TEXT+1674
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-12]
        cmp     EAX,  EBX
        jne     @11003
@10998: 
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        je      @11001
@10999: 
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        je      @11001
@11000: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@11001: 
@11002: 
        jmp     @11006
@11003: 
        mov     EAX,  @@TEXT+615
        push    EAX
        call    @10050    ; Stop
@11006: 
        mov     EAX,  dword [EBP-8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-48], EAX
@11007: 
        mov     EAX,  dword [EBP-48]
        cmp     EAX,  262144
        jae     @11015
@11008: 
        mov     EAX,  dword [EBP-48]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-52], EAX
@11009: 
        mov     EAX,  dword [@@DATA+4585488]
        mov     EBX,  dword [EBP-52]
        cmp     EAX,  EBX
        jbe     @11014
@11010: 
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-52]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        cmp     EAX,  EBX
        jne     @11012
@11011: 
        mov     EAX,  @@TEXT+652
        push    EAX
        call    @10050    ; Stop
@11012: 
@11013: 
        mov     EAX,  dword [EBP-52]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-52], EAX
        jmp     @11009
@11014: 
        mov     EAX,  dword [EBP-48]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-48], EAX
        jmp     @11007
@11015: 
        mov     EAX,  262144
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP-44]
        add     EAX,  1
        mov     dword [@@DATA+4585488], EAX
        mov     EAX,  dword [EBP-44]
        mov     EBX,  dword [EBP-32]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-44]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        mov     dword [EBP-32], EAX
        jmp     @10981
@11016: 
        mov     EAX,  @@TEXT+1678
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11018
@11017: 
        mov     EAX,  @@TEXT+365
        push    EAX
        call    @10050    ; Stop
@11018: 
@11019: 
        mov     EAX,  dword [EBP-28]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-36], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-40], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     dword [EBP-44], EAX
        mov     EAX,  0
        mov     dword [EBP-48], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
@11020: 
        mov     EAX,  dword [EBP-48]
        cmp     EAX,  0
        je      @11024
@11021: 
        mov     EAX,  @@TEXT+1680
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11025
@11022: 
        mov     EAX,  @@TEXT+1685
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11025
@11023: 
        mov     EAX,  @@TEXT+1693
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11025
@11024: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10919    ; Ctrl
        mov     EBX,  dword [EBP-36]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-36]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-36], EAX
        mov     EAX,  1
        mov     dword [EBP-48], EAX
        jmp     @11020
@11025: 
        mov     EAX,  dword [EBP-44]
        mov     dword [@@DATA+129032], EAX
        mov     EAX,  dword [EBP-40]
        mov     dword [@@DATA+126980], EAX
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [EBP-20]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-24]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-20], EAX
        jmp     @10979
@11026: 
        mov     EAX,  @@TEXT+1697
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11035
@11027: 
        mov     EAX,  @@TEXT+1705
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11029
@11028: 
        mov     EAX,  @@TEXT+365
        push    EAX
        call    @10050    ; Stop
@11029: 
@11030: 
        call    @10262    ; Peek
        mov     dword [EBP-24], EAX
        call    @10262    ; Peek
        mov     dword [EBP-28], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-24]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        mov     EBX,  dword [EBP-24]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-28]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-32], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-36], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     dword [EBP-40], EAX
        mov     EAX,  0
        mov     dword [EBP-44], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
@11031: 
        mov     EAX,  dword [EBP-44]
        cmp     EAX,  0
        je      @11033
@11032: 
        mov     EAX,  @@TEXT+1707
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11034
@11033: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10919    ; Ctrl
        mov     EBX,  dword [EBP-32]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-32]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-32], EAX
        mov     EAX,  1
        mov     dword [EBP-44], EAX
        jmp     @11031
@11034: 
        mov     EAX,  dword [EBP-40]
        mov     dword [@@DATA+129032], EAX
        mov     EAX,  dword [EBP-36]
        mov     dword [@@DATA+126980], EAX
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [EBP-20]
        mov     dword [EBX+0], EAX
@11035: 
@11036: 
        jmp     @11264
@11037: 
        mov     EAX,  @@TEXT+1711
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11039
@11038: 
        mov     EAX,  @@TEXT+1717
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11053
@11039: 
        call    @10262    ; Peek
        mov     dword [EBP-8], EAX
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  42
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-12]
        mov     EBX,  dword [EBP-8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  @@TEXT+1720
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11047
@11040: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-20]
        push    EAX
        lea     EAX,  [EBP-16]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  @@TEXT+1726
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11042
@11041: 
        mov     EAX,  @@TEXT+398
        push    EAX
        call    @10050    ; Stop
@11042: 
@11043: 
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  1024
        jae     @11045
@11044: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@11045: 
@11046: 
@11047: 
@11048: 
        mov     EAX,  dword [EBP-8]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-20], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     dword [EBP-24], EAX
        mov     EAX,  dword [@@DATA+4749836]
        mov     dword [EBP-28], EAX
        mov     EAX,  0
        mov     dword [EBP-32], EAX
        mov     EAX,  dword [EBP-4]
        mov     dword [@@DATA+4749836], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
@11049: 
        mov     EAX,  dword [EBP-32]
        cmp     EAX,  0
        je      @11051
@11050: 
        mov     EAX,  @@TEXT+1729
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11052
@11051: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10919    ; Ctrl
        mov     EBX,  dword [EBP-16]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-16]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-16], EAX
        mov     EAX,  1
        mov     dword [EBP-32], EAX
        jmp     @11049
@11052: 
        mov     EAX,  dword [EBP-28]
        mov     dword [@@DATA+4749836], EAX
        mov     EAX,  dword [EBP-24]
        mov     dword [@@DATA+129032], EAX
        mov     EAX,  dword [EBP-20]
        mov     dword [@@DATA+126980], EAX
        jmp     @11264
@11053: 
        mov     EAX,  @@TEXT+1733
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11065
@11054: 
        call    @10262    ; Peek
        mov     dword [EBP-8], EAX
        call    @10262    ; Peek
        mov     dword [EBP-12], EAX
        mov     EAX,  43
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-12]
        mov     EBX,  dword [EBP-8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-20], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     dword [EBP-24], EAX
        mov     EAX,  dword [@@DATA+4749836]
        mov     dword [EBP-28], EAX
        mov     EAX,  0
        mov     dword [EBP-32], EAX
        mov     EAX,  dword [EBP-4]
        mov     dword [@@DATA+4749836], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
@11055: 
        mov     EAX,  dword [EBP-32]
        cmp     EAX,  0
        je      @11057
@11056: 
        mov     EAX,  @@TEXT+1740
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11058
@11057: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10919    ; Ctrl
        mov     EBX,  dword [EBP-16]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-16]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-16], EAX
        mov     EAX,  1
        mov     dword [EBP-32], EAX
        jmp     @11055
@11058: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-40]
        push    EAX
        lea     EAX,  [EBP-36]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  @@TEXT+1746
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11060
@11059: 
        mov     EAX,  @@TEXT+828
        push    EAX
        call    @10050    ; Stop
@11060: 
@11061: 
        mov     EAX,  dword [EBP-36]
        cmp     EAX,  1024
        jae     @11063
@11062: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@11063: 
@11064: 
        mov     EAX,  dword [EBP-28]
        mov     dword [@@DATA+4749836], EAX
        mov     EAX,  dword [EBP-24]
        mov     dword [@@DATA+129032], EAX
        mov     EAX,  dword [EBP-20]
        mov     dword [@@DATA+126980], EAX
        jmp     @11264
@11065: 
        mov     EAX,  @@TEXT+1748
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11074
@11066: 
        mov     EAX,  dword [@@DATA+4749836]
        cmp     EAX,  262144
        jb      @11068
@11067: 
        mov     EAX,  @@TEXT+411
        push    EAX
        call    @10050    ; Stop
@11068: 
@11069: 
        mov     EAX,  44
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [@@DATA+4749836]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  42
        je      @11070
        cmp     EAX,  43
        je      @11071
        jmp     @11072
@11070: 
        mov     EAX,  dword [@@DATA+4749836]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        jmp     @11073
@11071: 
        mov     EAX,  dword [@@DATA+4749836]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        jmp     @11073
@11072: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @11073
@11073: 
        jmp     @11264
@11074: 
        mov     EAX,  @@TEXT+1753
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11079
@11075: 
        mov     EAX,  dword [@@DATA+4749836]
        cmp     EAX,  262144
        jb      @11077
@11076: 
        mov     EAX,  @@TEXT+411
        push    EAX
        call    @10050    ; Stop
@11077: 
@11078: 
        mov     EAX,  45
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [@@DATA+4749836]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        jmp     @11264
@11079: 
        mov     EAX,  @@TEXT+1758
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11081
@11080: 
        mov     EAX,  @@TEXT+1762
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11096
@11081: 
        mov     EAX,  @@TEXT+1766
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11083
@11082: 
        mov     EAX,  47
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @11086
@11083: 
        mov     EAX,  48
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
@11086: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-12]
        push    EAX
        lea     EAX,  [EBP-8]
        push    EAX
        mov     EAX,  5
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  @@TEXT+1770
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11088
@11087: 
        mov     EAX,  @@TEXT+828
        push    EAX
        call    @10050    ; Stop
@11088: 
@11089: 
        mov     EAX,  @@TEXT+1772
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        je      @11092
@11090: 
        mov     EAX,  @@TEXT+1777
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        je      @11092
@11091: 
        mov     EAX,  @@TEXT+1782
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        jne     @11093
@11092: 
        mov     EAX,  dword [EBP-12]
        cmp     EAX,  0
        je      @11094
@11093: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
@11094: 
@11095: 
        jmp     @11264
@11096: 
        mov     EAX,  @@TEXT+1786
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11107
@11097: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10054    ; val
        mov     dword [EBP-8], EAX
        mov     EAX,  dword [EBP-8]
        cmp     EAX,  255
        jbe     @11099
@11098: 
        mov     EAX,  @@TEXT+186
        push    EAX
        call    @10050    ; Stop
@11099: 
@11100: 
        mov     EAX,  51
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  @@TEXT+1793
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11102
@11101: 
        mov     EAX,  @@TEXT+1795
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  dword [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     4
@11102: 
@11103: 
        mov     EAX,  @@TEXT+1802
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11105
@11104: 
        mov     EAX,  @@TEXT+828
        push    EAX
        call    @10050    ; Stop
@11105: 
@11106: 
        jmp     @11264
@11107: 
        mov     EAX,  @@TEXT+1804
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11155
@11108: 
        mov     EAX,  52
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [@@DATA+391180]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
@11109: 
        call    @10103    ; Read
        cmp     AL,   10
        je      @11113
@11110: 
        call    @10103    ; Read
        cmp     AL,   13
        je      @11113
@11111: 
        call    @10103    ; Read
        cmp     AL,   9
        je      @11113
@11112: 
        call    @10103    ; Read
        cmp     AL,   32
        jne     @11120
@11113: 
        call    @10103    ; Read
        cmp     AL,   10
        jne     @11118
@11114: 
        mov     EAX,  dword [@@DATA+4749804]
        mov     EBX,  100
        xor     EDX,  EDX
        div     EBX
        xchg    EAX,  EDX
        cmp     EAX,  0
        jne     @11116
@11115: 
        mov     EAX,  @@TEXT+1813
        push    EAX
        mov     EAX,  dword [@@DATA+4749804]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+1811
        push    EAX
        mov     EAX,  @@DATA+4749768
        push    EAX
        mov     EAX,  @@TEXT+1809
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10006    ; puts
@11116: 
@11117: 
        mov     EAX,  0
        mov     dword [@@DATA+4749808], EAX
        inc     dword [@@DATA+4749804]
@11118: 
@11119: 
        call    @10121    ; Next
        jmp     @11109
@11120: 
        mov     EAX,  0
        mov     dword [EBP-8], EAX
        mov     AL,   0
        mov     byte  [EBP-12], AL
@11121: 
        call    @10103    ; Read
        cmp     AL,   59
        je      @11151
@11122: 
        call    @10103    ; Read
        cmp     AL,   10
        jne     @11127
@11123: 
        mov     EAX,  dword [@@DATA+4749804]
        mov     EBX,  100
        xor     EDX,  EDX
        div     EBX
        xchg    EAX,  EDX
        cmp     EAX,  0
        jne     @11125
@11124: 
        mov     EAX,  @@TEXT+1819
        push    EAX
        mov     EAX,  dword [@@DATA+4749804]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+1817
        push    EAX
        mov     EAX,  @@DATA+4749768
        push    EAX
        mov     EAX,  @@TEXT+1815
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10006    ; puts
@11125: 
@11126: 
        mov     EAX,  0
        mov     dword [@@DATA+4749808], EAX
        inc     dword [@@DATA+4749804]
@11127: 
@11128: 
        call    @10103    ; Read
        cmp     AL,   13
        je      @11130
@11129: 
        call    @10103    ; Read
        cmp     AL,   10
        jne     @11135
@11130: 
        mov     EAX,  dword [EBP-8]
        cmp     EAX,  0
        jne     @11132
@11131: 
        mov     AL,   byte  [EBP-12]
        cmp     AL,   58
        jne     @11133
@11132: 
        jmp     @11151
@11133: 
@11134: 
        mov     EAX,  @@TEXT+828
        push    EAX
        call    @10050    ; Stop
@11135: 
@11136: 
        call    @10103    ; Read
        cmp     AL,   0
        jne     @11138
@11137: 
        mov     EAX,  @@TEXT+122
        push    EAX
        call    @10050    ; Stop
@11138: 
@11139: 
        mov     EAX,  dword [@@DATA+391180]
        cmp     EAX,  262144
        jb      @11141
@11140: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@11141: 
@11142: 
        call    @10103    ; Read
        cmp     AL,   47
        jne     @11149
@11143: 
        call    @10121    ; Next
        call    @10103    ; Read
        cmp     AL,   47
        jne     @11145
@11144: 
        mov     EAX,  1
        mov     dword [EBP-8], EAX
        mov     AL,   59
        mov     byte  [EBP-12], AL
        mov     AL,   byte  [EBP-12]
        mov     EBX,  dword [@@DATA+391180]
        mov     byte  [@@DATA+EBX+129036], AL
        inc     dword [@@DATA+391180]
        call    @10121    ; Next
        jmp     @11121
        jmp     @11148
@11145: 
        mov     AL,   47
        mov     byte  [EBP-12], AL
        mov     AL,   byte  [EBP-12]
        mov     EBX,  dword [@@DATA+391180]
        mov     byte  [@@DATA+EBX+129036], AL
        inc     dword [@@DATA+391180]
        jmp     @11121
@11148: 
@11149: 
@11150: 
        call    @10103    ; Read
        mov     byte  [EBP-12], AL
        mov     AL,   byte  [EBP-12]
        mov     EBX,  dword [@@DATA+391180]
        mov     byte  [@@DATA+EBX+129036], AL
        inc     dword [@@DATA+391180]
        call    @10121    ; Next
        jmp     @11121
@11151: 
        call    @10121    ; Next
        mov     EAX,  dword [@@DATA+391180]
        cmp     EAX,  262144
        jb      @11153
@11152: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@11153: 
@11154: 
        mov     AL,   0
        mov     EBX,  dword [@@DATA+391180]
        mov     byte  [@@DATA+EBX+129036], AL
        inc     dword [@@DATA+391180]
        jmp     @11264
@11155: 
        mov     EAX,  @@TEXT+1821
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11164
@11156: 
        mov     EAX,  53
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        cmp     EAX,  0
        jne     @11158
@11157: 
        mov     EAX,  @@TEXT+1828
        push    EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11162
@11158: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-12]
        push    EAX
        lea     EAX,  [EBP-8]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  @@TEXT+1833
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11160
@11159: 
        mov     EAX,  @@TEXT+828
        push    EAX
        call    @10050    ; Stop
@11160: 
@11161: 
        mov     EAX,  dword [EBP-4]
        imul    EAX,  16
        add     EAX,  @@DATA+391192
        push    EAX
        mov     EAX,  dword [EBP-12]
        push    EAX
        mov     EAX,  dword [EBP-8]
        push    EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        push    EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        push    EAX
        call    @10271    ; Test
@11162: 
@11163: 
        jmp     @11264
@11164: 
        mov     EAX,  @@TEXT+1835
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11210
@11165: 
        mov     EAX,  dword [EBP-4]
        mov     dword [EBP-12], EAX
@11166: 
        mov     EAX,  1
        cmp     EAX,  1
        jne     @11209
@11167: 
@11168: 
        call    @10103    ; Read
        cmp     AL,   10
        je      @11170
@11169: 
        call    @10103    ; Read
        cmp     AL,   13
        jne     @11171
@11170: 
        call    @10121    ; Next
        jmp     @11168
@11171: 
        mov     EAX,  dword [@@DATA+4749764]
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [@@DATA+391180]
        mov     dword [EBP-20], EAX
@11172: 
        mov     EAX,  @@TEXT+1839
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11189
@11173: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  @@TEXT+1843
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11187
@11174: 
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @11176
@11175: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@11176: 
@11177: 
        mov     EAX,  @@TEXT+1845
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  1
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+44], EAX
        mov     EAX,  dword [EBP-16]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+48], EAX
        mov     EAX,  dword [@@DATA+4749764]
        sub     EAX,  2
        mov     dword [EBP-24], EAX
        mov     EAX,  dword [@@DATA+4749764]
        mov     dword [EBP-28], EAX
        mov     EAX,  dword [EBP-16]
        mov     dword [@@DATA+4749764], EAX
@11178: 
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [@@DATA+4749764]
        cmp     EAX,  EBX
        jb      @11183
@11179: 
        mov     EAX,  dword [@@DATA+391180]
        cmp     EAX,  262144
        jb      @11181
@11180: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@11181: 
@11182: 
        call    @10103    ; Read
        mov     EBX,  dword [@@DATA+391180]
        mov     byte  [@@DATA+EBX+129036], AL
        inc     dword [@@DATA+391180]
        call    @10121    ; Next
        jmp     @11178
@11183: 
        mov     EAX,  dword [EBP-28]
        mov     dword [@@DATA+4749764], EAX
        mov     EAX,  dword [EBP-28]
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [@@DATA+391180]
        cmp     EAX,  262144
        jb      @11185
@11184: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@11185: 
@11186: 
        mov     AL,   0
        mov     EBX,  dword [@@DATA+391180]
        mov     byte  [@@DATA+EBX+129036], AL
        inc     dword [@@DATA+391180]
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+52], EAX
        mov     EAX,  8
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  @@TEXT+1850
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-36]
        push    EAX
        lea     EAX,  [EBP-32]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  54
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        call    @10262    ; Peek
        mov     dword [EBP-8], EAX
        mov     EAX,  dword [EBP-8]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  dword [EBP-8]
        mov     dword [EBP-4], EAX
        inc     dword [@@DATA+73728]
        mov     EAX,  dword [@@DATA+4749764]
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [@@DATA+391180]
        mov     dword [EBP-20], EAX
        jmp     @11172
@11187: 
@11188: 
        jmp     @11172
@11189: 
        call    @10122    ; Prev
@11190: 
        call    @10103    ; Read
        cmp     AL,   10
        je      @11193
@11191: 
        call    @10103    ; Read
        cmp     AL,   13
        je      @11193
@11192: 
        call    @10122    ; Prev
        jmp     @11190
@11193: 
        mov     EAX,  dword [@@DATA+4749764]
        mov     dword [EBP-24], EAX
        mov     EAX,  dword [EBP-16]
        mov     dword [@@DATA+4749764], EAX
@11194: 
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [@@DATA+4749764]
        cmp     EAX,  EBX
        jb      @11199
@11195: 
        mov     EAX,  dword [@@DATA+391180]
        cmp     EAX,  262144
        jb      @11197
@11196: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@11197: 
@11198: 
        call    @10103    ; Read
        mov     EBX,  dword [@@DATA+391180]
        mov     byte  [@@DATA+EBX+129036], AL
        inc     dword [@@DATA+391180]
        call    @10121    ; Next
        jmp     @11194
@11199: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  dword [@@DATA+391180]
        cmp     EAX,  262144
        jb      @11201
@11200: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@11201: 
@11202: 
        mov     AL,   0
        mov     EBX,  dword [@@DATA+391180]
        mov     byte  [@@DATA+EBX+129036], AL
        inc     dword [@@DATA+391180]
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @11204
@11203: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@11204: 
@11205: 
        mov     EAX,  dword [@@DATA+73728]
        mov     dword [EBP-28], EAX
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @11207
@11206: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@11207: 
@11208: 
        mov     EAX,  @@TEXT+1860
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  1
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+44], EAX
        mov     EAX,  dword [EBP-16]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+48], EAX
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+52], EAX
        mov     EAX,  8
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  @@TEXT+1865
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        mov     EAX,  54
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        inc     dword [@@DATA+73728]
        mov     EAX,  dword [EBP-12]
        mov     dword [EBP-4], EAX
        jmp     @11209
        jmp     @11166
@11209: 
        jmp     @11264
@11210: 
        mov     EAX,  @@TEXT+1875
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11212
@11211: 
        mov     EAX,  0
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        jmp     @11264
@11212: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        lea     EAX,  [EBP-12]
        push    EAX
        lea     EAX,  [EBP-8]
        push    EAX
        mov     EAX,  6
        push    EAX
        call    @10367    ; Expr
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP-16]
        cmp     EAX,  262144
        jae     @11219
@11214: 
        call    @10262    ; Peek
        mov     dword [EBP-20], EAX
        mov     EAX,  50
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-20]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-16]
        mov     EBX,  dword [EBP-20]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  @@TEXT+1880
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11216
@11215: 
        mov     EAX,  @@TEXT+1882
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11217
@11216: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-28]
        push    EAX
        lea     EAX,  [EBP-24]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-20]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  dword [EBP-20]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        push    EAX
        mov     EAX,  dword [EBP-28]
        push    EAX
        mov     EAX,  dword [EBP-24]
        push    EAX
        mov     EAX,  dword [EBP-12]
        push    EAX
        mov     EAX,  dword [EBP-8]
        push    EAX
        call    @10271    ; Test
@11217: 
@11218: 
        jmp     @11259
@11219: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10084    ; Find
        mov     dword [EBP-20], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-20]
        cmp     EAX,  EBX
        jbe     @11222
@11221: 
        mov     EAX,  dword [EBP-20]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  3
        je      @11223
@11222: 
        mov     EAX,  @@TEXT+264
        push    EAX
        call    @10050    ; Stop
@11223: 
@11224: 
        mov     EAX,  0
        mov     dword [EBP-24], EAX
@11225: 
        mov     EAX,  @@TEXT+1885
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11227
@11226: 
        inc     dword [EBP-24]
        jmp     @11225
@11227: 
        mov     EAX,  @@TEXT+1887
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-20]
        cmp     EAX,  EBX
        jne     @11230
@11228: 
        mov     EAX,  dword [EBP-24]
        cmp     EAX,  1
        jae     @11230
@11229: 
        mov     EAX,  @@TEXT+724
        push    EAX
        call    @10050    ; Stop
@11230: 
@11231: 
        mov     EAX,  dword [EBP-20]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  2
        jne     @11234
@11232: 
        mov     EAX,  dword [EBP-24]
        cmp     EAX,  1
        jae     @11234
@11233: 
        mov     EAX,  @@TEXT+744
        push    EAX
        call    @10050    ; Stop
@11234: 
@11235: 
        mov     EAX,  dword [@@DATA+4749828]
        mov     dword [EBP-28], EAX
@11236: 
        mov     EAX,  dword [@@DATA+126980]
        mov     EBX,  dword [EBP-28]
        cmp     EAX,  EBX
        jbe     @11241
@11237: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        mov     EAX,  dword [EBP-28]
        imul    EAX,  52
        add     EAX,  @@DATA+73732
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11239
@11238: 
        mov     EAX,  @@TEXT+291
        push    EAX
        call    @10050    ; Stop
@11239: 
@11240: 
        inc     dword [EBP-28]
        jmp     @11236
@11241: 
        mov     EAX,  dword [@@DATA+126980]
        cmp     EAX,  1024
        jb      @11243
@11242: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@11243: 
@11244: 
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73764], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        mov     EAX,  dword [@@DATA+126980]
        imul    EAX,  52
        add     EAX,  @@DATA+73732
        push    EAX
        call    @10073    ; Copy
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73768], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73772], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10906    ; Tabl
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73776], EAX
        mov     EAX,  1
        mov     dword [EBP-32], EAX
        mov     EAX,  dword [@@DATA+126980]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73772]
        mov     dword [EBP-36], EAX
@11245: 
        mov     EAX,  dword [@@DATA+126980]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73776]
        mov     EBX,  dword [EBP-36]
        cmp     EAX,  EBX
        jbe     @11247
@11246: 
        mov     EAX,  dword [EBP-36]
        shl     EAX,  2
        mov     EAX,  dword [@@DATA+EAX+126984]
        mov     EBX,  dword [EBP-32]
        mul     EBX
        mov     dword [EBP-32], EAX
        inc     dword [EBP-36]
        jmp     @11245
@11247: 
        call    @10262    ; Peek
        mov     dword [EBP-40], EAX
        mov     EAX,  38
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-40]
        mov     EBX,  dword [EBP-4]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        call    @10262    ; Peek
        mov     dword [EBP-44], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-40]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-24]
        mov     EBX,  dword [EBP-40]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-44]
        mov     EBX,  dword [EBP-40]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-32]
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  @@TEXT+1892
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11249
@11248: 
        mov     EAX,  @@TEXT+1894
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11253
@11249: 
        mov     EAX,  dword [@@DATA+126980]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73772]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     EBX,  dword [@@DATA+EBX+73776]
        cmp     EAX,  EBX
        jae     @11251
@11250: 
        mov     EAX,  @@TEXT+915
        push    EAX
        call    @10050    ; Stop
@11251: 
@11252: 
        call    @10262    ; Peek
        mov     dword [EBP-48], EAX
        mov     EAX,  50
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-48]
        mov     EBX,  dword [EBP-44]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        call    @10262    ; Peek
        mov     dword [EBP-60], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-48]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-60]
        mov     EBX,  dword [EBP-48]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-56]
        push    EAX
        lea     EAX,  [EBP-52]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-48]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  9
        mov     EBX,  dword [EBP-60]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [@@DATA+4749828]
        mov     EBX,  dword [@@DATA+126980]
        xchg    EAX,  EBX
        sub     EAX,  EBX
        mov     EBX,  dword [EBP-60]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-48]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        push    EAX
        mov     EAX,  dword [EBP-56]
        push    EAX
        mov     EAX,  dword [EBP-52]
        push    EAX
        mov     EAX,  dword [EBP-24]
        push    EAX
        mov     EAX,  dword [EBP-20]
        push    EAX
        call    @10271    ; Test
@11253: 
@11254: 
        inc     dword [@@DATA+126980]
        mov     EAX,  @@TEXT+1897
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @11256
@11255: 
        mov     EAX,  dword [EBP-20]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  dword [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     4
@11256: 
@11257: 
@11259: 
        mov     EAX,  @@TEXT+1899
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @11261
@11260: 
        mov     EAX,  @@TEXT+828
        push    EAX
        call    @10050    ; Stop
@11261: 
@11262: 
@11264: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  dword [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@11265:        ;Save
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  dword [@@DATA+4749760]
        cmp     EAX,  4096
        jb      @11270
@11266: 
        mov     EAX,  dword [@@DATA+4749760]
        push    EAX
        mov     EAX,  @@DATA+4716992
        push    EAX
        mov     EAX,  dword [@@DATA+4749800]
        push    EAX
        call    @10004    ; write
        mov     EBX,  dword [@@DATA+4749760]
        cmp     EAX,  EBX
        je      @11268
@11267: 
        mov     EAX,  @@TEXT+948
        push    EAX
        call    @10050    ; Stop
@11268: 
@11269: 
        mov     EAX,  0
        mov     dword [@@DATA+4749760], EAX
@11270: 
@11271: 
        mov     AL,   byte  [EBP+8]
        mov     EBX,  dword [@@DATA+4749760]
        mov     byte  [@@DATA+EBX+4716992], AL
        inc     dword [@@DATA+4749760]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@11272:        ;Decl
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@11273: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        je      @11275
@11274: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        push    EAX
        call    @11265    ; Save
        inc     dword [EBP-4]
        jmp     @11273
@11275: 
        mov     AL,   13
        push    EAX
        call    @11265    ; Save
        mov     AL,   10
        push    EAX
        call    @11265    ; Save
        mov     ESP,  EBP
        pop     EBP
        ret     4

@11276:        ;DeclNR
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@11277: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        je      @11279
@11278: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        push    EAX
        call    @11265    ; Save
        inc     dword [EBP-4]
        jmp     @11277
@11279: 
        mov     ESP,  EBP
        pop     EBP
        ret     4

@11280:        ;Emit
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  8
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  0
        je      @11285
@11281: 
        mov     AL,   64
        push    EAX
        call    @11265    ; Save
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10049    ; str
        mov     dword [EBP-4], EAX
        mov     EAX,  0
        mov     dword [EBP-8], EAX
@11282: 
        mov     EAX,  dword [EBP-8]
        add     EAX,  dword [EBP-4]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        je      @11284
@11283: 
        mov     EAX,  dword [EBP-8]
        add     EAX,  dword [EBP-4]
        mov     AL,   byte  [EAX+0]
        push    EAX
        call    @11265    ; Save
        inc     dword [EBP-8]
        jmp     @11282
@11284: 
        mov     AL,   58
        push    EAX
        call    @11265    ; Save
        mov     AL,   32
        push    EAX
        call    @11265    ; Save
        jmp     @11291
@11285: 
        mov     EAX,  0
        mov     dword [EBP-4], EAX
@11287: 
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  8
        jae     @11289
@11288: 
        mov     AL,   32
        push    EAX
        call    @11265    ; Save
        inc     dword [EBP-4]
        jmp     @11287
@11289: 
@11291: 
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @11272    ; Decl
        mov     ESP,  EBP
        pop     EBP
        ret     8

@11292:        ;Even
        push    EBP
        mov     EBP,  ESP
@11293: 
        mov     EAX,  dword [EBP+8]
        mov     EBX,  4
        xor     EDX,  EDX
        div     EBX
        xchg    EAX,  EDX
        cmp     EAX,  0
        je      @11295
@11294: 
        inc     dword [EBP+8]
        jmp     @11293
@11295: 
        mov     EAX,  dword [EBP+8]
        mov     ESP,  EBP
        pop     EBP
        ret     4

@11296:        ;Mark
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  262144
        jb      @11298
@11297: 
        mov     ESP,  EBP
        pop     EBP
        ret     4
@11298: 
@11299: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  31
        je      @11300
        cmp     EAX,  7
        je      @11307
        cmp     EAX,  5
        je      @11319
        cmp     EAX,  6
        je      @11326
        jmp     @11327
@11300: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        jne     @11305
@11301: 
        mov     EAX,  1
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  1
        jne     @11303
@11302: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        push    EAX
        call    @11296    ; Mark
@11303: 
@11304: 
@11305: 
@11306: 
        jmp     @11327
@11307: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        cmp     EAX,  262144
        jb      @11312
@11308: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        jne     @11310
@11309: 
        mov     EAX,  1
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        push    EAX
        call    @11296    ; Mark
@11310: 
@11311: 
        jmp     @11318
@11312: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  31
        je      @11317
@11313: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        jne     @11315
@11314: 
        mov     EAX,  1
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        push    EAX
        call    @11296    ; Mark
@11315: 
@11316: 
@11317: 
@11318: 
        jmp     @11327
@11319: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        jne     @11324
@11320: 
        mov     EAX,  1
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  1
        jne     @11322
@11321: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        push    EAX
        call    @11296    ; Mark
@11322: 
@11323: 
@11324: 
@11325: 
        jmp     @11327
@11326: 
        mov     EAX,  1
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        jmp     @11327
@11327: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11296    ; Mark
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11296    ; Mark
        mov     ESP,  EBP
        pop     EBP
        ret     4

@11328:        ;Enum
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  20
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  262144
        jb      @11330
@11329: 
        mov     EAX,  0
        mov     ESP,  EBP
        pop     EBP
        ret     12
@11330: 
@11331: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        je      @11370
@11332: 
        mov     EAX,  0
        mov     dword [EBP-4], EAX
        mov     EAX,  0
        mov     dword [EBP-8], EAX
@11333: 
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  262144
        jae     @11369
@11334: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  39
        je      @11335
        cmp     EAX,  40
        je      @11339
        cmp     EAX,  41
        je      @11346
        cmp     EAX,  42
        je      @11353
        cmp     EAX,  43
        je      @11357
        cmp     EAX,  38
        je      @11361
        jmp     @11368
@11335: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-12], EAX
@11336: 
        mov     EAX,  dword [EBP-12]
        cmp     EAX,  262144
        jae     @11338
@11337: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  1
        push    EAX
        mov     EAX,  dword [EBP-12]
        push    EAX
        call    @11328    ; Enum
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-12], EAX
        jmp     @11336
@11338: 
        jmp     @11368
@11339: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-12], EAX
@11340: 
        mov     EAX,  dword [EBP-12]
        cmp     EAX,  262144
        jae     @11345
@11341: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-16]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11328    ; Enum
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-16]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  1
        push    EAX
        mov     EAX,  dword [EBP-16]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11328    ; Enum
        mov     dword [EBP-20], EAX
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [EBP-4]
        add     EAX,  EBX
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        jbe     @11343
@11342: 
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [EBP-4]
        add     EAX,  EBX
        mov     dword [EBP-8], EAX
@11343: 
@11344: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-12], EAX
        jmp     @11340
@11345: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        jmp     @11368
@11346: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-12], EAX
@11347: 
        mov     EAX,  dword [EBP-12]
        cmp     EAX,  262144
        jae     @11352
@11348: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  1
        push    EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11328    ; Enum
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP-16]
        mov     EBX,  dword [EBP-4]
        add     EAX,  EBX
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        jbe     @11350
@11349: 
        mov     EAX,  dword [EBP-16]
        mov     EBX,  dword [EBP-4]
        add     EAX,  EBX
        mov     dword [EBP-8], EAX
@11350: 
@11351: 
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-12], EAX
        jmp     @11347
@11352: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        jmp     @11368
@11353: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-12], EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-16]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-16]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11328    ; Enum
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  1
        push    EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11328    ; Enum
        mov     dword [EBP-20], EAX
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [EBP-4]
        add     EAX,  EBX
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        jbe     @11355
@11354: 
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [EBP-4]
        add     EAX,  EBX
        mov     dword [EBP-8], EAX
@11355: 
@11356: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        jmp     @11368
@11357: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-12], EAX
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP-12]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  1
        push    EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11328    ; Enum
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP-16]
        mov     EBX,  dword [EBP-4]
        add     EAX,  EBX
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        jbe     @11359
@11358: 
        mov     EAX,  dword [EBP-16]
        mov     EBX,  dword [EBP-4]
        add     EAX,  EBX
        mov     dword [EBP-8], EAX
@11359: 
@11360: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-12]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11328    ; Enum
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
        jmp     @11368
@11361: 
        mov     EAX,  4
        mov     dword [EBP-12], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        cmp     EAX,  0
        jne     @11363
@11362: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-12], EAX
@11363: 
@11364: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-12]
        mul     EBX
        push    EAX
        call    @11292    ; Even
        mov     EBX,  dword [EBP-4]
        add     EAX,  EBX
        mov     dword [EBP-4], EAX
        mov     EAX,  dword [EBP-4]
        mov     EBX,  dword [EBP-8]
        cmp     EAX,  EBX
        jbe     @11366
@11365: 
        mov     EAX,  dword [EBP-4]
        mov     dword [EBP-8], EAX
@11366: 
@11367: 
        jmp     @11368
@11368: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP+8], EAX
        jmp     @11333
@11369: 
        mov     EAX,  dword [EBP-8]
        mov     ESP,  EBP
        pop     EBP
        ret     12
        jmp     @11380
@11370: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  50
        je      @11379
@11371: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  47
        je      @11379
@11372: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  48
        je      @11379
@11373: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11328    ; Enum
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        mov     EBX,  13
        cmp     EAX,  EBX
        jb      @11375
@11374: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  16
        jbe     @11376
@11375: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  0
        jne     @11377
@11376: 
        mov     EAX,  dword [EBP+16]
        mov     EAX,  dword [EAX+0]
        mov     EBX,  dword [EBP+8]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP+16]
        inc     dword [EAX+0]
@11377: 
@11378: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11328    ; Enum
@11379: 
@11380: 
        mov     EAX,  0
        mov     ESP,  EBP
        pop     EBP
        ret     12

@11381:        ;Code
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  304
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  1
        je      @11382
        cmp     EAX,  2
        je      @11388
        cmp     EAX,  3
        je      @11394
        cmp     EAX,  4
        je      @11400
        cmp     EAX,  5
        je      @11406
        cmp     EAX,  7
        je      @11412
        cmp     EAX,  8
        je      @11412
        cmp     EAX,  9
        je      @11412
        cmp     EAX,  6
        je      @11412
        cmp     EAX,  47
        je      @11412
        cmp     EAX,  48
        je      @11412
        cmp     EAX,  46
        je      @11828
        cmp     EAX,  11
        je      @11884
        cmp     EAX,  12
        je      @11899
        cmp     EAX,  13
        je      @11913
        cmp     EAX,  14
        je      @11919
        cmp     EAX,  15
        je      @11925
        cmp     EAX,  16
        je      @11931
        cmp     EAX,  17
        je      @11937
        cmp     EAX,  18
        je      @11937
        cmp     EAX,  19
        je      @11937
        cmp     EAX,  20
        je      @11937
        cmp     EAX,  21
        je      @11937
        cmp     EAX,  22
        je      @11937
        cmp     EAX,  23
        je      @11937
        cmp     EAX,  24
        je      @11937
        cmp     EAX,  25
        je      @11937
        cmp     EAX,  26
        je      @11937
        cmp     EAX,  27
        je      @11937
        cmp     EAX,  28
        je      @11937
        cmp     EAX,  29
        je      @11937
        cmp     EAX,  30
        je      @11937
        cmp     EAX,  38
        je      @12075
        cmp     EAX,  49
        je      @12082
        cmp     EAX,  50
        je      @12093
        cmp     EAX,  53
        je      @12097
        cmp     EAX,  51
        je      @12119
        cmp     EAX,  52
        je      @12120
        cmp     EAX,  54
        je      @12126
        cmp     EAX,  39
        je      @12130
        cmp     EAX,  40
        je      @12134
        cmp     EAX,  41
        je      @12150
        cmp     EAX,  42
        je      @12174
        cmp     EAX,  43
        je      @12181
        cmp     EAX,  44
        je      @12185
        cmp     EAX,  45
        je      @12185
        cmp     EAX,  0
        je      @12186
        jmp     @12187
@11382: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11384
@11383: 
        mov     EAX,  @@TEXT+1901
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11387
@11384: 
        mov     EAX,  @@TEXT+1919
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11387: 
        mov     EAX,  1024
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12188
@11388: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11390
@11389: 
        mov     EAX,  @@TEXT+1937
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11393
@11390: 
        mov     EAX,  @@TEXT+1952
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
@11393: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+1967
        push    EAX
        call    @10084    ; Find
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12188
@11394: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11396
@11395: 
        mov     EAX,  @@TEXT+1972
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11399
@11396: 
        mov     EAX,  @@TEXT+1987
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
@11399: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+2002
        push    EAX
        call    @10084    ; Find
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12188
@11400: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11402
@11401: 
        mov     EAX,  @@TEXT+2007
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11405
@11402: 
        mov     EAX,  @@TEXT+2022
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
@11405: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+2037
        push    EAX
        call    @10084    ; Find
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12188
@11406: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11408
@11407: 
        mov     EAX,  @@TEXT+2041
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11411
@11408: 
        mov     EAX,  @@TEXT+2057
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
@11411: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @10049    ; str
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  1024
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12188
@11412: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  47
        je      @11414
@11413: 
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  48
        jne     @11415
@11414: 
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP+8], EAX
@11415: 
@11416: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  7
        je      @11417
        cmp     EAX,  8
        je      @11418
        cmp     EAX,  9
        je      @11419
        cmp     EAX,  6
        je      @11420
        jmp     @11421
@11417: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        mov     dword [EBP-268], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-272], EAX
        jmp     @11422
@11418: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        mov     dword [EBP-268], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73780]
        mov     dword [EBP-272], EAX
        jmp     @11422
@11419: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [@@DATA+4749828]
        add     EAX,  EBX
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [@@DATA+4749828]
        add     EAX,  EBX
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        mov     dword [EBP-268], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [@@DATA+4749828]
        add     EAX,  EBX
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73780]
        mov     dword [EBP-272], EAX
        jmp     @11422
@11420: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        mov     dword [EBP-264], EAX
        mov     EAX,  1
        mov     dword [EBP-268], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-272], EAX
        jmp     @11422
@11421: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @11422
@11422: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        mov     dword [EBP-276], EAX
        mov     EAX,  0
        mov     dword [EBP-280], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-284], EAX
@11423: 
        mov     EAX,  dword [EBP-284]
        cmp     EAX,  262144
        jb      @11524
@11425: 
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  47
        je      @11427
@11426: 
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  48
        jne     @11469
@11427: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  2
        je      @11429
@11428: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  0
        jbe     @11430
@11429: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11430: 
@11431: 
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  47
        jne     @11433
@11432: 
        mov     EAX,  @@TEXT+2073
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11436
@11433: 
        mov     EAX,  @@TEXT+2082
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
@11436: 
        mov     EAX,  dword [EBP-264]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-288], EAX
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        jne     @11438
@11437: 
        mov     EAX,  @@TEXT+2091
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        jmp     @11443
@11438: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  4
        jne     @11440
@11439: 
        mov     EAX,  @@TEXT+2098
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        jmp     @11443
@11440: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11443: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        je      @11456
@11444: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  7
        jne     @11446
@11445: 
        mov     EAX,  @@TEXT+2118
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2105
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11455
@11446: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  8
        jne     @11448
@11447: 
        mov     EAX,  @@TEXT+2130
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2120
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11455
@11448: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  9
        jne     @11450
@11449: 
        mov     EAX,  @@TEXT+2142
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2132
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11455
@11450: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  10
        jne     @11452
@11451: 
        mov     EAX,  @@TEXT+2150
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2144
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11455
@11452: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11455: 
        jmp     @11468
@11456: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  7
        jne     @11459
@11458: 
        mov     EAX,  @@TEXT+2161
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2152
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11466
@11459: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  8
        jne     @11461
@11460: 
        mov     EAX,  @@TEXT+2169
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2163
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11466
@11461: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  9
        jne     @11463
@11462: 
        mov     EAX,  @@TEXT+2177
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2171
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11466
@11463: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11466: 
@11468: 
        jmp     @11523
@11469: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  31
        je      @11522
@11470: 
        mov     EAX,  4
        mov     dword [EBP-288], EAX
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  0
        jne     @11472
@11471: 
        mov     EAX,  dword [EBP-264]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-288], EAX
@11472: 
@11473: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        je      @11474
        cmp     EAX,  4
        je      @11475
        jmp     @11476
@11474: 
        mov     EAX,  @@TEXT+2179
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11477
@11475: 
        mov     EAX,  @@TEXT+2194
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11477
@11476: 
        mov     EAX,  @@TEXT+2209
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11477
@11477: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        je      @11490
@11478: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  1
        jne     @11480
@11479: 
        mov     EAX,  @@TEXT+2224
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11483
@11480: 
        mov     EAX,  @@TEXT+2228
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        call    @10036    ; strcpy
@11483: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  7
        je      @11484
        cmp     EAX,  8
        je      @11485
        cmp     EAX,  9
        je      @11486
        cmp     EAX,  10
        je      @11487
        jmp     @11488
@11484: 
        mov     EAX,  @@TEXT+2241
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        mov     EAX,  @@TEXT+2232
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        jmp     @11489
@11485: 
        mov     EAX,  @@TEXT+2249
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        mov     EAX,  @@TEXT+2243
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        jmp     @11489
@11486: 
        mov     EAX,  @@TEXT+2257
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        mov     EAX,  @@TEXT+2251
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        jmp     @11489
@11487: 
        mov     EAX,  @@TEXT+2261
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        mov     EAX,  @@TEXT+2259
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        jmp     @11489
@11488: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @11489
@11489: 
        jmp     @11498
@11490: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  7
        je      @11492
        cmp     EAX,  8
        je      @11493
        cmp     EAX,  9
        je      @11494
        jmp     @11495
@11492: 
        mov     EAX,  @@TEXT+2263
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        jmp     @11496
@11493: 
        mov     EAX,  @@TEXT+2272
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        jmp     @11496
@11494: 
        mov     EAX,  @@TEXT+2278
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        jmp     @11496
@11495: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @11496
@11496: 
@11498: 
        mov     EAX,  @@TEXT+2284
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        je      @11504
@11499: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        je      @11500
        cmp     EAX,  4
        je      @11501
        jmp     @11502
@11500: 
        mov     EAX,  @@TEXT+2286
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11503
@11501: 
        mov     EAX,  @@TEXT+2291
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11503
@11502: 
        mov     EAX,  @@TEXT+2297
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        lea     EAX,  [EBP-256]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11503
@11503: 
        jmp     @11517
@11504: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  1
        jne     @11510
@11505: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        je      @11506
        cmp     EAX,  4
        je      @11507
        jmp     @11508
@11506: 
        mov     EAX,  @@TEXT+2315
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+2327
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11509
@11507: 
        mov     EAX,  @@TEXT+2332
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+2344
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11509
@11508: 
        mov     EAX,  @@TEXT+2350
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        lea     EAX,  [EBP-256]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11509
@11509: 
        jmp     @11517
@11510: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  2
        jne     @11516
@11511: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        je      @11512
        cmp     EAX,  4
        je      @11513
        jmp     @11514
@11512: 
        mov     EAX,  @@TEXT+2362
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+2374
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11515
@11513: 
        mov     EAX,  @@TEXT+2379
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+2391
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11515
@11514: 
        mov     EAX,  @@TEXT+2397
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        lea     EAX,  [EBP-256]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11515
@11515: 
@11516: 
@11517: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        je      @11520
@11518: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  4
        je      @11520
@11519: 
        mov     EAX,  @@TEXT+2409
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-288]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2413
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+2428
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11520: 
@11521: 
@11522: 
@11523: 
        jmp     @11827
        jmp     @11826
@11524: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  36
        jne     @11578
@11525: 
        mov     EAX,  4
        mov     dword [EBP-288], EAX
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  0
        jne     @11527
@11526: 
        mov     EAX,  dword [EBP-264]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-288], EAX
@11527: 
@11528: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        je      @11529
        cmp     EAX,  4
        je      @11535
        jmp     @11541
@11529: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11531
@11530: 
        mov     EAX,  @@TEXT+2442
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11534
@11531: 
        mov     EAX,  @@TEXT+2463
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
@11534: 
        jmp     @11547
@11535: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11537
@11536: 
        mov     EAX,  @@TEXT+2484
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11540
@11537: 
        mov     EAX,  @@TEXT+2505
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
@11540: 
        jmp     @11547
@11541: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11543
@11542: 
        mov     EAX,  @@TEXT+2526
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11546
@11543: 
        mov     EAX,  @@TEXT+2541
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
@11546: 
        jmp     @11547
@11547: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        je      @11560
@11548: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  1
        jne     @11550
@11549: 
        mov     EAX,  @@TEXT+2556
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11553
@11550: 
        mov     EAX,  @@TEXT+2560
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        call    @10036    ; strcpy
@11553: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  7
        je      @11554
        cmp     EAX,  8
        je      @11555
        cmp     EAX,  9
        je      @11556
        cmp     EAX,  10
        je      @11557
        jmp     @11558
@11554: 
        mov     EAX,  @@TEXT+2575
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2573
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        mov     EAX,  @@TEXT+2564
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11559
@11555: 
        mov     EAX,  @@TEXT+2585
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2583
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        mov     EAX,  @@TEXT+2577
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11559
@11556: 
        mov     EAX,  @@TEXT+2595
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2593
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        mov     EAX,  @@TEXT+2587
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11559
@11557: 
        mov     EAX,  @@TEXT+2601
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2599
        push    EAX
        lea     EAX,  [EBP-292]
        push    EAX
        mov     EAX,  @@TEXT+2597
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11559
@11558: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @11559
@11559: 
        jmp     @11572
@11560: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  7
        jne     @11563
@11562: 
        mov     EAX,  @@TEXT+2612
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2603
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11570
@11563: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  8
        jne     @11565
@11564: 
        mov     EAX,  @@TEXT+2620
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2614
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11570
@11565: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  9
        jne     @11567
@11566: 
        mov     EAX,  @@TEXT+2628
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2622
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11570
@11567: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  31
        je      @11569
@11568: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11569: 
@11570: 
@11572: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  0
        jbe     @11574
@11573: 
        mov     EAX,  1024
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11577
@11574: 
        mov     EAX,  dword [EBP-264]
        mov     ESP,  EBP
        pop     EBP
        ret     16
@11577: 
        jmp     @11826
@11578: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  37
        jne     @11615
@11579: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11581
@11580: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  2
        jne     @11582
@11581: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11582: 
@11583: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        je      @11600
@11584: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  7
        jne     @11586
@11585: 
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2630
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11599
@11586: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  8
        jne     @11588
@11587: 
        mov     EAX,  @@TEXT+2676
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2652
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11599
@11588: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  9
        jne     @11590
@11589: 
        mov     EAX,  @@TEXT+2702
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2678
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11599
@11590: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  6
        jne     @11592
@11591: 
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2704
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11599
@11592: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  10
        jne     @11595
@11593: 
        mov     EAX,  dword [EBP-272]
        cmp     EAX,  0
        je      @11595
@11594: 
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2726
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11599
@11595: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  10
        je      @11598
@11596: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  31
        je      @11598
@11597: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11598: 
@11599: 
        jmp     @11614
@11600: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  7
        jne     @11603
@11602: 
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2741
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11612
@11603: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  8
        jne     @11605
@11604: 
        mov     EAX,  @@TEXT+2783
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2763
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11612
@11605: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  9
        jne     @11607
@11606: 
        mov     EAX,  @@TEXT+2805
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2785
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11612
@11607: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  6
        jne     @11609
@11608: 
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2807
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11612
@11609: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  31
        je      @11611
@11610: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11611: 
@11612: 
@11614: 
        mov     EAX,  1024
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11826
@11615: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  31
        jne     @11628
@11616: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        je      @11618
@11617: 
        mov     EAX,  @@TEXT+2829
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
@11618: 
@11619: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        cmp     EAX,  262144
        jae     @11621
@11620: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
@11621: 
@11622: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  0
        jne     @11624
@11623: 
        mov     EAX,  @@TEXT+2851
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2841
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11627
@11624: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        mov     EAX,  @@TEXT+2863
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2853
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11627: 
        mov     EAX,  31
        mov     dword [EBP-276], EAX
        mov     EAX,  0
        mov     dword [EBP-272], EAX
        jmp     @11826
@11628: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  32
        jne     @11636
@11629: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        je      @11631
@11630: 
        mov     EAX,  @@TEXT+2870
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
@11631: 
@11632: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-288], EAX
        mov     EAX,  dword [EBP-288]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        cmp     EAX,  262144
        jae     @11634
@11633: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-288]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
@11634: 
@11635: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-288]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+2882
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        mov     dword [EBP-268], EAX
        mov     EAX,  31
        mov     dword [EBP-276], EAX
        mov     EAX,  0
        mov     dword [EBP-272], EAX
        jmp     @11826
@11636: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  33
        jne     @11744
@11637: 
        mov     EAX,  0
        mov     dword [EBP-288], EAX
        mov     EAX,  0
        mov     dword [EBP-292], EAX
        mov     EAX,  0
        mov     dword [EBP-296], EAX
        mov     EAX,  1
        mov     dword [EBP-300], EAX
@11638: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @11641
@11640: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-288]
        mul     EBX
        mov     EBX,  dword [EBP-284]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391192]
        imul    EBX,  16
        mov     EBX,  dword [@@DATA+EBX+391188]
        add     EAX,  EBX
        mov     dword [EBP-288], EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-292]
        mul     EBX
        mov     dword [EBP-292], EAX
        jmp     @11691
@11641: 
        mov     EAX,  dword [EBP-296]
        cmp     EAX,  2
        jne     @11655
@11643: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        je      @11648
@11644: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        je      @11646
@11645: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11646: 
@11647: 
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
        jmp     @11654
@11648: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  1
        je      @11651
@11650: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11651: 
@11652: 
        mov     EAX,  0
        mov     dword [EBP-300], EAX
@11654: 
        mov     EAX,  @@TEXT+2894
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+2906
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+2918
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-292]
        mul     EBX
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2930
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+2945
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  1
        mov     dword [EBP-296], EAX
        jmp     @11689
@11655: 
        mov     EAX,  dword [EBP-296]
        cmp     EAX,  1
        jne     @11666
@11656: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11658
@11657: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        je      @11659
@11658: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11659: 
@11660: 
        mov     EAX,  1
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11662
@11661: 
        mov     EAX,  @@TEXT+2963
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-292]
        mul     EBX
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2975
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11665
@11662: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-292]
        mul     EBX
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+2990
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11665: 
        mov     EAX,  @@TEXT+3005
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
        jmp     @11689
@11666: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  2
        jne     @11671
@11667: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11669
@11668: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11669: 
@11670: 
        mov     EAX,  @@TEXT+3023
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+3035
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  0
        mov     dword [EBP-300], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  1
        mov     dword [EBP-296], EAX
        jmp     @11689
@11671: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  1
        jne     @11681
@11672: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        je      @11674
@11673: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11674: 
@11675: 
        mov     EAX,  1
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11677
@11676: 
        mov     EAX,  0
        mov     dword [EBP-300], EAX
        mov     EAX,  1
        mov     dword [EBP-296], EAX
        jmp     @11680
@11677: 
        mov     EAX,  2
        mov     dword [EBP-296], EAX
@11680: 
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
        jmp     @11689
@11681: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11684
@11683: 
        mov     EAX,  1
        mov     dword [EBP-296], EAX
        jmp     @11687
@11684: 
        mov     EAX,  2
        mov     dword [EBP-296], EAX
@11687: 
@11689: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-288]
        mul     EBX
        mov     dword [EBP-288], EAX
        mov     EAX,  1
        mov     dword [EBP-292], EAX
@11691: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        cmp     EAX,  262144
        jb      @11693
@11692: 
        jmp     @11698
@11693: 
@11694: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  33
        je      @11696
@11695: 
        jmp     @11698
@11696: 
@11697: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-284], EAX
        jmp     @11638
@11698: 
        mov     EAX,  4
        mov     dword [EBP-304], EAX
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  0
        jne     @11700
@11699: 
        mov     EAX,  dword [EBP-264]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-304], EAX
@11700: 
@11701: 
        mov     EAX,  dword [EBP-304]
        mov     EBX,  dword [EBP-288]
        mul     EBX
        mov     dword [EBP-288], EAX
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  9
        je      @11703
@11702: 
        mov     EAX,  dword [EBP-288]
        mov     EBX,  dword [EBP-272]
        add     EAX,  EBX
        mov     dword [EBP-272], EAX
        jmp     @11706
@11703: 
        mov     EAX,  dword [EBP-288]
        mov     EBX,  dword [EBP-272]
        xchg    EAX,  EBX
        sub     EAX,  EBX
        mov     dword [EBP-272], EAX
@11706: 
        mov     EAX,  dword [EBP-296]
        cmp     EAX,  0
        je      @11742
@11707: 
        mov     EAX,  dword [EBP-292]
        mov     EBX,  dword [EBP-304]
        mul     EBX
        mov     dword [EBP-304], EAX
        mov     EAX,  dword [EBP-304]
        cmp     EAX,  4
        jne     @11714
@11708: 
        mov     EAX,  dword [EBP-296]
        cmp     EAX,  1
        jne     @11710
@11709: 
        mov     EAX,  @@TEXT+3047
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11713
@11710: 
        mov     EAX,  @@TEXT+3063
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11713: 
        jmp     @11722
@11714: 
        mov     EAX,  dword [EBP-304]
        cmp     EAX,  1
        jbe     @11721
@11715: 
        mov     EAX,  dword [EBP-296]
        cmp     EAX,  1
        jne     @11717
@11716: 
        mov     EAX,  dword [EBP-304]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3079
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11720
@11717: 
        mov     EAX,  dword [EBP-304]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3094
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11720: 
@11721: 
@11722: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        je      @11738
@11723: 
        mov     EAX,  dword [EBP-296]
        cmp     EAX,  2
        jne     @11729
@11724: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  1
        jne     @11726
@11725: 
        mov     EAX,  dword [EBP-300]
        cmp     EAX,  0
        jne     @11727
@11726: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11727: 
@11728: 
        mov     EAX,  @@TEXT+3109
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11737
@11729: 
        mov     EAX,  dword [EBP-296]
        cmp     EAX,  1
        jne     @11734
@11730: 
        mov     EAX,  dword [EBP-300]
        cmp     EAX,  0
        je      @11732
@11731: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11732: 
@11733: 
        mov     EAX,  @@TEXT+3127
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+3139
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  1
        mov     dword [EBP-280], EAX
        jmp     @11737
@11734: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11737: 
        jmp     @11741
@11738: 
        mov     EAX,  dword [EBP-296]
        mov     dword [EBP-280], EAX
@11741: 
@11742: 
@11743: 
        jmp     @11826
@11744: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  34
        jne     @11816
@11745: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  1
        jae     @11747
@11746: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11747: 
@11748: 
        dec     dword [EBP-268]
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        cmp     EAX,  262144
        jae     @11777
@11749: 
        mov     EAX,  4
        mov     dword [EBP-288], EAX
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  0
        jne     @11751
@11750: 
        mov     EAX,  dword [EBP-264]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-288], EAX
@11751: 
@11752: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  2
        je      @11753
        cmp     EAX,  1
        je      @11757
        jmp     @11758
@11753: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        je      @11755
@11754: 
        mov     EAX,  @@TEXT+3157
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11755: 
@11756: 
        mov     EAX,  @@TEXT+3169
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  1
        mov     dword [EBP-280], EAX
        mov     EAX,  1
        mov     dword [@@DATA+4749860], EAX
        jmp     @11758
@11757: 
        mov     EAX,  1
        mov     dword [@@DATA+4749860], EAX
        jmp     @11758
@11758: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11768
@11759: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  4
        jne     @11761
@11760: 
        mov     EAX,  @@TEXT+3187
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11764
@11761: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        jbe     @11763
@11762: 
        mov     EAX,  dword [EBP-288]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3203
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11763: 
@11764: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        je      @11766
@11765: 
        mov     EAX,  @@TEXT+3218
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  2
        mov     dword [EBP-280], EAX
@11766: 
@11767: 
        mov     EAX,  @@TEXT+3230
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11776
@11768: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  4
        jne     @11771
@11770: 
        mov     EAX,  @@TEXT+3251
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11774
@11771: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        jbe     @11773
@11772: 
        mov     EAX,  dword [EBP-288]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3267
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11773: 
@11774: 
        mov     EAX,  @@TEXT+3282
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
@11776: 
        jmp     @11785
@11777: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11780
@11779: 
        mov     EAX,  @@TEXT+3303
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11783
@11780: 
        mov     EAX,  @@TEXT+3324
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
@11783: 
@11785: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        je      @11798
@11786: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  1
        jne     @11788
@11787: 
        mov     EAX,  @@TEXT+3345
        push    EAX
        lea     EAX,  [EBP-288]
        push    EAX
        call    @10036    ; strcpy
        jmp     @11791
@11788: 
        mov     EAX,  @@TEXT+3349
        push    EAX
        lea     EAX,  [EBP-288]
        push    EAX
        call    @10036    ; strcpy
@11791: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  7
        je      @11792
        cmp     EAX,  8
        je      @11793
        cmp     EAX,  9
        je      @11794
        cmp     EAX,  10
        je      @11795
        jmp     @11796
@11792: 
        mov     EAX,  @@TEXT+3364
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3362
        push    EAX
        lea     EAX,  [EBP-288]
        push    EAX
        mov     EAX,  @@TEXT+3353
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11797
@11793: 
        mov     EAX,  @@TEXT+3374
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3372
        push    EAX
        lea     EAX,  [EBP-288]
        push    EAX
        mov     EAX,  @@TEXT+3366
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11797
@11794: 
        mov     EAX,  @@TEXT+3384
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3382
        push    EAX
        lea     EAX,  [EBP-288]
        push    EAX
        mov     EAX,  @@TEXT+3376
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11797
@11795: 
        mov     EAX,  @@TEXT+3390
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3388
        push    EAX
        lea     EAX,  [EBP-288]
        push    EAX
        mov     EAX,  @@TEXT+3386
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11797
@11796: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @11797
@11797: 
        jmp     @11807
@11798: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  7
        je      @11800
        cmp     EAX,  8
        je      @11801
        cmp     EAX,  9
        je      @11802
        cmp     EAX,  31
        je      @11803
        jmp     @11804
@11800: 
        mov     EAX,  @@TEXT+3401
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3392
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11805
@11801: 
        mov     EAX,  @@TEXT+3409
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3403
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11805
@11802: 
        mov     EAX,  @@TEXT+3417
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3411
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11805
@11803: 
        jmp     @11805
@11804: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @11805
@11805: 
@11807: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11809
@11808: 
        mov     EAX,  1
        mov     dword [EBP-280], EAX
        jmp     @11815
@11809: 
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        je      @11812
@11811: 
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
@11812: 
@11813: 
        mov     EAX,  2
        mov     dword [EBP-280], EAX
@11815: 
        mov     EAX,  10
        mov     dword [EBP-276], EAX
        mov     EAX,  0
        mov     dword [EBP-272], EAX
        jmp     @11826
@11816: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  35
        jne     @11823
@11817: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        mov     dword [EBP-268], EAX
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  9
        je      @11819
@11818: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73780]
        mov     EBX,  dword [EBP-272]
        add     EAX,  EBX
        mov     dword [EBP-272], EAX
        jmp     @11822
@11819: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73780]
        mov     EBX,  dword [EBP-272]
        xchg    EAX,  EBX
        sub     EAX,  EBX
        mov     dword [EBP-272], EAX
@11822: 
        jmp     @11826
@11823: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11826: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-284], EAX
        jmp     @11423
@11827: 
        jmp     @12188
@11828: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  1024
        jne     @11830
@11829: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11830: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  @@TEXT+3419
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @11833
@11831: 
        mov     EAX,  @@TEXT+3424
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-260]
        cmp     EAX,  EBX
        jne     @11833
@11832: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11833: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  @@TEXT+3429
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @11836
@11834: 
        mov     EAX,  @@TEXT+3434
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-260]
        cmp     EAX,  EBX
        jne     @11836
@11835: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11836: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  @@TEXT+3439
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @11839
@11837: 
        mov     EAX,  @@TEXT+3444
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-260]
        cmp     EAX,  EBX
        jne     @11839
@11838: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11839: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  @@TEXT+3449
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @11842
@11840: 
        mov     EAX,  @@TEXT+3454
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-260]
        cmp     EAX,  EBX
        jne     @11842
@11841: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11842: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  @@TEXT+3458
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @11845
@11843: 
        mov     EAX,  @@TEXT+3463
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-260]
        cmp     EAX,  EBX
        jne     @11845
@11844: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11845: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  @@TEXT+3468
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @11853
@11846: 
        mov     EAX,  @@TEXT+3473
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-260]
        cmp     EAX,  EBX
        jne     @11853
@11847: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11849
@11848: 
        mov     EAX,  @@TEXT+3478
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11852
@11849: 
        mov     EAX,  @@TEXT+3497
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11852: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11853: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  @@TEXT+3516
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @11861
@11854: 
        mov     EAX,  @@TEXT+3521
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-260]
        cmp     EAX,  EBX
        jne     @11861
@11855: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11857
@11856: 
        mov     EAX,  @@TEXT+3526
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11860
@11857: 
        mov     EAX,  @@TEXT+3545
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11860: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11861: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  @@TEXT+3564
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @11869
@11862: 
        mov     EAX,  @@TEXT+3568
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-260]
        cmp     EAX,  EBX
        jne     @11869
@11863: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11865
@11864: 
        mov     EAX,  @@TEXT+3573
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11868
@11865: 
        mov     EAX,  @@TEXT+3592
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11868: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11869: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  @@TEXT+3611
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @11877
@11870: 
        mov     EAX,  @@TEXT+3615
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-260]
        cmp     EAX,  EBX
        jne     @11877
@11871: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11873
@11872: 
        mov     EAX,  @@TEXT+3620
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11876
@11873: 
        mov     EAX,  @@TEXT+3639
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11876: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11877: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  @@TEXT+3658
        push    EAX
        call    @10084    ; Find
        pop     EBX
        cmp     EAX,  EBX
        jne     @11880
@11878: 
        mov     EAX,  @@TEXT+3662
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-260]
        cmp     EAX,  EBX
        jne     @11880
@11879: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @11883
@11880: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@11883: 
        jmp     @12188
@11884: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP-260]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        cmp     EAX,  1
        je      @11885
        cmp     EAX,  4
        je      @11891
        jmp     @11897
@11885: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11887
@11886: 
        mov     EAX,  @@TEXT+3667
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11890
@11887: 
        mov     EAX,  @@TEXT+3678
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11890: 
        jmp     @11898
@11891: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11893
@11892: 
        mov     EAX,  @@TEXT+3689
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11896
@11893: 
        mov     EAX,  @@TEXT+3701
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11896: 
        jmp     @11898
@11897: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @11898
@11898: 
        mov     EAX,  dword [EBP-260]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12188
@11899: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        jne     @11906
@11900: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11902
@11901: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3713
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11905
@11902: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  4294967295
        xchg    EAX,  EBX
        sub     EAX,  EBX
        add     EAX,  1
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3728
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11905: 
        mov     EAX,  @@TEXT+3743
        push    EAX
        call    @10084    ; Find
        mov     ESP,  EBP
        pop     EBP
        ret     16
@11906: 
@11907: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11909
@11908: 
        mov     EAX,  @@TEXT+3747
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11912
@11909: 
        mov     EAX,  @@TEXT+3759
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11912: 
        mov     EAX,  @@TEXT+3771
        push    EAX
        call    @10084    ; Find
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12188
@11913: 
        mov     EAX,  dword [EBP+16]
        cmp     EAX,  0
        jne     @11915
@11914: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+3775
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        jmp     @11918
@11915: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+3776
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
@11918: 
        jmp     @12188
@11919: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP+16]
        cmp     EAX,  0
        jne     @11921
@11920: 
        mov     EAX,  dword [EBP-260]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-264]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+3777
        push    EAX
        mov     EAX,  dword [EBP-260]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3778
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+3788
        push    EAX
        mov     EAX,  dword [EBP-264]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        jmp     @11924
@11921: 
        mov     EAX,  dword [EBP-260]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-264]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+3789
        push    EAX
        mov     EAX,  dword [EBP-260]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3790
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+3800
        push    EAX
        mov     EAX,  dword [EBP-264]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
@11924: 
        jmp     @12188
@11925: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP+16]
        cmp     EAX,  0
        jne     @11927
@11926: 
        mov     EAX,  dword [EBP-260]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-264]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+3801
        push    EAX
        mov     EAX,  dword [EBP-260]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3802
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+3812
        push    EAX
        mov     EAX,  dword [EBP-264]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        jmp     @11930
@11927: 
        mov     EAX,  dword [EBP-260]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-264]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+3813
        push    EAX
        mov     EAX,  dword [EBP-260]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP+20]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3814
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+3824
        push    EAX
        mov     EAX,  dword [EBP-264]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
@11930: 
        jmp     @12188
@11931: 
        mov     EAX,  dword [EBP+16]
        cmp     EAX,  0
        jne     @11933
@11932: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+3825
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        jmp     @11936
@11933: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+3826
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
@11936: 
        jmp     @12188
@11937: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        mov     EBX,  20
        cmp     EAX,  EBX
        jb      @11940
@11938: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  25
        ja      @11940
@11939: 
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
@11940: 
@11941: 
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        je      @11943
@11942: 
        mov     EAX,  @@TEXT+3827
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
@11943: 
@11944: 
        mov     EAX,  0
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  2
        je      @11947
@11945: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        je      @11947
@11946: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        jne     @11948
@11947: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     dword [EBP-264], EAX
        mov     EAX,  2
        mov     dword [EBP-260], EAX
        jmp     @11960
@11948: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  2
        je      @11951
@11949: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        je      @11951
@11950: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  4
        jne     @11952
@11951: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  1
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     dword [EBP-264], EAX
        mov     EAX,  1
        mov     dword [EBP-260], EAX
        jmp     @11960
@11952: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  36
        jne     @11954
@11953: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  1
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     dword [EBP-264], EAX
        mov     EAX,  1
        mov     dword [EBP-260], EAX
        jmp     @11960
@11954: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     dword [EBP-264], EAX
        mov     EAX,  1
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [@@DATA+4749860]
        cmp     EAX,  0
        jne     @11957
@11956: 
        mov     EAX,  @@TEXT+3839
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  1
        mov     dword [EBP-260], EAX
@11957: 
@11958: 
@11960: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        mov     dword [EBP-268], EAX
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  1
        je      @11961
        cmp     EAX,  2
        je      @11968
        jmp     @11971
@11961: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  20
        je      @11962
        cmp     EAX,  21
        je      @11963
        cmp     EAX,  24
        je      @11964
        cmp     EAX,  25
        je      @11965
        cmp     EAX,  27
        je      @11966
        cmp     EAX,  29
        je      @11966
        cmp     EAX,  30
        je      @11966
        jmp     @11967
@11962: 
        mov     EAX,  25
        mov     dword [EBP-268], EAX
        jmp     @11967
@11963: 
        mov     EAX,  24
        mov     dword [EBP-268], EAX
        jmp     @11967
@11964: 
        mov     EAX,  21
        mov     dword [EBP-268], EAX
        jmp     @11967
@11965: 
        mov     EAX,  20
        mov     dword [EBP-268], EAX
        jmp     @11967
@11966: 
        mov     EAX,  @@TEXT+3851
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11967
@11967: 
        jmp     @11971
@11968: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  28
        je      @11969
        cmp     EAX,  29
        je      @11969
        cmp     EAX,  30
        je      @11969
        jmp     @11970
@11969: 
        mov     EAX,  1
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        jmp     @11970
@11970: 
        jmp     @11971
@11971: 
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  4
        mov     dword [EBP-272], EAX
        mov     EAX,  dword [EBP-264]
        cmp     EAX,  1024
        jae     @11973
@11972: 
        mov     EAX,  dword [EBP-264]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-272], EAX
@11973: 
@11974: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  20
        je      @11975
        cmp     EAX,  21
        je      @11975
        cmp     EAX,  22
        je      @11975
        cmp     EAX,  23
        je      @11975
        cmp     EAX,  24
        je      @11975
        cmp     EAX,  25
        je      @11975
        cmp     EAX,  17
        je      @12026
        cmp     EAX,  18
        je      @12027
        cmp     EAX,  19
        je      @12028
        cmp     EAX,  26
        je      @12029
        cmp     EAX,  27
        je      @12030
        cmp     EAX,  28
        je      @12031
        cmp     EAX,  29
        je      @12041
        cmp     EAX,  30
        je      @12051
        jmp     @12059
@11975: 
        mov     EAX,  dword [EBP-272]
        cmp     EAX,  1
        je      @11976
        cmp     EAX,  4
        je      @11982
        jmp     @11988
@11976: 
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  2
        jne     @11978
@11977: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3869
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11981
@11978: 
        mov     EAX,  @@TEXT+3884
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11981: 
        jmp     @11989
@11982: 
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  2
        jne     @11984
@11983: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3901
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @11987
@11984: 
        mov     EAX,  @@TEXT+3916
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@11987: 
        jmp     @11989
@11988: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @11989
@11989: 
        mov     EAX,  dword [EBP+16]
        cmp     EAX,  0
        jne     @11999
@11990: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  20
        je      @11991
        cmp     EAX,  21
        je      @11992
        cmp     EAX,  22
        je      @11993
        cmp     EAX,  23
        je      @11994
        cmp     EAX,  24
        je      @11995
        cmp     EAX,  25
        je      @11996
        jmp     @11997
@11991: 
        mov     EAX,  24
        mov     dword [EBP-268], EAX
        jmp     @11998
@11992: 
        mov     EAX,  25
        mov     dword [EBP-268], EAX
        jmp     @11998
@11993: 
        mov     EAX,  23
        mov     dword [EBP-268], EAX
        jmp     @11998
@11994: 
        mov     EAX,  22
        mov     dword [EBP-268], EAX
        jmp     @11998
@11995: 
        mov     EAX,  20
        mov     dword [EBP-268], EAX
        jmp     @11998
@11996: 
        mov     EAX,  21
        mov     dword [EBP-268], EAX
        jmp     @11998
@11997: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @11998
@11998: 
        mov     EAX,  dword [EBP+12]
        mov     dword [EBP+16], EAX
        mov     EAX,  0
        mov     dword [EBP+12], EAX
@11999: 
@12000: 
        mov     EAX,  dword [EBP+16]
        cmp     EAX,  0
        je      @12002
@12001: 
        mov     EAX,  dword [EBP+12]
        cmp     EAX,  0
        je      @12003
@12002: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@12003: 
@12004: 
        mov     EAX,  @@TEXT+3934
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-264]
        cmp     EAX,  EBX
        jne     @12014
@12005: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  20
        je      @12006
        cmp     EAX,  21
        je      @12007
        cmp     EAX,  22
        je      @12008
        cmp     EAX,  23
        je      @12009
        cmp     EAX,  24
        je      @12010
        cmp     EAX,  25
        je      @12011
        jmp     @12012
@12006: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3938
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12013
@12007: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3948
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12013
@12008: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3958
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12013
@12009: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3968
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12013
@12010: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3978
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12013
@12011: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3988
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12013
@12012: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @12013
@12013: 
        jmp     @12025
@12014: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  20
        je      @12016
        cmp     EAX,  21
        je      @12017
        cmp     EAX,  22
        je      @12018
        cmp     EAX,  23
        je      @12019
        cmp     EAX,  24
        je      @12020
        cmp     EAX,  25
        je      @12021
        jmp     @12022
@12016: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+3998
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12023
@12017: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4008
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12023
@12018: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4018
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12023
@12019: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4028
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12023
@12020: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4038
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12023
@12021: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4048
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12023
@12022: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @12023
@12023: 
@12025: 
        mov     EAX,  1024
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12060
@12026: 
        mov     EAX,  @@TEXT+4058
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @12060
@12027: 
        mov     EAX,  @@TEXT+4067
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @12060
@12028: 
        mov     EAX,  @@TEXT+4076
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @12060
@12029: 
        mov     EAX,  @@TEXT+4085
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @12060
@12030: 
        mov     EAX,  @@TEXT+4094
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        jmp     @12060
@12031: 
        mov     EAX,  @@TEXT+4103
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-264]
        cmp     EAX,  EBX
        jne     @12033
@12032: 
        mov     EAX,  @@TEXT+4108
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12040
@12033: 
        mov     EAX,  @@TEXT+4119
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-264]
        cmp     EAX,  EBX
        jne     @12035
@12034: 
        mov     EAX,  @@TEXT+4124
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12040
@12035: 
        mov     EAX,  @@TEXT+4136
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-264]
        cmp     EAX,  EBX
        jne     @12037
@12036: 
        mov     EAX,  @@TEXT+4140
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12040
@12037: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@12040: 
        mov     EAX,  dword [EBP-264]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12060
@12041: 
        mov     EAX,  @@TEXT+4152
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-264]
        cmp     EAX,  EBX
        jne     @12043
@12042: 
        mov     EAX,  @@TEXT+4157
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4174
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12050
@12043: 
        mov     EAX,  @@TEXT+4185
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-264]
        cmp     EAX,  EBX
        jne     @12045
@12044: 
        mov     EAX,  @@TEXT+4190
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4208
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12050
@12045: 
        mov     EAX,  @@TEXT+4220
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-264]
        cmp     EAX,  EBX
        jne     @12047
@12046: 
        mov     EAX,  @@TEXT+4224
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4242
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12050
@12047: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@12050: 
        mov     EAX,  dword [EBP-264]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12060
@12051: 
        mov     EAX,  @@TEXT+4254
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-264]
        cmp     EAX,  EBX
        jne     @12053
@12052: 
        mov     EAX,  @@TEXT+4259
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4276
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4287
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12058
@12053: 
        mov     EAX,  @@TEXT+4304
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-264]
        cmp     EAX,  EBX
        jne     @12055
@12054: 
        mov     EAX,  @@TEXT+4309
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4327
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4339
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12058
@12055: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@12058: 
        mov     EAX,  dword [EBP-264]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12060
@12059: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @12060
@12060: 
        mov     EAX,  dword [EBP-272]
        cmp     EAX,  1
        je      @12061
        cmp     EAX,  4
        je      @12067
        jmp     @12073
@12061: 
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  2
        jne     @12063
@12062: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4357
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12066
@12063: 
        mov     EAX,  @@TEXT+4364
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12066: 
        jmp     @12074
@12067: 
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  2
        jne     @12069
@12068: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4373
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12072
@12069: 
        mov     EAX,  @@TEXT+4380
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12072: 
        jmp     @12074
@12073: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @12074
@12074: 
        mov     EAX,  dword [EBP-264]
        mov     ESP,  EBP
        pop     EBP
        ret     16
        jmp     @12188
@12075: 
        mov     EAX,  dword [@@DATA+126980]
        cmp     EAX,  1024
        jb      @12077
@12076: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12077: 
@12078: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-264], EAX
        mov     EAX,  4
        mov     dword [EBP-268], EAX
        mov     EAX,  dword [EBP-264]
        cmp     EAX,  0
        jne     @12080
@12079: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-268], EAX
@12080: 
@12081: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [EBP-268]
        mul     EBX
        push    EAX
        call    @11292    ; Even
        mov     EBX,  dword [@@DATA+4749856]
        add     EAX,  EBX
        mov     dword [@@DATA+4749856], EAX
        mov     EAX,  dword [EBP-260]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73764], EAX
        mov     EAX,  dword [EBP-264]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73768], EAX
        mov     EAX,  dword [@@DATA+4749856]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73780], EAX
        inc     dword [@@DATA+126980]
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        jmp     @12188
@12082: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        cmp     EAX,  262144
        jae     @12084
@12083: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
@12084: 
@12085: 
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     dword [EBP-260], EAX
        mov     EAX,  4
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  1024
        jae     @12087
@12086: 
        mov     EAX,  dword [EBP-260]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-264], EAX
@12087: 
@12088: 
        mov     EAX,  dword [EBP-264]
        cmp     EAX,  1
        je      @12089
        cmp     EAX,  4
        je      @12090
        jmp     @12091
@12089: 
        mov     EAX,  @@TEXT+4390
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12092
@12090: 
        mov     EAX,  @@TEXT+4402
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12092
@12091: 
        mov     EAX,  dword [EBP-264]
        push    EAX
        call    @11292    ; Even
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4414
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4429
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4447
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4465
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-264]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4469
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4484
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12092
@12092: 
        jmp     @12188
@12093: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP+8], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        cmp     EAX,  262144
        jae     @12095
@12094: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  1
        mov     dword [@@DATA+4749860], EAX
@12095: 
@12096: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        jmp     @12188
@12097: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        cmp     EAX,  262144
        jae     @12106
@12098: 
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     dword [EBP-260], EAX
        mov     EAX,  4
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP-260]
        cmp     EAX,  1024
        jae     @12100
@12099: 
        mov     EAX,  dword [EBP-260]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-264], EAX
@12100: 
@12101: 
        mov     EAX,  dword [EBP-264]
        cmp     EAX,  1
        je      @12104
@12102: 
        mov     EAX,  dword [EBP-264]
        cmp     EAX,  4
        je      @12104
@12103: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@12104: 
@12105: 
@12106: 
@12107: 
        mov     EAX,  @@TEXT+4498
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4516
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  2
        jne     @12115
@12108: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  1
        je      @12109
        cmp     EAX,  2
        je      @12110
        cmp     EAX,  3
        je      @12111
        cmp     EAX,  4
        je      @12112
        jmp     @12113
@12109: 
        mov     EAX,  @@TEXT+4528
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4546
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4580
        push    EAX
        mov     EAX,  @@TEXT+4568
        push    EAX
        call    @10084    ; Find
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4558
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12114
@12110: 
        mov     EAX,  @@TEXT+4582
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4598
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4616
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12114
@12111: 
        jmp     @12114
@12112: 
        jmp     @12114
@12113: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @12114
@12114: 
        jmp     @12118
@12115: 
        mov     EAX,  dword [@@DATA+4749852]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4628
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12118: 
        jmp     @12188
@12119: 
        mov     EAX,  16
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10041    ; str2
        push    EAX
        mov     EAX,  @@TEXT+4637
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12188
@12120: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP-260]
        mov     AL,   byte  [@@DATA+EAX+129036]
        cmp     AL,   64
        jne     @12122
@12121: 
        mov     EAX,  dword [EBP-260]
        add     EAX,  @@DATA+129036
        push    EAX
        call    @11272    ; Decl
        jmp     @12125
@12122: 
        mov     EAX,  dword [EBP-260]
        add     EAX,  @@DATA+129036
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12125: 
        jmp     @12188
@12126: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP-260]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        add     EAX,  @@DATA+129036
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @11276    ; DeclNR
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        cmp     EAX,  262144
        jae     @12128
@12127: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
@12128: 
@12129: 
        jmp     @12188
@12130: 
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [@@DATA+4749856]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-268], EAX
@12131: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  262144
        jae     @12133
@12132: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-268]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP-268]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-268], EAX
        jmp     @12131
@12133: 
        mov     EAX,  dword [EBP-264]
        mov     dword [@@DATA+4749856], EAX
        mov     EAX,  dword [EBP-260]
        mov     dword [@@DATA+126980], EAX
        jmp     @12188
@12134: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP+8], EAX
@12135: 
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  262144
        jae     @12149
@12136: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        cmp     EAX,  262144
        jae     @12138
@12137: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP+12], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP+16], EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+4648
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @11280    ; Emit
@12138: 
@12139: 
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [@@DATA+4749856]
        mov     dword [EBP-268], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-272], EAX
@12140: 
        mov     EAX,  dword [EBP-272]
        cmp     EAX,  262144
        jae     @12142
@12141: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP-272]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-272], EAX
        jmp     @12140
@12142: 
        mov     EAX,  dword [EBP-268]
        mov     dword [@@DATA+4749856], EAX
        mov     EAX,  dword [EBP-264]
        mov     dword [@@DATA+126980], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        cmp     EAX,  262144
        jae     @12144
@12143: 
        mov     EAX,  dword [EBP-260]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4649
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12144: 
@12145: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        cmp     EAX,  262144
        jae     @12147
@12146: 
        mov     EAX,  @@TEXT+4659
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @11280    ; Emit
@12147: 
@12148: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP+8], EAX
        jmp     @12135
@12149: 
        mov     EAX,  @@TEXT+4660
        push    EAX
        mov     EAX,  dword [EBP-260]
        push    EAX
        call    @11280    ; Emit
        jmp     @12188
@12150: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [EBP-260]
        mov     dword [EBP-264], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749860], EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        push    EAX
        call    @11381    ; Code
        mov     dword [EBP-268], EAX
        mov     EAX,  @@TEXT+4661
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-268]
        cmp     EAX,  EBX
        jne     @12152
@12151: 
        mov     EAX,  @@TEXT+4666
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12152: 
@12153: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-272], EAX
@12154: 
        mov     EAX,  dword [EBP-272]
        cmp     EAX,  262144
        jae     @12167
@12155: 
        mov     EAX,  dword [EBP-272]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-276], EAX
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  262144
        jne     @12157
@12156: 
        mov     EAX,  dword [EBP-272]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-264], EAX
@12157: 
@12158: 
@12159: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  262144
        je      @12166
@12160: 
        mov     EAX,  @@TEXT+4685
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-268]
        cmp     EAX,  EBX
        jne     @12162
@12161: 
        mov     EAX,  dword [EBP-276]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4690
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12165
@12162: 
        mov     EAX,  dword [EBP-276]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4705
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12165: 
        mov     EAX,  dword [EBP-272]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4720
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-276]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-276], EAX
        jmp     @12159
@12166: 
        mov     EAX,  dword [EBP-272]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-272], EAX
        jmp     @12154
@12167: 
        mov     EAX,  dword [EBP-264]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4730
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-276], EAX
@12168: 
        mov     EAX,  dword [EBP-276]
        cmp     EAX,  262144
        jae     @12173
@12169: 
        mov     EAX,  @@TEXT+4740
        push    EAX
        mov     EAX,  dword [EBP-276]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-280], EAX
        mov     EAX,  dword [@@DATA+4749856]
        mov     dword [EBP-284], EAX
        mov     EAX,  dword [EBP-276]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-288], EAX
@12170: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  262144
        jae     @12172
@12171: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-288]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP-288]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-288], EAX
        jmp     @12170
@12172: 
        mov     EAX,  dword [EBP-284]
        mov     dword [@@DATA+4749856], EAX
        mov     EAX,  dword [EBP-280]
        mov     dword [@@DATA+126980], EAX
        mov     EAX,  dword [EBP-260]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4741
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-276]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-276], EAX
        jmp     @12168
@12173: 
        mov     EAX,  @@TEXT+4751
        push    EAX
        mov     EAX,  dword [EBP-260]
        push    EAX
        call    @11280    ; Emit
        jmp     @12188
@12174: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP+12], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP+8], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP+16], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP-260], EAX
        mov     EAX,  @@TEXT+4752
        push    EAX
        mov     EAX,  dword [EBP-260]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        cmp     EAX,  262144
        jae     @12176
@12175: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  @@TEXT+4753
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @11280    ; Emit
@12176: 
@12177: 
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [@@DATA+4749856]
        mov     dword [EBP-268], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-272], EAX
@12178: 
        mov     EAX,  dword [EBP-272]
        cmp     EAX,  262144
        jae     @12180
@12179: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-272]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP-272]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-272], EAX
        jmp     @12178
@12180: 
        mov     EAX,  dword [EBP-268]
        mov     dword [@@DATA+4749856], EAX
        mov     EAX,  dword [EBP-264]
        mov     dword [@@DATA+126980], EAX
        mov     EAX,  dword [EBP-260]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4754
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+4764
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @11280    ; Emit
        jmp     @12188
@12181: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP+16], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP+8], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     dword [EBP+12], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP+8], EAX
        mov     EAX,  @@TEXT+4765
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-260], EAX
        mov     EAX,  dword [@@DATA+4749856]
        mov     dword [EBP-264], EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391192]
        mov     dword [EBP-268], EAX
@12182: 
        mov     EAX,  dword [EBP-268]
        cmp     EAX,  262144
        jae     @12184
@12183: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-268]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP-268]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-268], EAX
        jmp     @12182
@12184: 
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP-264]
        mov     dword [@@DATA+4749856], EAX
        mov     EAX,  dword [EBP-260]
        mov     dword [@@DATA+126980], EAX
        mov     EAX,  @@TEXT+4766
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        call    @11280    ; Emit
        jmp     @12188
@12185: 
        mov     EAX,  dword [EBP+8]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+4767
        push    EAX
        lea     EAX,  [EBP-256]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12188
@12186: 
        jmp     @12188
@12187: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @12188
@12188: 
        mov     EAX,  1024
        mov     ESP,  EBP
        pop     EBP
        ret     16

@12189:        ;Main
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  824
        mov     EAX,  0
        mov     dword [EBP-4], EAX
        mov     EAX,  0
        mov     dword [EBP-8], EAX
        mov     EAX,  0
        mov     dword [EBP-12], EAX
@12190: 
        mov     EAX,  dword [EBP-12]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        je      @12197
@12191: 
        mov     EAX,  dword [EBP-12]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   46
        jne     @12193
@12192: 
        mov     EAX,  dword [EBP-12]
        mov     dword [EBP-8], EAX
        jmp     @12196
@12193: 
        mov     EAX,  dword [EBP-12]
        add     EAX,  dword [EBP+8]
        mov     AL,   byte  [EAX+0]
        push    EAX
        call    @10000    ; separator
        pop     EBX
        cmp     AL,   BL
        jne     @12195
@12194: 
        mov     EAX,  dword [EBP-12]
        add     EAX,  1
        mov     dword [EBP-4], EAX
        mov     EAX,  0
        mov     dword [EBP-8], EAX
@12195: 
@12196: 
        inc     dword [EBP-12]
        jmp     @12190
@12197: 
        mov     EAX,  dword [EBP-8]
        cmp     EAX,  0
        jne     @12202
@12198: 
        mov     EAX,  dword [EBP-12]
        add     EAX,  4
        cmp     EAX,  256
        jb      @12200
@12199: 
        mov     EAX,  @@TEXT+45
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+4777
        push    EAX
        call    @10006    ; puts
        mov     ESP,  EBP
        pop     EBP
        ret     8
@12200: 
@12201: 
        mov     EAX,  @@TEXT+4780
        push    EAX
        mov     EAX,  dword [EBP-12]
        add     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  dword [EBP-12]
        mov     dword [EBP-8], EAX
        mov     EAX,  dword [EBP-12]
        add     EAX,  4
        mov     dword [EBP-12], EAX
@12202: 
@12203: 
        mov     EAX,  dword [EBP-4]
        mov     EBX,  dword [EBP-12]
        xchg    EAX,  EBX
        sub     EAX,  EBX
        cmp     EAX,  32
        jb      @12205
@12204: 
        mov     EAX,  @@TEXT+45
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+4785
        push    EAX
        call    @10006    ; puts
        mov     ESP,  EBP
        pop     EBP
        ret     8
@12205: 
@12206: 
        mov     EAX,  dword [EBP-4]
        add     EAX,  dword [EBP+8]
        push    EAX
        mov     EAX,  @@DATA+4749768
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  @@TEXT+4788
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12208
@12207: 
        mov     EAX,  1
        mov     dword [@@DATA+4749844], EAX
        mov     EAX,  1
        mov     dword [@@DATA+4749848], EAX
        jmp     @12222
@12208: 
        mov     EAX,  @@TEXT+4791
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12210
@12209: 
        mov     EAX,  1
        mov     dword [@@DATA+4749844], EAX
        mov     EAX,  2
        mov     dword [@@DATA+4749848], EAX
        jmp     @12222
@12210: 
        mov     EAX,  @@TEXT+4794
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12212
@12211: 
        mov     EAX,  2
        mov     dword [@@DATA+4749844], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749848], EAX
        jmp     @12222
@12212: 
        mov     EAX,  @@TEXT+4797
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12214
@12213: 
        mov     EAX,  3
        mov     dword [@@DATA+4749844], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749848], EAX
        jmp     @12222
@12214: 
        mov     EAX,  @@TEXT+4800
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12216
@12215: 
        mov     EAX,  4
        mov     dword [@@DATA+4749844], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749848], EAX
        jmp     @12222
@12216: 
        mov     EAX,  dword [EBP+12]
        push    EAX
        call    @10025    ; strlen
        cmp     EAX,  0
        jbe     @12219
@12218: 
        mov     EAX,  @@TEXT+24
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+4803
        push    EAX
        call    @10006    ; puts
        mov     ESP,  EBP
        pop     EBP
        ret     8
@12219: 
@12220: 
@12222: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10001    ; open
        mov     dword [@@DATA+4749800], EAX
        mov     EAX,  dword [@@DATA+4749800]
        cmp     EAX,  2147483648
        jb      @12224
@12223: 
        mov     EAX,  @@TEXT+71
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+4806
        push    EAX
        call    @10006    ; puts
        mov     ESP,  EBP
        pop     EBP
        ret     8
@12224: 
@12225: 
        mov     EAX,  @@TEXT+4809
        push    EAX
        mov     EAX,  dword [EBP-8]
        add     EAX,  dword [EBP+8]
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  0
        mov     dword [@@DATA+73728], EAX
        mov     EAX,  0
        mov     dword [@@DATA+126980], EAX
        mov     EAX,  0
        mov     dword [@@DATA+129032], EAX
        mov     EAX,  0
        mov     dword [@@DATA+391180], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4585488], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4716564], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4716984], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4716988], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749816], EAX
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  1
        je      @12226
        cmp     EAX,  2
        je      @12227
        cmp     EAX,  3
        je      @12228
        cmp     EAX,  4
        je      @12229
        jmp     @12230
@12226: 
        mov     EAX,  @@TEXT+4814
        push    EAX
        mov     EAX,  @@DATA+4716992
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  @@TEXT+4857
        push    EAX
        mov     EAX,  @@DATA+4716992
        push    EAX
        call    @10040    ; strcat
        jmp     @12231
@12227: 
        mov     EAX,  @@TEXT+4912
        push    EAX
        mov     EAX,  @@DATA+4716992
        push    EAX
        call    @10036    ; strcpy
        jmp     @12231
@12228: 
        mov     EAX,  @@TEXT+4955
        push    EAX
        mov     EAX,  @@DATA+4716992
        push    EAX
        call    @10036    ; strcpy
        jmp     @12231
@12229: 
        mov     EAX,  @@TEXT+4988
        push    EAX
        mov     EAX,  @@DATA+4716992
        push    EAX
        call    @10036    ; strcpy
        jmp     @12231
@12230: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @12231
@12231: 
        mov     EAX,  @@DATA+4716992
        push    EAX
        call    @10025    ; strlen
        mov     dword [@@DATA+4749760], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749764], EAX
        mov     EAX,  1
        mov     dword [@@DATA+4749804], EAX
        mov     EAX,  1
        mov     dword [@@DATA+4749808], EAX
        mov     EAX,  1
        mov     dword [@@DATA+4749820], EAX
        mov     EAX,  262144
        mov     dword [@@DATA+4749836], EAX
        mov     EAX,  @@TEXT+5033
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5041
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5048
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5055
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5063
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5072
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5081
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5084
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5090
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5099
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5106
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5111
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5119
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5122
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5127
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5132
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5139
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5142
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5148
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5151
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5158
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5164
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5169
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5174
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5178
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5182
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5189
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5194
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5198
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5205
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5210
        push    EAX
        call    @10101    ; Word
        mov     EAX,  @@TEXT+5215
        push    EAX
        call    @10101    ; Word
        mov     EAX,  0
        push    EAX
        mov     EAX,  @@TEXT+5219
        push    EAX
        call    @10102    ; Base
        mov     EAX,  1
        push    EAX
        mov     EAX,  @@TEXT+5224
        push    EAX
        call    @10102    ; Base
        mov     EAX,  1
        push    EAX
        mov     EAX,  @@TEXT+5229
        push    EAX
        call    @10102    ; Base
        mov     EAX,  4
        push    EAX
        mov     EAX,  @@TEXT+5234
        push    EAX
        call    @10102    ; Base
        mov     EAX,  4
        push    EAX
        mov     EAX,  @@TEXT+5239
        push    EAX
        call    @10102    ; Base
        mov     EAX,  0
        mov     dword [EBP-272], EAX
        mov     EAX,  0
        mov     dword [EBP-276], EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
@12232: 
        mov     EAX,  @@TEXT+5243
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12245
@12234: 
        mov     EAX,  dword [@@DATA+4716984]
        cmp     EAX,  0
        jbe     @12236
@12235: 
        mov     EAX,  @@TEXT+95
        push    EAX
        call    @10050    ; Stop
@12236: 
@12237: 
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @12239
@12238: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12239: 
@12240: 
        mov     EAX,  dword [@@DATA+73728]
        mov     dword [@@DATA+4749824], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [@@DATA+4749828], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     dword [@@DATA+4749832], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     dword [EBP-276], EAX
        mov     EAX,  5
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  @@TEXT+5249
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  2
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+36], EAX
        mov     EAX,  @@TEXT+5250
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+44], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+48], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+52], EAX
        mov     EAX,  1
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        inc     dword [@@DATA+73728]
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        add     EAX,  @@DATA+56
        mov     dword [EBP-280], EAX
        mov     EAX,  0
        mov     dword [EBP-284], EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
@12241: 
        mov     EAX,  dword [EBP-284]
        cmp     EAX,  0
        je      @12243
@12242: 
        mov     EAX,  @@TEXT+5255
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @12244
@12243: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10919    ; Ctrl
        mov     EBX,  dword [EBP-280]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-280]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-280], EAX
        mov     EAX,  1
        mov     dword [EBP-284], EAX
        jmp     @12241
@12244: 
        mov     EAX,  dword [@@DATA+4749832]
        mov     dword [@@DATA+129032], EAX
        mov     EAX,  dword [@@DATA+4749828]
        mov     dword [@@DATA+126980], EAX
        jmp     @12514
        jmp     @12510
@12245: 
        mov     EAX,  @@TEXT+5259
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12286
@12246: 
        mov     EAX,  @@TEXT+5267
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @12248
@12247: 
        mov     EAX,  @@TEXT+464
        push    EAX
        call    @10050    ; Stop
@12248: 
@12249: 
        mov     EAX,  0
        mov     dword [EBP-280], EAX
@12250: 
        call    @10103    ; Read
        cmp     AL,   34
        je      @12261
@12251: 
        call    @10103    ; Read
        cmp     AL,   10
        je      @12255
@12252: 
        call    @10103    ; Read
        cmp     AL,   13
        je      @12255
@12253: 
        call    @10103    ; Read
        cmp     AL,   9
        je      @12255
@12254: 
        call    @10103    ; Read
        cmp     AL,   32
        jne     @12256
@12255: 
        mov     EAX,  @@TEXT+464
        push    EAX
        call    @10050    ; Stop
@12256: 
@12257: 
        call    @10103    ; Read
        mov     EBX,  dword [EBP-280]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-280]
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  256
        jb      @12259
@12258: 
        mov     EAX,  @@TEXT+211
        push    EAX
        call    @10050    ; Stop
@12259: 
@12260: 
        call    @10121    ; Next
        jmp     @12250
@12261: 
        mov     AL,   0
        mov     EBX,  dword [EBP-280]
        mov     byte  [EBP+EBX-268], AL
        call    @10121    ; Next
        mov     EAX,  dword [EBP-272]
        mov     EBX,  dword [@@DATA+4749812]
        cmp     EAX,  EBX
        je      @12263
@12262: 
        mov     EAX,  @@TEXT+95
        push    EAX
        call    @10050    ; Stop
@12263: 
@12264: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10094    ; FindIncl
        mov     dword [EBP-280], EAX
        mov     EAX,  dword [@@DATA+4716564]
        mov     EBX,  dword [EBP-280]
        cmp     EAX,  EBX
        jbe     @12269
@12265: 
        mov     EAX,  dword [EBP-272]
        mov     EBX,  dword [@@DATA+4749812]
        cmp     EAX,  EBX
        je      @12267
@12266: 
        mov     EAX,  @@TEXT+95
        push    EAX
        call    @10050    ; Stop
@12267: 
@12268: 
        mov     EAX,  dword [@@DATA+4716984]
        mov     dword [EBP-272], EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        jmp     @12232
@12269: 
@12270: 
        mov     EAX,  dword [@@DATA+4716564]
        cmp     EAX,  512
        jb      @12272
@12271: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12272: 
@12273: 
        lea     EAX,  [EBP-268]
        push    EAX
        mov     EAX,  dword [@@DATA+4716564]
        imul    EAX,  256
        add     EAX,  @@DATA+4585492
        push    EAX
        call    @10036    ; strcpy
        inc     dword [@@DATA+4716564]
        mov     EAX,  dword [@@DATA+4716984]
        cmp     EAX,  8
        jb      @12275
@12274: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12275: 
@12276: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10001    ; open
        mov     dword [EBP-284], EAX
        mov     EAX,  dword [EBP-284]
        cmp     EAX,  2147483648
        jb      @12278
@12277: 
        mov     EAX,  @@TEXT+71
        push    EAX
        call    @10050    ; Stop
@12278: 
@12279: 
        mov     EAX,  @@TEXT+5273
        push    EAX
        mov     EAX,  dword [@@DATA+4749804]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+5271
        push    EAX
        mov     EAX,  @@DATA+4749768
        push    EAX
        mov     EAX,  @@TEXT+5269
        push    EAX
        lea     EAX,  [EBP-540]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10006    ; puts
        mov     EAX,  dword [@@DATA+4749800]
        mov     EBX,  dword [@@DATA+4716984]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+4716600], EAX
        mov     EAX,  @@DATA+4749768
        push    EAX
        mov     EAX,  dword [@@DATA+4716984]
        imul    EAX,  52
        add     EAX,  @@DATA+4716568
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  dword [@@DATA+4749760]
        mov     EBX,  dword [@@DATA+4716984]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+4716604], EAX
        mov     EAX,  dword [@@DATA+4749764]
        mov     EBX,  dword [@@DATA+4716984]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+4716608], EAX
        mov     EAX,  dword [@@DATA+4749804]
        mov     EBX,  dword [@@DATA+4716984]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+4716612], EAX
        mov     EAX,  dword [@@DATA+4749808]
        mov     EBX,  dword [@@DATA+4716984]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+4716616], EAX
        inc     dword [@@DATA+4716984]
        mov     EAX,  0
        mov     dword [EBP-544], EAX
        mov     EAX,  0
        mov     dword [EBP-548], EAX
@12280: 
        mov     EAX,  dword [EBP-544]
        mov     AL,   byte  [EBP+EAX-268]
        cmp     AL,   0
        je      @12285
@12281: 
        mov     EAX,  dword [EBP-544]
        mov     AL,   byte  [EBP+EAX-268]
        push    EAX
        call    @10000    ; separator
        pop     EBX
        cmp     AL,   BL
        jne     @12283
@12282: 
        mov     EAX,  dword [EBP-544]
        add     EAX,  1
        mov     dword [EBP-548], EAX
@12283: 
@12284: 
        inc     dword [EBP-544]
        jmp     @12280
@12285: 
        mov     EAX,  dword [@@DATA+4716988]
        add     EAX,  4096
        mov     dword [@@DATA+4716988], EAX
        mov     EAX,  dword [EBP-284]
        mov     dword [@@DATA+4749800], EAX
        mov     EAX,  dword [EBP-548]
        lea     EAX,  [EBP+EAX-268]
        push    EAX
        mov     EAX,  @@DATA+4749768
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  dword [@@DATA+4716988]
        mov     dword [@@DATA+4749760], EAX
        mov     EAX,  dword [@@DATA+4716988]
        mov     dword [@@DATA+4749764], EAX
        mov     EAX,  dword [@@DATA+4716984]
        mov     dword [@@DATA+4749812], EAX
        mov     EAX,  dword [@@DATA+4716984]
        mov     dword [EBP-272], EAX
        mov     EAX,  1
        mov     dword [@@DATA+4749804], EAX
        mov     EAX,  1
        mov     dword [@@DATA+4749808], EAX
        jmp     @12510
@12286: 
        mov     EAX,  @@TEXT+5277
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12333
@12287: 
        mov     EAX,  0
        mov     dword [EBP-280], EAX
        mov     EAX,  @@TEXT+5284
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12289
@12288: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  1
        mov     dword [EBP-280], EAX
@12289: 
@12290: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        cmp     EAX,  EBX
        jae     @12292
@12291: 
        mov     EAX,  @@TEXT+291
        push    EAX
        call    @10050    ; Stop
@12292: 
@12293: 
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @12295
@12294: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12295: 
@12296: 
        mov     EAX,  2
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  dword [@@DATA+73728]
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10073    ; Copy
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+44], EAX
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  dword [EBP-280]
        cmp     EAX,  0
        jne     @12326
@12297: 
        mov     EAX,  @@TEXT+5286
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12302
@12298: 
        mov     EAX,  @@TEXT+5288
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        call    @10123    ; Sign
        and     EAX,  0FFH
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        call    @10103    ; Read
        cmp     AL,   39
        je      @12300
@12299: 
        mov     EAX,  @@TEXT+464
        push    EAX
        call    @10050    ; Stop
@12300: 
@12301: 
        call    @10121    ; Next
        jmp     @12325
@12302: 
        mov     EAX,  @@TEXT+5293
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12307
@12303: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10054    ; val
        mov     dword [EBP-284], EAX
        mov     EAX,  dword [EBP-284]
        cmp     EAX,  255
        jbe     @12305
@12304: 
        mov     EAX,  @@TEXT+186
        push    EAX
        call    @10050    ; Stop
@12305: 
@12306: 
        mov     EAX,  @@TEXT+5295
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  dword [EBP-284]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        jmp     @12325
@12307: 
        lea     EAX,  [EBP-268]
        push    EAX
        lea     EAX,  [EBP-288]
        push    EAX
        lea     EAX,  [EBP-284]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     dword [EBP-292], EAX
        mov     EAX,  dword [EBP-292]
        add     EAX,  1
        mov     dword [@@DATA+4585488], EAX
        mov     EAX,  dword [EBP-292]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        cmp     EAX,  3
        je      @12309
        cmp     EAX,  4
        je      @12310
        jmp     @12311
@12309: 
        mov     EAX,  @@TEXT+5300
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  dword [EBP-292]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        jmp     @12312
@12310: 
        mov     EAX,  @@TEXT+5305
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  dword [EBP-292]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391188]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        jmp     @12312
@12311: 
        mov     EAX,  @@TEXT+550
        push    EAX
        call    @10050    ; Stop
        jmp     @12312
@12312: 
        inc     dword [@@DATA+73728]
        mov     EAX,  @@TEXT+5309
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12317
@12313: 
        mov     EAX,  dword [EBP-272]
        mov     EBX,  dword [@@DATA+4749812]
        cmp     EAX,  EBX
        je      @12315
@12314: 
        mov     EAX,  @@TEXT+95
        push    EAX
        call    @10050    ; Stop
@12315: 
@12316: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        jmp     @12323
@12317: 
        mov     EAX,  dword [EBP-272]
        mov     EBX,  dword [@@DATA+4749840]
        cmp     EAX,  EBX
        je      @12320
@12319: 
        mov     EAX,  @@TEXT+95
        push    EAX
        call    @10050    ; Stop
@12320: 
@12321: 
@12323: 
        mov     EAX,  dword [@@DATA+4749812]
        mov     dword [EBP-272], EAX
        jmp     @12232
@12325: 
        jmp     @12332
@12326: 
        mov     EAX,  @@TEXT+5311
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @12329
@12328: 
        mov     EAX,  @@TEXT+464
        push    EAX
        call    @10050    ; Stop
@12329: 
@12330: 
        call    @10132    ; Line
@12332: 
        inc     dword [@@DATA+73728]
        jmp     @12510
@12333: 
        mov     EAX,  @@TEXT+5313
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12397
@12334: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10084    ; Find
        mov     dword [EBP-280], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-280]
        cmp     EAX,  EBX
        jbe     @12336
@12335: 
        mov     EAX,  @@TEXT+291
        push    EAX
        call    @10050    ; Stop
@12336: 
@12337: 
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @12339
@12338: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12339: 
@12340: 
        mov     EAX,  3
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  dword [@@DATA+73728]
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10073    ; Copy
        mov     EAX,  1
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+36], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+48], EAX
        mov     EAX,  @@TEXT+5320
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12342
@12341: 
        mov     EAX,  @@TEXT+915
        push    EAX
        call    @10050    ; Stop
@12342: 
@12343: 
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [EBP-284], EAX
@12344: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10084    ; Find
        mov     dword [EBP-280], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-280]
        cmp     EAX,  EBX
        ja      @12350
@12346: 
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @12348
@12347: 
        mov     EAX,  @@TEXT+696
        push    EAX
        call    @10050    ; Stop
@12348: 
@12349: 
        jmp     @12356
@12350: 
        mov     EAX,  dword [EBP-280]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  3
        je      @12353
@12352: 
        mov     EAX,  @@TEXT+696
        push    EAX
        call    @10050    ; Stop
@12353: 
@12354: 
@12356: 
@12357: 
        mov     EAX,  0
        mov     dword [EBP-288], EAX
@12359: 
        mov     EAX,  @@TEXT+5322
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12361
@12360: 
        inc     dword [EBP-288]
        jmp     @12359
@12361: 
        mov     EAX,  @@TEXT+5324
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-280]
        cmp     EAX,  EBX
        jne     @12364
@12362: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        jae     @12364
@12363: 
        mov     EAX,  @@TEXT+724
        push    EAX
        call    @10050    ; Stop
@12364: 
@12365: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-280]
        cmp     EAX,  EBX
        jne     @12368
@12366: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        jae     @12368
@12367: 
        mov     EAX,  @@TEXT+761
        push    EAX
        call    @10050    ; Stop
@12368: 
@12369: 
        mov     EAX,  dword [EBP-280]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  2
        jne     @12372
@12370: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        jae     @12372
@12371: 
        mov     EAX,  @@TEXT+744
        push    EAX
        call    @10050    ; Stop
@12372: 
@12373: 
        mov     EAX,  dword [EBP-284]
        mov     dword [EBP-292], EAX
@12374: 
        mov     EAX,  dword [@@DATA+126980]
        mov     EBX,  dword [EBP-292]
        cmp     EAX,  EBX
        jbe     @12379
@12375: 
        lea     EAX,  [EBP-268]
        push    EAX
        mov     EAX,  dword [EBP-292]
        imul    EAX,  52
        add     EAX,  @@DATA+73732
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12377
@12376: 
        mov     EAX,  @@TEXT+291
        push    EAX
        call    @10050    ; Stop
@12377: 
@12378: 
        inc     dword [EBP-292]
        jmp     @12374
@12379: 
        mov     EAX,  dword [@@DATA+126980]
        cmp     EAX,  1024
        jb      @12381
@12380: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12381: 
@12382: 
        mov     EAX,  dword [EBP-280]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73764], EAX
        mov     EAX,  0
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        mov     EAX,  dword [@@DATA+126980]
        imul    EAX,  52
        add     EAX,  @@DATA+73732
        push    EAX
        call    @10073    ; Copy
        mov     EAX,  dword [EBP-288]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73768], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73772], EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10906    ; Tabl
        mov     EBX,  dword [@@DATA+126980]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73776], EAX
        inc     dword [@@DATA+126980]
        mov     EAX,  @@TEXT+5329
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12384
@12383: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        jmp     @12392
@12384: 
@12385: 
        mov     EAX,  @@TEXT+5331
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12387
@12386: 
        jmp     @12392
@12387: 
@12388: 
        mov     EAX,  @@TEXT+5335
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @12390
@12389: 
        mov     EAX,  @@TEXT+828
        push    EAX
        call    @10050    ; Stop
@12390: 
@12391: 
        jmp     @12357
@12392: 
        mov     EAX,  @@TEXT+5337
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12394
@12393: 
        jmp     @12396
@12394: 
@12395: 
        jmp     @12344
@12396: 
        mov     EAX,  dword [@@DATA+126980]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+52], EAX
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        inc     dword [@@DATA+73728]
        jmp     @12510
@12397: 
        mov     EAX,  @@TEXT+5341
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12408
@12398: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        cmp     EAX,  EBX
        jae     @12400
@12399: 
        mov     EAX,  @@TEXT+291
        push    EAX
        call    @10050    ; Stop
@12400: 
@12401: 
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @12403
@12402: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12403: 
@12404: 
        mov     EAX,  1
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  dword [@@DATA+73728]
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10073    ; Copy
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10084    ; Find
        mov     dword [EBP-280], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-280]
        cmp     EAX,  EBX
        ja      @12406
@12405: 
        mov     EAX,  @@TEXT+264
        push    EAX
        call    @10050    ; Stop
@12406: 
@12407: 
        mov     EAX,  dword [EBP-280]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        inc     dword [@@DATA+73728]
        jmp     @12510
@12408: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10084    ; Find
        mov     dword [EBP-280], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-280]
        cmp     EAX,  EBX
        jbe     @12411
@12410: 
        mov     EAX,  dword [EBP-280]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  3
        je      @12412
@12411: 
        mov     EAX,  @@TEXT+696
        push    EAX
        call    @10050    ; Stop
@12412: 
@12413: 
        mov     EAX,  @@TEXT+5349
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12427
@12414: 
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12415: 
        mov     EAX,  @@TEXT+5358
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12417
@12416: 
        inc     dword [EBP-284]
        jmp     @12415
@12417: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        cmp     EAX,  EBX
        jae     @12419
@12418: 
        mov     EAX,  @@TEXT+291
        push    EAX
        call    @10050    ; Stop
@12419: 
@12420: 
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @12422
@12421: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12422: 
@12423: 
        mov     EAX,  3
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  dword [@@DATA+73728]
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10073    ; Copy
        mov     EAX,  2
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+36], EAX
        mov     EAX,  @@TEXT+5360
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @12425
@12424: 
        mov     EAX,  @@TEXT+304
        push    EAX
        call    @10050    ; Stop
@12425: 
@12426: 
        mov     EAX,  dword [EBP-280]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  dword [EBP-284]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+44], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+48], EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10219    ; List
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+52], EAX
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        inc     dword [@@DATA+73728]
        jmp     @12508
@12427: 
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12429: 
        mov     EAX,  0
        mov     dword [EBP-288], EAX
@12431: 
        mov     EAX,  @@TEXT+5362
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12433
@12432: 
        inc     dword [EBP-288]
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        jmp     @12431
@12433: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        cmp     EAX,  EBX
        jae     @12435
@12434: 
        mov     EAX,  @@TEXT+291
        push    EAX
        call    @10050    ; Stop
@12435: 
@12436: 
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @12438
@12437: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12438: 
@12439: 
        mov     EAX,  dword [EBP-280]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  dword [@@DATA+73728]
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10073    ; Copy
        mov     EAX,  dword [EBP-288]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+44], EAX
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  @@TEXT+5364
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12481
@12440: 
        mov     EAX,  dword [EBP-284]
        cmp     EAX,  0
        je      @12442
@12441: 
        mov     EAX,  @@TEXT+785
        push    EAX
        call    @10050    ; Stop
@12442: 
@12443: 
        mov     EAX,  dword [@@DATA+73728]
        mov     dword [@@DATA+4749824], EAX
        mov     EAX,  5
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  1
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+36], EAX
        mov     EAX,  dword [@@DATA+126980]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+48], EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10219    ; List
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+52], EAX
        inc     dword [@@DATA+73728]
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  @@TEXT+5366
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12445
@12444: 
        mov     EAX,  @@TEXT+915
        push    EAX
        call    @10050    ; Stop
        jmp     @12480
@12445: 
        mov     EAX,  @@TEXT+5368
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12470
@12446: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  1
        jne     @12448
@12447: 
        jmp     @12451
@12448: 
        mov     EAX,  @@TEXT+903
        push    EAX
        call    @10050    ; Stop
@12451: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10084    ; Find
        mov     dword [EBP-292], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-292]
        cmp     EAX,  EBX
        ja      @12456
@12452: 
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @12454
@12453: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12454: 
@12455: 
        mov     EAX,  5
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  dword [EBP-280]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  dword [EBP-288]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+44], EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+48], EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+52], EAX
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        mov     EAX,  6
        mov     EBX,  dword [@@DATA+4749824]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  dword [@@DATA+73728]
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10073    ; Copy
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+4749824]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        mov     EAX,  dword [@@DATA+4749824]
        mov     dword [EBP-292], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     dword [@@DATA+4749824], EAX
        inc     dword [@@DATA+73728]
@12456: 
@12457: 
        mov     EAX,  @@TEXT+5377
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12465
@12458: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [@@DATA+73728]
        cmp     EAX,  EBX
        jae     @12460
@12459: 
        mov     EAX,  @@TEXT+291
        push    EAX
        call    @10050    ; Stop
@12460: 
@12461: 
        mov     EAX,  dword [@@DATA+73728]
        cmp     EAX,  1024
        jb      @12463
@12462: 
        mov     EAX,  @@TEXT+134
        push    EAX
        call    @10050    ; Stop
@12463: 
@12464: 
        mov     EAX,  1
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  dword [@@DATA+4749824]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+40], EAX
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        inc     dword [@@DATA+73728]
        mov     EAX,  dword [@@DATA+73728]
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        call    @10073    ; Copy
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
@12465: 
@12466: 
        mov     EAX,  0
        mov     EBX,  dword [@@DATA+4749824]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+36], EAX
        mov     EAX,  dword [EBP-292]
        mov     EBX,  dword [@@DATA+4749824]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+56], EAX
        mov     EAX,  @@TEXT+5379
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @12468
@12467: 
        mov     EAX,  @@TEXT+828
        push    EAX
        call    @10050    ; Stop
@12468: 
@12469: 
        jmp     @12480
@12470: 
        mov     EAX,  @@TEXT+5381
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12473
@12472: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
@12473: 
@12474: 
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [@@DATA+4749828], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     dword [@@DATA+4749832], EAX
        mov     EAX,  0
        mov     dword [EBP-284], EAX
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        add     EAX,  @@DATA+56
        mov     dword [EBP-292], EAX
@12475: 
        mov     EAX,  dword [EBP-284]
        cmp     EAX,  0
        je      @12477
@12476: 
        mov     EAX,  @@TEXT+5384
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @12478
@12477: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10919    ; Ctrl
        mov     EBX,  dword [EBP-292]
        mov     dword [EBX+0], EAX
        mov     EAX,  dword [EBP-292]
        mov     EAX,  dword [EAX+0]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        mov     dword [EBP-292], EAX
        mov     EAX,  1
        mov     dword [EBP-284], EAX
        jmp     @12475
@12478: 
        mov     EAX,  dword [@@DATA+4749832]
        mov     dword [@@DATA+129032], EAX
        mov     EAX,  dword [@@DATA+4749828]
        mov     dword [@@DATA+126980], EAX
@12480: 
        jmp     @12506
        jmp     @12505
@12481: 
        mov     EAX,  @@TEXT+5388
        push    EAX
        call    @10084    ; Find
        mov     EBX,  dword [EBP-280]
        cmp     EAX,  EBX
        jne     @12485
@12483: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        jae     @12485
@12484: 
        mov     EAX,  @@TEXT+724
        push    EAX
        call    @10050    ; Stop
@12485: 
@12486: 
        mov     EAX,  dword [EBP-280]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  2
        jne     @12489
@12487: 
        mov     EAX,  dword [EBP-288]
        cmp     EAX,  1
        jae     @12489
@12488: 
        mov     EAX,  @@TEXT+744
        push    EAX
        call    @10050    ; Stop
@12489: 
@12490: 
        mov     EAX,  4
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+32], EAX
        mov     EAX,  dword [@@DATA+129032]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+48], EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10906    ; Tabl
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+52], EAX
        mov     EAX,  262144
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+56], EAX
        mov     EAX,  @@TEXT+5393
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @12492
@12491: 
        mov     EAX,  @@TEXT+5395
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12496
@12492: 
        mov     EAX,  dword [@@DATA+73728]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     EBX,  dword [@@DATA+EBX+52]
        cmp     EAX,  EBX
        jae     @12494
@12493: 
        mov     EAX,  @@TEXT+915
        push    EAX
        call    @10050    ; Stop
@12494: 
@12495: 
        call    @10262    ; Peek
        mov     dword [EBP-292], EAX
        call    @10262    ; Peek
        mov     dword [EBP-296], EAX
        mov     EAX,  50
        mov     EBX,  dword [EBP-292]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-296]
        mov     EBX,  dword [EBP-292]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        call    @10262    ; Peek
        mov     dword [EBP-308], EAX
        mov     EAX,  0
        mov     EBX,  dword [EBP-296]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [EBP-308]
        mov     EBX,  dword [EBP-296]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391192], EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        push    EAX
        lea     EAX,  [EBP-304]
        push    EAX
        lea     EAX,  [EBP-300]
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10367    ; Expr
        mov     EBX,  dword [EBP-296]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391196], EAX
        mov     EAX,  7
        mov     EBX,  dword [EBP-308]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-308]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391188], EAX
        mov     EAX,  dword [EBP-296]
        imul    EAX,  16
        add     EAX,  @@DATA+391196
        push    EAX
        mov     EAX,  dword [EBP-304]
        push    EAX
        mov     EAX,  dword [EBP-300]
        push    EAX
        mov     EAX,  dword [EBP-288]
        push    EAX
        mov     EAX,  dword [EBP-280]
        push    EAX
        call    @10271    ; Test
        mov     EAX,  dword [EBP-292]
        mov     EBX,  dword [@@DATA+73728]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+56], EAX
@12496: 
@12497: 
        inc     dword [@@DATA+73728]
        mov     EAX,  @@TEXT+5398
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        jne     @12499
@12498: 
        jmp     @12506
@12499: 
@12500: 
        mov     EAX,  @@TEXT+5400
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10029    ; strcmp
        cmp     EAX,  0
        je      @12502
@12501: 
        mov     EAX,  @@TEXT+828
        push    EAX
        call    @10050    ; Stop
@12502: 
@12503: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
@12505: 
        mov     EAX,  1
        mov     dword [EBP-284], EAX
        jmp     @12429
@12506: 
@12508: 
@12510: 
        mov     EAX,  dword [EBP-272]
        mov     EBX,  dword [@@DATA+4749812]
        cmp     EAX,  EBX
        je      @12512
@12511: 
        mov     EAX,  @@TEXT+95
        push    EAX
        call    @10050    ; Stop
@12512: 
@12513: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10146    ; Scan
        mov     EAX,  dword [@@DATA+4749812]
        mov     dword [EBP-272], EAX
        jmp     @12232
@12514: 
        mov     EAX,  dword [@@DATA+4749800]
        push    EAX
        call    @10005    ; close
@12515: 
        mov     EAX,  dword [@@DATA+4716984]
        cmp     EAX,  0
        jbe     @12517
@12516: 
        dec     dword [@@DATA+4716984]
        mov     EAX,  dword [@@DATA+4716984]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+4716600]
        push    EAX
        call    @10005    ; close
        jmp     @12515
@12517: 
        mov     EAX,  dword [@@DATA+4749824]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        push    EAX
        call    @11296    ; Mark
        mov     EAX,  1
        push    EAX
        mov     EAX,  @@TEXT+5402
        push    EAX
        call    @10084    ; Find
        imul    EAX,  72
        pop     EBX
        mov     dword [@@DATA+EAX+68], EBX
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  1
        jne     @12519
@12518: 
        mov     EAX,  1
        push    EAX
        mov     EAX,  @@TEXT+5411
        push    EAX
        call    @10084    ; Find
        imul    EAX,  72
        pop     EBX
        mov     dword [@@DATA+EAX+68], EBX
@12519: 
@12520: 
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10002    ; create
        mov     dword [@@DATA+4749800], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749760], EAX
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  1
        jne     @12523
@12521: 
        mov     EAX,  dword [@@DATA+4749848]
        cmp     EAX,  1
        jne     @12523
@12522: 
        mov     EAX,  @@TEXT+5423
        push    EAX
        call    @11272    ; Decl
        jmp     @12535
@12523: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  1
        jne     @12526
@12524: 
        mov     EAX,  dword [@@DATA+4749848]
        cmp     EAX,  2
        jne     @12526
@12525: 
        mov     EAX,  @@TEXT+5447
        push    EAX
        call    @11272    ; Decl
        jmp     @12535
@12526: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  2
        jne     @12528
@12527: 
        mov     EAX,  @@TEXT+5467
        push    EAX
        call    @11272    ; Decl
        jmp     @12535
@12528: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  3
        jne     @12530
@12529: 
        jmp     @12535
@12530: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  4
        jne     @12532
@12531: 
        jmp     @12535
@12532: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@12535: 
        mov     EAX,  0
        mov     dword [EBP-280], EAX
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12536: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jbe     @12543
@12537: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  2
        jne     @12541
@12538: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        cmp     EAX,  0
        jbe     @12541
@12539: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12541
@12540: 
        mov     EAX,  dword [EBP-280]
        mov     EBX,  dword [EBP-284]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-284]
        imul    EBX,  72
        mov     EBX,  dword [@@DATA+EBX+48]
        sub     EAX,  EBX
        mov     EBX,  dword [EBP-280]
        add     EAX,  EBX
        mov     dword [EBP-280], EAX
@12541: 
@12542: 
        inc     dword [EBP-284]
        jmp     @12536
@12543: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  3
        je      @12546
@12544: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  4
        je      @12546
@12545: 
        mov     EAX,  @@TEXT+5495
        push    EAX
        call    @11272    ; Decl
@12546: 
@12547: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  1
        je      @12548
        cmp     EAX,  2
        je      @12549
        cmp     EAX,  3
        je      @12550
        cmp     EAX,  4
        je      @12551
        jmp     @12552
@12548: 
        mov     EAX,  @@TEXT+5496
        push    EAX
        call    @11272    ; Decl
        jmp     @12553
@12549: 
        mov     EAX,  @@TEXT+5537
        push    EAX
        call    @11272    ; Decl
        jmp     @12553
@12550: 
        jmp     @12553
@12551: 
        jmp     @12553
@12552: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @12553
@12553: 
        mov     EAX,  10000
        mov     dword [EBP-288], EAX
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12554: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jbe     @12573
@12555: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  3
        jne     @12567
@12556: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  1
        jne     @12567
@12557: 
        mov     EAX,  0
        mov     dword [EBP-292], EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-296], EAX
@12558: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-296]
        cmp     EAX,  EBX
        jbe     @12566
@12559: 
        mov     EAX,  dword [EBP-292]
        mov     EBX,  dword [EBP-296]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73780], EAX
        mov     EAX,  4
        mov     dword [EBP-300], EAX
        mov     EAX,  dword [EBP-296]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        cmp     EAX,  0
        jne     @12561
@12560: 
        mov     EAX,  dword [EBP-296]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-300], EAX
@12561: 
@12562: 
        mov     EAX,  dword [EBP-296]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73772]
        mov     dword [EBP-304], EAX
@12563: 
        mov     EAX,  dword [EBP-296]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73776]
        mov     EBX,  dword [EBP-304]
        cmp     EAX,  EBX
        jbe     @12565
@12564: 
        mov     EAX,  dword [EBP-304]
        shl     EAX,  2
        mov     EAX,  dword [@@DATA+EAX+126984]
        mov     EBX,  dword [EBP-300]
        mul     EBX
        mov     dword [EBP-300], EAX
        inc     dword [EBP-304]
        jmp     @12563
@12565: 
        mov     EAX,  dword [EBP-300]
        mov     EBX,  dword [EBP-292]
        add     EAX,  EBX
        mov     dword [EBP-292], EAX
        inc     dword [EBP-296]
        jmp     @12558
@12566: 
        mov     EAX,  dword [EBP-292]
        mov     EBX,  dword [EBP-284]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        jmp     @12572
@12567: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  5
        jne     @12571
@12568: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  0
        je      @12571
@12569: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12571
@12570: 
        mov     EAX,  dword [EBP-288]
        mov     EBX,  dword [EBP-284]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        inc     dword [EBP-288]
        lea     EAX,  [EBP-288]
        push    EAX
        mov     EAX,  1
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        push    EAX
        call    @11328    ; Enum
        mov     EBX,  dword [EBP-284]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+64], EAX
@12571: 
@12572: 
        inc     dword [EBP-284]
        jmp     @12554
@12573: 
        mov     EAX,  0
        mov     dword [EBP-292], EAX
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12574: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jbe     @12591
@12575: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  6
        jne     @12589
@12576: 
        mov     EAX,  0
        mov     dword [EBP-296], EAX
@12577: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-296]
        cmp     EAX,  EBX
        jbe     @12588
@12578: 
        mov     EAX,  dword [EBP-296]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  5
        jne     @12586
@12579: 
        mov     EAX,  dword [EBP-296]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  0
        jne     @12586
@12580: 
        mov     EAX,  dword [EBP-296]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jne     @12586
@12581: 
        mov     EAX,  dword [EBP-296]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12586
@12582: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        jne     @12584
@12583: 
        mov     EAX,  dword [EBP-288]
        mov     EBX,  dword [EBP-284]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        mov     EAX,  1
        mov     EBX,  dword [EBP-284]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+68], EAX
        inc     dword [EBP-292]
@12584: 
@12585: 
        mov     EAX,  dword [EBP-288]
        mov     EBX,  dword [EBP-296]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        inc     dword [EBP-288]
@12586: 
@12587: 
        inc     dword [EBP-296]
        jmp     @12577
@12588: 
@12589: 
@12590: 
        inc     dword [EBP-284]
        jmp     @12574
@12591: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  3
        jne     @12593
@12592: 
        mov     EAX,  @@TEXT+5565
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-276]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+5571
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        jmp     @12596
@12593: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  4
        jne     @12595
@12594: 
        mov     EAX,  @@TEXT+5581
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5587
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5593
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5594
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5650
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5701
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5745
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5785
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5826
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5869
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5920
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5959
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+5960
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6023
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-276]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+6030
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12595: 
@12596: 
        mov     EAX,  0
        mov     dword [EBP-296], EAX
        call    @10262    ; Peek
        mov     dword [EBP-304], EAX
        mov     EAX,  53
        mov     EBX,  dword [EBP-304]
        imul    EBX,  16
        mov     dword [@@DATA+EBX+391184], EAX
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12597: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jbe     @12646
@12598: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  4
        jne     @12607
@12599: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12607
@12600: 
        mov     EAX,  dword [EBP-296]
        mov     EBX,  dword [EBP-284]
        imul    EBX,  72
        mov     dword [@@DATA+EBX+60], EAX
        mov     EAX,  4
        mov     dword [EBP-308], EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        cmp     EAX,  0
        jne     @12602
@12601: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+40]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-308], EAX
@12602: 
@12603: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-312], EAX
@12604: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-312]
        cmp     EAX,  EBX
        jbe     @12606
@12605: 
        mov     EAX,  dword [EBP-312]
        shl     EAX,  2
        mov     EAX,  dword [@@DATA+EAX+126984]
        mov     EBX,  dword [EBP-308]
        mul     EBX
        mov     dword [EBP-308], EAX
        inc     dword [EBP-312]
        jmp     @12604
@12606: 
        mov     EAX,  dword [EBP-308]
        push    EAX
        call    @11292    ; Even
        mov     EBX,  dword [EBP-296]
        add     EAX,  EBX
        mov     dword [EBP-296], EAX
        jmp     @12645
@12607: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  5
        jne     @12644
@12608: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  0
        je      @12644
@12609: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12644
@12610: 
        mov     EAX,  @@TEXT+6040
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  2
        je      @12612
@12611: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        mov     EAX,  @@TEXT+6041
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @11280    ; Emit
        jmp     @12615
@12612: 
        mov     EAX,  @@TEXT+6050
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        mov     dword [EBP-300], EAX
@12615: 
        mov     EAX,  0
        mov     dword [EBP-308], EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-312], EAX
@12616: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-312]
        cmp     EAX,  EBX
        jbe     @12623
@12617: 
        mov     EAX,  dword [EBP-308]
        add     EAX,  8
        mov     EBX,  dword [EBP-312]
        imul    EBX,  52
        mov     dword [@@DATA+EBX+73780], EAX
        mov     EAX,  dword [EBP-312]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73768]
        cmp     EAX,  0
        jne     @12619
@12618: 
        mov     EAX,  dword [EBP-312]
        imul    EAX,  52
        mov     EAX,  dword [@@DATA+EAX+73764]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @11292    ; Even
        mov     EBX,  dword [EBP-308]
        add     EAX,  EBX
        mov     dword [EBP-308], EAX
        jmp     @12622
@12619: 
        mov     EAX,  dword [EBP-308]
        add     EAX,  4
        mov     dword [EBP-308], EAX
@12622: 
        inc     dword [EBP-312]
        jmp     @12616
@12623: 
        mov     EAX,  @@TEXT+6064
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6076
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+64]
        cmp     EAX,  0
        jbe     @12625
@12624: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+64]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+6094
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12625: 
@12626: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  2
        jne     @12636
@12627: 
        mov     EAX,  0
        mov     dword [EBP-316], EAX
@12628: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-316]
        cmp     EAX,  EBX
        jbe     @12635
@12629: 
        mov     EAX,  dword [EBP-316]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  4
        jne     @12633
@12630: 
        mov     EAX,  dword [EBP-316]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        cmp     EAX,  262144
        jae     @12633
@12631: 
        mov     EAX,  dword [EBP-316]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12633
@12632: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-316]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        push    EAX
        call    @11381    ; Code
@12633: 
@12634: 
        inc     dword [EBP-316]
        jmp     @12628
@12635: 
@12636: 
@12637: 
        mov     EAX,  dword [@@DATA+126980]
        mov     dword [@@DATA+4749828], EAX
        mov     EAX,  dword [EBP-284]
        mov     dword [@@DATA+4749824], EAX
        mov     EAX,  dword [EBP-308]
        mov     dword [@@DATA+4749852], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749856], EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        mov     dword [EBP-316], EAX
@12638: 
        mov     EAX,  dword [EBP-316]
        cmp     EAX,  262144
        jae     @12640
@12639: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-316]
        push    EAX
        call    @11381    ; Code
        mov     EAX,  dword [EBP-316]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391184]
        mov     dword [EBP-320], EAX
        mov     EAX,  dword [EBP-316]
        imul    EAX,  16
        mov     EAX,  dword [@@DATA+EAX+391196]
        mov     dword [EBP-316], EAX
        jmp     @12638
@12640: 
        mov     EAX,  dword [EBP-320]
        cmp     EAX,  53
        je      @12642
@12641: 
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-304]
        push    EAX
        call    @11381    ; Code
@12642: 
@12643: 
        mov     EAX,  dword [@@DATA+4749828]
        mov     dword [@@DATA+126980], EAX
@12644: 
@12645: 
        inc     dword [EBP-284]
        jmp     @12597
@12646: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  1
        je      @12647
        cmp     EAX,  2
        je      @12648
        cmp     EAX,  3
        je      @12649
        cmp     EAX,  4
        je      @12650
        jmp     @12651
@12647: 
        mov     EAX,  @@TEXT+6109
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  @@TEXT+6110
        push    EAX
        call    @11272    ; Decl
        jmp     @12652
@12648: 
        mov     EAX,  @@TEXT+6150
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  @@TEXT+6151
        push    EAX
        call    @11272    ; Decl
        jmp     @12652
@12649: 
        jmp     @12652
@12650: 
        jmp     @12652
@12651: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
        jmp     @12652
@12652: 
        mov     EAX,  @@TEXT+6178
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12653: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jbe     @12689
@12654: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  2
        jne     @12687
@12655: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+44]
        cmp     EAX,  0
        jbe     @12687
@12656: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12687
@12657: 
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10025    ; strlen
        mov     dword [EBP-308], EAX
        mov     EAX,  0
        mov     dword [EBP-312], EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     dword [EBP-316], EAX
@12658: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+52]
        mov     EBX,  dword [EBP-316]
        cmp     EAX,  EBX
        jbe     @12686
@12659: 
        mov     EAX,  dword [EBP-308]
        add     EAX,  6
        cmp     EAX,  256
        jb      @12661
@12660: 
        mov     EAX,  @@TEXT+930
        push    EAX
        call    @10050    ; Stop
@12661: 
@12662: 
        mov     EAX,  dword [EBP-316]
        mov     AL,   byte  [@@DATA+EAX+129036]
        cmp     AL,   32
        jb      @12664
@12663: 
        mov     EAX,  dword [EBP-316]
        mov     AL,   byte  [@@DATA+EAX+129036]
        cmp     AL,   34
        jne     @12676
@12664: 
        mov     EAX,  dword [EBP-312]
        cmp     EAX,  0
        je      @12666
@12665: 
        mov     AL,   34
        mov     EBX,  dword [EBP-308]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-308]
        mov     EAX,  0
        mov     dword [EBP-312], EAX
@12666: 
@12667: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     EBX,  dword [EBP-316]
        cmp     EAX,  EBX
        jae     @12669
@12668: 
        mov     AL,   44
        mov     EBX,  dword [EBP-308]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-308]
        jmp     @12672
@12669: 
        mov     AL,   32
        mov     EBX,  dword [EBP-308]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-308]
@12672: 
        mov     AL,   32
        mov     EBX,  dword [EBP-308]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-308]
        mov     EAX,  dword [EBP-316]
        mov     AL,   byte  [@@DATA+EAX+129036]
        and     EAX,  0FFH
        push    EAX
        call    @10049    ; str
        mov     dword [EBP-320], EAX
        mov     EAX,  0
        mov     dword [EBP-324], EAX
@12673: 
        mov     EAX,  dword [EBP-324]
        add     EAX,  dword [EBP-320]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        je      @12675
@12674: 
        mov     EAX,  dword [EBP-324]
        add     EAX,  dword [EBP-320]
        mov     AL,   byte  [EAX+0]
        mov     EBX,  dword [EBP-308]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-308]
        inc     dword [EBP-324]
        jmp     @12673
@12675: 
        jmp     @12685
@12676: 
        mov     EAX,  dword [EBP-312]
        cmp     EAX,  0
        jne     @12682
@12678: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+48]
        mov     EBX,  dword [EBP-316]
        cmp     EAX,  EBX
        jae     @12680
@12679: 
        mov     AL,   44
        mov     EBX,  dword [EBP-308]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-308]
@12680: 
@12681: 
        mov     AL,   32
        mov     EBX,  dword [EBP-308]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-308]
        mov     AL,   34
        mov     EBX,  dword [EBP-308]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-308]
        mov     EAX,  1
        mov     dword [EBP-312], EAX
@12682: 
@12683: 
        mov     EAX,  dword [EBP-316]
        mov     AL,   byte  [@@DATA+EAX+129036]
        mov     EBX,  dword [EBP-308]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-308]
@12685: 
        inc     dword [EBP-316]
        jmp     @12658
@12686: 
        mov     AL,   0
        mov     EBX,  dword [EBP-308]
        mov     byte  [EBP+EBX-268], AL
        lea     EAX,  [EBP-268]
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  @@TEXT+6195
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
@12687: 
@12688: 
        inc     dword [EBP-284]
        jmp     @12653
@12689: 
        mov     EAX,  dword [EBP-296]
        cmp     EAX,  0
        jbe     @12691
@12690: 
        mov     EAX,  @@TEXT+6210
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  dword [EBP-296]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+6211
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @11272    ; Decl
@12691: 
@12692: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  1
        jne     @12740
@12693: 
        mov     EAX,  @@TEXT+6228
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  @@TEXT+6229
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  @@TEXT+6277
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  dword [EBP-288]
        mov     dword [EBP-308], EAX
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12694: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jbe     @12700
@12695: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  6
        jne     @12698
@12696: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12698
@12697: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @10049    ; str
        push    EAX
        lea     EAX,  [EBP-820]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        mov     EAX,  @@TEXT+6301
        push    EAX
        mov     EAX,  dword [EBP-308]
        push    EAX
        call    @10049    ; str
        push    EAX
        lea     EAX,  [EBP-564]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        mov     EAX,  @@TEXT+6278
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        inc     dword [EBP-308]
@12698: 
@12699: 
        inc     dword [EBP-284]
        jmp     @12694
@12700: 
        mov     EAX,  @@TEXT+6309
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12701: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jbe     @12716
@12702: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  6
        jne     @12714
@12703: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12714
@12704: 
        mov     EAX,  @@TEXT+6331
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  0
        mov     dword [EBP-312], EAX
@12705: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-312]
        cmp     EAX,  EBX
        jbe     @12713
@12706: 
        mov     EAX,  dword [EBP-312]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  5
        jne     @12711
@12707: 
        mov     EAX,  dword [EBP-312]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  0
        jne     @12711
@12708: 
        mov     EAX,  dword [EBP-312]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jne     @12711
@12709: 
        mov     EAX,  dword [EBP-312]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12711
@12710: 
        mov     EAX,  dword [EBP-308]
        push    EAX
        call    @10049    ; str
        push    EAX
        lea     EAX,  [EBP-824]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        mov     EAX,  @@TEXT+6334
        push    EAX
        mov     EAX,  dword [EBP-312]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+60]
        push    EAX
        call    @10049    ; str
        push    EAX
        lea     EAX,  [EBP-568]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        mov     EAX,  @@TEXT+6332
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @11272    ; Decl
        inc     dword [EBP-308]
@12711: 
@12712: 
        inc     dword [EBP-312]
        jmp     @12705
@12713: 
        mov     EAX,  @@TEXT+6350
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12714: 
@12715: 
        inc     dword [EBP-284]
        jmp     @12701
@12716: 
        mov     EAX,  @@TEXT+6360
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  dword [EBP-288]
        mov     dword [EBP-308], EAX
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12717: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jbe     @12723
@12718: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  6
        jne     @12721
@12719: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12721
@12720: 
        mov     EAX,  @@TEXT+6370
        push    EAX
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        mov     EAX,  @@TEXT+6361
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  dword [EBP-308]
        push    EAX
        call    @11280    ; Emit
        inc     dword [EBP-308]
@12721: 
@12722: 
        inc     dword [EBP-284]
        jmp     @12717
@12723: 
        mov     EAX,  0
        mov     dword [EBP-284], EAX
@12724: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jbe     @12739
@12725: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  6
        jne     @12737
@12726: 
        mov     EAX,  dword [EBP-284]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12737
@12727: 
        mov     EAX,  @@TEXT+6379
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  0
        mov     dword [EBP-312], EAX
@12728: 
        mov     EAX,  dword [@@DATA+73728]
        mov     EBX,  dword [EBP-312]
        cmp     EAX,  EBX
        jbe     @12736
@12729: 
        mov     EAX,  dword [EBP-312]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+32]
        cmp     EAX,  5
        jne     @12734
@12730: 
        mov     EAX,  dword [EBP-312]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+36]
        cmp     EAX,  0
        jne     @12734
@12731: 
        mov     EAX,  dword [EBP-312]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+56]
        mov     EBX,  dword [EBP-284]
        cmp     EAX,  EBX
        jne     @12734
@12732: 
        mov     EAX,  dword [EBP-312]
        imul    EAX,  72
        mov     EAX,  dword [@@DATA+EAX+68]
        cmp     EAX,  0
        je      @12734
@12733: 
        mov     EAX,  @@TEXT+6380
        push    EAX
        mov     EAX,  dword [EBP-308]
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6399
        push    EAX
        mov     EAX,  dword [EBP-312]
        imul    EAX,  72
        add     EAX,  @@DATA+0
        push    EAX
        mov     EAX,  @@TEXT+6390
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        inc     dword [EBP-308]
@12734: 
@12735: 
        inc     dword [EBP-312]
        jmp     @12728
@12736: 
@12737: 
@12738: 
        inc     dword [EBP-284]
        jmp     @12724
@12739: 
        mov     EAX,  @@TEXT+6404
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  @@TEXT+6405
        push    EAX
        call    @11272    ; Decl
        jmp     @12743
@12740: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  4
        jne     @12742
@12741: 
        mov     EAX,  @@TEXT+6455
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6456
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6504
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6547
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6556
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6623
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6693
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6764
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6814
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6882
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+6950
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+7017
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+7088
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+7158
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
        mov     EAX,  @@TEXT+7222
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12742: 
@12743: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  3
        je      @12746
@12744: 
        mov     EAX,  dword [@@DATA+4749844]
        cmp     EAX,  4
        je      @12746
@12745: 
        mov     EAX,  @@TEXT+7262
        push    EAX
        call    @11272    ; Decl
        mov     EAX,  dword [EBP-300]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+7263
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @11280    ; Emit
@12746: 
@12747: 
        mov     EAX,  dword [@@DATA+4749760]
        cmp     EAX,  0
        jbe     @12752
@12748: 
        mov     EAX,  dword [@@DATA+4749760]
        push    EAX
        mov     EAX,  @@DATA+4716992
        push    EAX
        mov     EAX,  dword [@@DATA+4749800]
        push    EAX
        call    @10004    ; write
        mov     EBX,  dword [@@DATA+4749760]
        cmp     EAX,  EBX
        je      @12750
@12749: 
        mov     EAX,  @@TEXT+948
        push    EAX
        call    @10050    ; Stop
@12750: 
@12751: 
@12752: 
@12753: 
        mov     EAX,  dword [@@DATA+4749800]
        push    EAX
        call    @10005    ; close
        mov     EAX,  @@TEXT+7277
        push    EAX
        mov     EAX,  dword [@@DATA+4749804]
        push    EAX
        call    @10049    ; str
        push    EAX
        mov     EAX,  @@TEXT+7275
        push    EAX
        mov     EAX,  @@DATA+4749768
        push    EAX
        mov     EAX,  @@TEXT+7273
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @10036    ; strcpy
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10040    ; strcat
        push    EAX
        call    @10006    ; puts
        mov     ESP,  EBP
        pop     EBP
        ret     8

@12754:        ;begin
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  272
        db      0x8B
        db      0x45
        db      0x4
        db      0x89
        db      0x45
        db      0xFC
        mov     EAX,  @@TEXT+7281
        mov     dword [EBP-8], EAX
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  2
        jb      @12756
@12755: 
        db      0x8B
        db      0x45
        db      0xC
        db      0x89
        db      0x45
        db      0xF8
@12756: 
@12757: 
        mov     EAX,  @@TEXT+7282
        mov     dword [EBP-12], EAX
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  3
        jb      @12759
@12758: 
        db      0x8B
        db      0x45
        db      0x10
        db      0x89
        db      0x45
        db      0xF4
@12759: 
@12760: 
        mov     EAX,  0
        mov     dword [EBP-272], EAX
@12761: 
        mov     EAX,  dword [EBP-272]
        add     EAX,  dword [EBP-8]
        mov     AL,   byte  [EAX+0]
        cmp     AL,   0
        je      @12766
@12762: 
        mov     EAX,  dword [EBP-272]
        add     EAX,  dword [EBP-8]
        mov     AL,   byte  [EAX+0]
        mov     EBX,  dword [EBP-272]
        mov     byte  [EBP+EBX-268], AL
        inc     dword [EBP-272]
        mov     EAX,  dword [EBP-272]
        cmp     EAX,  256
        jb      @12764
@12763: 
        mov     EAX,  @@TEXT+45
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+7283
        push    EAX
        call    @10006    ; puts
        mov     ESP,  EBP
        pop     EBP
@12764: 
@12765: 
        jmp     @12761
@12766: 
        mov     AL,   0
        mov     EBX,  dword [EBP-272]
        mov     byte  [EBP+EBX-268], AL
        mov     EAX,  dword [EBP-272]
        cmp     EAX,  0
        jne     @12768
@12767: 
        mov     EAX,  @@TEXT+7286
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+7325
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+7364
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+7403
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+7441
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+7475
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+7505
        push    EAX
        call    @10006    ; puts
        mov     EAX,  @@TEXT+7536
        push    EAX
        call    @10006    ; puts
        mov     ESP,  EBP
        pop     EBP
@12768: 
@12769: 
        mov     EAX,  2
        mov     dword [@@DATA+4749844], EAX
        mov     EAX,  0
        mov     dword [@@DATA+4749848], EAX
        mov     EAX,  dword [EBP-12]
        push    EAX
        lea     EAX,  [EBP-268]
        push    EAX
        call    @12189    ; Main
        mov     ESP,  EBP
        pop     EBP

@@TEXT  db     "Context 2.0 for Kolibri", 0
        db     "ЌҐЁ§ўҐбв­л© Ї p ¬Ґвp", 0
        db     "‘«ЁиЄ®¬ ¤«Ё­­®Ґ Ё¬п д ©« ", 0
        db     "ЌҐў®§¬®¦­® ®вЄpлвм д ©«", 0
        db     "ЌҐЄ®ppҐЄв­ п ўбв ўЄ  д ©« ", 0
        db     "Љ®­Ґж д ©« ", 0
        db     "ЌҐ¤®бв в®з­® Ї ¬пвЁ", 0
        db     "ЌҐ¤®ЇгбвЁ¬л© бЁ¬ў®« ў Є®­бв ­вҐ", 0
        db     "Љ®­бв ­в  б«ЁиЄ®¬ ўҐ«ЁЄ ", 0
        db     "‘«ЁиЄ®¬ ¤«Ё­­л© Ё¤Ґ­вЁдЁЄ в®p", 0
        db     "Џp®ЇгйҐ­ Ё¤Ґ­вЁдЁЄ в®p", 0
        db     "€¤Ґ­вЁдЁЄ в®p ­Ґ ®ЇpҐ¤Ґ«Ґ­", 0
        db     "Џ®ўв®p Ё¬Ґ­Ё", 0
        db     "Џp®ЇгйҐ­  бЄ®ЎЄ ", 0
        db     "Џp®ЇгйҐ­® case", 0
        db     "Џp®ЇгйҐ­® then Ё«Ё ¤ў®Ґв®зЁҐ", 0
        db     "Џp®ЇгйҐ­® ¤ў®Ґв®зЁҐ", 0
        db     "Џp®pгйҐ­® of", 0
        db     "Џp®ЇгйҐ­® do", 0
        db     "loop/exit ў­Ґ жЁЄ« ", 0
        db     "Џp®ЇгйҐ­  бвpгЄвгp­ п ЇҐpҐ¬Ґ­­ п", 0
        db     "Џp®ЇгйҐ­  Є ўлзЄ ", 0
        db     "‘Ё¬ў®« @ ­Ґ¤®ЇгбвЁ¬", 0
        db     "ЌҐў®§¬®¦­® ўлзЁб«Ёвм  ¤pҐб", 0
        db     "„ў  ®ЇҐp в®p  Ї®¤pп¤", 0
        db     "ЌҐб®®вўҐвбвўЁҐ вЁЇ®ў", 0
        db     "’pҐЎгҐвбп pҐ§г«мв в жҐ«®Ј®/бЁ¬ў®«м­®Ј® вЁЇ ", 0
        db     "’pҐЎгҐвбп жҐ« п/бЁ¬ў®«м­ п Є®­бв ­в ", 0
        db     "Џ®ўв®p ў pЁ ­в ", 0
        db     "’pҐЎгҐвбп ббл«Є  ­  дг­ЄжЁо", 0
        db     "Џp®ЇгйҐ­ Ё¤Ґ­вЁдЁЄ в®p вЁЇ ", 0
        db     "’ЁЇ void ­Ґ¤®ЇгбвЁ¬", 0
        db     "’pҐЎгҐвбп ббл«Є ", 0
        db     "‘вpгЄвгp  ­Ґ ®ЇpҐ¤Ґ«Ґ­ ", 0
        db     "ЋЎкпў«Ґ­ЁҐ дг­ЄжЁЁ ­Ґ¤®ЇгбвЁ¬®", 0
        db     "Џp®ЇгйҐ­® =", 0
        db     "Џp®ЇгйҐ­  в®зЄ  б § Їпв®©", 0
        db     "Џp®ЇгйҐ­  § Їпв п", 0
        db     "ЋиЁЎЄ  ў Є®­бв ­в­®¬ ўлp ¦Ґ­ЁЁ", 0
        db     "ЌҐ¤®ЇгбвЁ¬®", 0
        db     "ЌҐ pҐ «Ё§®ў ­®", 0
        db     "‚­гвpҐ­­пп ®иЁЎЄ ", 0
        db     "ЋиЁЎЄ  § ЇЁбЁ", 0
        db     "10987654321098765432109876543210", 0
        db     "0123456789ABCDEF", 0
        db      13, 0
        db     "(", 0
        db     ",", 0
        db     "): ", 0
        db      13, 10, 0
        db     "0123456789ABCDEF", 0
        db      13, 0
        db     "(", 0
        db     ")", 13, 10, 0
        db     "char", 0
        db      13, 0
        db     "(", 0
        db     ")", 0
        db     "/", 0
        db     "!=", 0
        db     "<=", 0
        db     ">=", 0
        db     ":=", 0
        db     ")", 0
        db     "@", 0
        db     "void", 0
        db     ",", 0
        db     ")", 0
        db     ";", 0
        db     ")", 0
        db     "int", 0
        db     "word", 0
        db     "byte", 0
        db     "word", 0
        db     "byte", 0
        db     "int", 0
        db     "word", 0
        db     "byte", 0
        db     "word", 0
        db     "int", 0
        db     "int", 0
        db     "byte", 0
        db     "int", 0
        db     "word", 0
        db     "void", 0
        db     "void", 0
        db     "(", 0
        db     ")", 0
        db     "!", 0
        db     "byte", 0
        db     "word", 0
        db     "-", 0
        db     "int", 0
        db     "word", 0
        db     "word", 0
        db     "int", 0
        db     "int", 0
        db     "#", 0
        db     "char", 0
        db     "'", 0
        db     "char", 0
        db     "NULL", 0
        db     "void", 0
        db     "word", 0
        db     "@", 0
        db      34, 0
        db      0
        db     "char", 0
        db     "word", 0
        db     "int", 0
        db     "(", 0
        db     ",", 0
        db     ")", 0
        db     "(", 0
        db     ")", 0
        db     "void", 0
        db     "word", 0
        db     "char", 0
        db     "byte", 0
        db     "char", 0
        db     "word", 0
        db     "char", 0
        db     "int", 0
        db     "byte", 0
        db     "char", 0
        db     "word", 0
        db     "char", 0
        db     "int", 0
        db     "char", 0
        db     "[", 0
        db     ".", 0
        db     "]", 0
        db     "word", 0
        db     "[", 0
        db     "]", 0
        db     "word", 0
        db     "(", 0
        db     ",", 0
        db     ")", 0
        db     ".", 0
        db     "=", 0
        db     ":=", 0
        db     "=", 0
        db     ":=", 0
        db     "|", 0
        db     "^", 0
        db     "&", 0
        db     "<", 0
        db     "<=", 0
        db     "=", 0
        db     "!=", 0
        db     ">=", 0
        db     ">", 0
        db     "+", 0
        db     "-", 0
        db     "*", 0
        db     "/", 0
        db     "%", 0
        db     "byte", 0
        db     "word", 0
        db     "byte", 0
        db     "int", 0
        db     "word", 0
        db     "byte", 0
        db     "word", 0
        db     "int", 0
        db     "int", 0
        db     "byte", 0
        db     "int", 0
        db     "word", 0
        db     "byte", 0
        db     "word", 0
        db     "byte", 0
        db     "word", 0
        db     "byte", 0
        db     "word", 0
        db     "char", 0
        db     "byte", 0
        db     "word", 0
        db     "int", 0
        db     "byte", 0
        db     "word", 0
        db     "int", 0
        db     "byte", 0
        db     "word", 0
        db     "[", 0
        db     "]", 0
        db     "sequence", 0
        db     "end", 0
        db     "if", 0
        db     "select", 0
        db      0
        db     "then", 0
        db     "else", 0
        db     "select", 0
        db     "case", 0
        db     ":", 0
        db     "default", 0
        db     "case", 0
        db     "end", 0
        db     "default", 0
        db     ":", 0
        db      0
        db      0
        db     "end", 0
        db     "switch", 0
        db     "char", 0
        db     "byte", 0
        db     "word", 0
        db     "int", 0
        db     "of", 0
        db     "case", 0
        db     "case", 0
        db     ",", 0
        db     ",", 0
        db     "char", 0
        db     "byte", 0
        db     "word", 0
        db     "int", 0
        db     ":", 0
        db     "case", 0
        db     "default", 0
        db     "end", 0
        db     "default", 0
        db     ":", 0
        db     "end", 0
        db     "while", 0
        db     "do", 0
        db     "while", 0
        db     "do", 0
        db     "end", 0
        db     "repeat", 0
        db     "until", 0
        db     ";", 0
        db     "loop", 0
        db     "exit", 0
        db     "inc", 0
        db     "dec", 0
        db     "inc", 0
        db     ";", 0
        db     "byte", 0
        db     "word", 0
        db     "int", 0
        db     "inline", 0
        db     ",", 0
        db     "inline", 0
        db     ";", 0
        db     "asm2", 0
        db      13, 0
        db     "(", 0
        db     ")", 0
        db      13, 0
        db     "(", 0
        db     ")", 0
        db     "return", 0
        db     "void", 0
        db     ";", 0
        db     "asm", 0
        db     "end", 0
        db     "%", 0
        db     "char", 0
        db     "inlineAsm", 0
        db     "char", 0
        db     "inlineAsm", 0
        db     "null", 0
        db     "=", 0
        db     ":=", 0
        db     "@", 0
        db     "void", 0
        db     "=", 0
        db     ":=", 0
        db     ",", 0
        db     ";", 0
        db     "xor     EAX,  EAX", 0
        db     "xor     EBX,  EBX", 0
        db     "mov     AL,   ", 0
        db     "mov     BL,   ", 0
        db     "char", 0
        db     "mov     EAX,  ", 0
        db     "mov     EBX,  ", 0
        db     "word", 0
        db     "mov     EAX,  ", 0
        db     "mov     EBX,  ", 0
        db     "int", 0
        db     "mov     EAX,  @", 0
        db     "mov     EBX,  @", 0
        db     "inc     ", 0
        db     "dec     ", 0
        db     "byte  ", 0
        db     "dword ", 0
        db     "[@@DATA+EAX+", 0
        db     "]", 0
        db     "[EBP+EAX+", 0
        db     "]", 0
        db     "[EBP+EAX-", 0
        db     "]", 0
        db     "[EAX+", 0
        db     "]", 0
        db     "[@@DATA+", 0
        db     "]", 0
        db     "[EBP+", 0
        db     "]", 0
        db     "[EBP-", 0
        db     "]", 0
        db     "mov     byte  ", 0
        db     "mov     dword ", 0
        db     "lea     EDI,  ", 0
        db     "EAX", 0
        db     "EBX", 0
        db     "[@@DATA+", 0
        db     "+", 0
        db     "[EBP+", 0
        db     "+", 0
        db     "[EBP+", 0
        db     "-", 0
        db     "[", 0
        db     "+", 0
        db     "[@@DATA+", 0
        db     "[EBP+", 0
        db     "[EBP-", 0
        db     "]", 0
        db     ", AL", 0
        db     ", EAX", 0
        db     "mov     ESI,  EAX", 0
        db     "pop     EBX", 0
        db     ", BL", 0
        db     "pop     EBX", 0
        db     ", EBX", 0
        db     "pop     ESI", 0
        db     "pop     EAX", 0
        db     ", AL", 0
        db     "pop     EAX", 0
        db     ", EAX", 0
        db     "pop     ESI", 0
        db     "cld", 0
        db     "mov     ECX,  ", 0
        db     "rep     movsb", 0
        db     "mov     AL,   byte  ", 0
        db     "mov     BL,   byte  ", 0
        db     "mov     EAX,  dword ", 0
        db     "mov     EBX,  dword ", 0
        db     "lea     EAX,  ", 0
        db     "lea     EBX,  ", 0
        db     "EAX", 0
        db     "EBX", 0
        db     "[@@DATA+", 0
        db     "+", 0
        db     "]", 0
        db     "[EBP+", 0
        db     "+", 0
        db     "]", 0
        db     "[EBP+", 0
        db     "-", 0
        db     "]", 0
        db     "[", 0
        db     "+", 0
        db     "]", 0
        db     "[@@DATA+", 0
        db     "]", 0
        db     "[EBP+", 0
        db     "]", 0
        db     "[EBP-", 0
        db     "]", 0
        db     "add     EAX,  @@DATA+", 0
        db     "lea     EAX,  [EBP+EAX+", 0
        db     "]", 0
        db     "lea     EAX,  [EBP+EAX-", 0
        db     "]", 0
        db     "add     EAX,  @@TEXT+", 0
        db     "add     EAX,  ", 0
        db     "mov     EAX,  @@DATA+", 0
        db     "lea     EAX,  [EBP+", 0
        db     "]", 0
        db     "lea     EAX,  [EBP-", 0
        db     "]", 0
        db     "mov     EAX,  @@TEXT+", 0
        db     "push    EAX", 0
        db     "call   [@", 0
        db     "]", 0
        db     "call    @", 0
        db     "    ; ", 0
        db     "push    EAX", 0
        db     "call    EAX", 0
        db     "push    EAX", 0
        db     "push    EBX", 0
        db     "pop     EBX", 0
        db     "imul    EBX,  ", 0
        db     "add     EAX,  EBX", 0
        db     "pop     EBX", 0
        db     "imul    EBX,  ", 0
        db     "imul    EAX,  ", 0
        db     "add     EAX,  EBX", 0
        db     "push    EAX", 0
        db     "push    EBX", 0
        db     "shl     EAX,  2", 0
        db     "shl     EBX,  2", 0
        db     "imul    EAX,  ", 0
        db     "imul    EBX,  ", 0
        db     "add     EAX,  EBX", 0
        db     "pop     EBX", 0
        db     "add     EAX,  EBX", 0
        db     "push    EAX", 0
        db     "xchg    EAX,  EBX", 0
        db     "shl     EAX,  2", 0
        db     "imul    EAX,  ", 0
        db     "pop     EBX", 0
        db     "add     EAX,  dword ", 0
        db     "shl     EBX,  2", 0
        db     "imul    EBX,  ", 0
        db     "add     EBX,  dword ", 0
        db     "mov     EAX,  dword ", 0
        db     "mov     EBX,  dword ", 0
        db     "EAX", 0
        db     "EBX", 0
        db     "[@@DATA+", 0
        db     "+", 0
        db     "]", 0
        db     "[EBP+", 0
        db     "+", 0
        db     "]", 0
        db     "[EBP+", 0
        db     "-", 0
        db     "]", 0
        db     "[", 0
        db     "+", 0
        db     "]", 0
        db     "[@@DATA+", 0
        db     "]", 0
        db     "[EBP+", 0
        db     "]", 0
        db     "[EBP-", 0
        db     "]", 0
        db     "void", 0
        db     "word", 0
        db     "char", 0
        db     "byte", 0
        db     "char", 0
        db     "word", 0
        db     "char", 0
        db     "int", 0
        db     "byte", 0
        db     "char", 0
        db     "word", 0
        db     "char", 0
        db     "and     EAX,  0FFH", 0
        db     "and     EBX,  0FFH", 0
        db     "word", 0
        db     "byte", 0
        db     "and     EAX,  0FFH", 0
        db     "and     EBX,  0FFH", 0
        db     "int", 0
        db     "char", 0
        db     "and     EAX,  0FFH", 0
        db     "and     EBX,  0FFH", 0
        db     "int", 0
        db     "byte", 0
        db     "and     EAX,  0FFH", 0
        db     "and     EBX,  0FFH", 0
        db     "int", 0
        db     "word", 0
        db     "not     AL", 0
        db     "not     BL", 0
        db     "not     EAX", 0
        db     "not     EBX", 0
        db     "mov     EAX,  ", 0
        db     "mov     EBX,  ", 0
        db     "int", 0
        db     "neg     EAX", 0
        db     "neg     EBX", 0
        db     "int", 0
        db      0
        db      0
        db      0
        db     "jmp     @", 0
        db      0
        db      0
        db     "jmp     @", 0
        db      0
        db      0
        db     "jmp     @", 0
        db      0
        db      0
        db     "jmp     @", 0
        db      0
        db      0
        db      0
        db     "push    EAX", 0
        db     "pop     EBX", 0
        db     "xchg    EAX,  EBX", 0
        db     "cmp     AL,   ", 0
        db     "cmp     AL,   BL", 0
        db     "cmp     EAX,  ", 0
        db     "cmp     EAX,  EBX", 0
        db     "int", 0
        db     "jl      @", 0
        db     "jle     @", 0
        db     "je      @", 0
        db     "jne     @", 0
        db     "jge     @", 0
        db     "jg      @", 0
        db     "jb      @", 0
        db     "jbe     @", 0
        db     "je      @", 0
        db     "jne     @", 0
        db     "jae     @", 0
        db     "ja      @", 0
        db     "or      ", 0
        db     "xor     ", 0
        db     "and     ", 0
        db     "add     ", 0
        db     "sub     ", 0
        db     "byte", 0
        db     "mul     BL", 0
        db     "word", 0
        db     "mul     EBX", 0
        db     "int", 0
        db     "imul    EBX", 0
        db     "byte", 0
        db     "xor     AH,   AH", 0
        db     "div     BL", 0
        db     "word", 0
        db     "xor     EDX,  EDX", 0
        db     "div     EBX", 0
        db     "int", 0
        db     "xor     EDX,  EDX", 0
        db     "idiv    EBX", 0
        db     "byte", 0
        db     "xor     AH,   AH", 0
        db     "div     BL", 0
        db     "xchg    AL,   AH", 0
        db     "word", 0
        db     "xor     EDX,  EDX", 0
        db     "div     EBX", 0
        db     "xchg    EAX,  EDX", 0
        db     "AL,   ", 0
        db     "AL,   BL", 0
        db     "EAX,  ", 0
        db     "EAX,  EBX", 0
        db     "push    EAX", 0
        db     "push    EAX", 0
        db     "sub     ESP,  ", 0
        db     "mov     ESI,  EAX", 0
        db     "mov     EDI,  ESP", 0
        db     "cld", 0
        db     "mov     ECX,  ", 0
        db     "rep     movsb", 0
        db     "mov     ESP,  EBP", 0
        db     "pop     EBP", 0
        db     "xor     EAX,  EAX", 0
        db     "push    EAX", 0
        db     "call   [@", 0
        db     "ExitProcess", 0
        db     "]", 0
        db     "mov     EAX,  1", 0
        db     "xor     EBX,  EBX", 0
        db     "int     80H", 0
        db     "ret     ", 0
        db     "db      0x", 0
        db      0
        db     "jmp     @", 0
        db      0
        db      0
        db     "byte", 0
        db     "and     EAX,  0FFH", 0
        db     "char", 0
        db     "cmp     AL,   ", 0
        db     "cmp     EAX,  ", 0
        db     "je      @", 0
        db     "jmp     @", 0
        db      0
        db     "jmp     @", 0
        db      0
        db      0
        db      0
        db     "jmp     @", 0
        db      0
        db      0
        db      0
        db     "jmp     @", 0
        db      13, 10, 0
        db     ".ctx", 0
        db      13, 10, 0
        db     "/c", 0
        db     "/w", 0
        db     "/l", 0
        db     "/b", 0
        db     "/k", 0
        db      13, 10, 0
        db      13, 10, 0
        db     ".asm", 0
        db     "define @COMPILER ", 34, "Context 2.0 for Win32", 34, 13, 10, 0
        db     "void    ExitProcess(word uExitCode) external KERNEL32;", 0
        db     "define @COMPILER ", 34, "Context 2.0 for Linux", 34, 13, 10, 0
        db     "define @COMPILER ", 34, "Context 2.0", 34, 13, 10, 0
        db     "define @COMPILER ", 34, "Context 2.0 for Kolibri", 34, 13, 10, 0
        db     "include", 0
        db     "define", 0
        db     "struct", 0
        db     "synonym", 0
        db     "function", 0
        db     "external", 0
        db     "is", 0
        db     "begin", 0
        db     "sequence", 0
        db     "select", 0
        db     "case", 0
        db     "default", 0
        db     "if", 0
        db     "then", 0
        db     "else", 0
        db     "switch", 0
        db     "of", 0
        db     "while", 0
        db     "do", 0
        db     "repeat", 0
        db     "until", 0
        db     "loop", 0
        db     "exit", 0
        db     "inc", 0
        db     "dec", 0
        db     "inline", 0
        db     "asm2", 0
        db     "asm", 0
        db     "return", 0
        db     "null", 0
        db     "NULL", 0
        db     "end", 0
        db     "void", 0
        db     "char", 0
        db     "byte", 0
        db     "word", 0
        db     "int", 0
        db     "begin", 0
        db      0
        db     "void", 0
        db     "end", 0
        db     "include", 0
        db      34, 0
        db      13, 0
        db     "(", 0
        db     ")", 13, 10, 0
        db     "define", 0
        db     "@", 0
        db     "'", 0
        db     "char", 0
        db     "#", 0
        db     "char", 0
        db     "word", 0
        db     "int", 0
        db     ";", 0
        db      34, 0
        db     "struct", 0
        db     ";", 0
        db     "@", 0
        db     "void", 0
        db     ";", 0
        db     "end", 0
        db     ",", 0
        db     "end", 0
        db     "synonym", 0
        db     "function", 0
        db     "@", 0
        db     "(", 0
        db     "@", 0
        db     "(", 0
        db     ";", 0
        db     "external", 0
        db     ".", 0
        db     ";", 0
        db     "is", 0
        db     "end", 0
        db     "void", 0
        db     "=", 0
        db     ":=", 0
        db     ";", 0
        db     ",", 0
        db     "COMPILER", 0
        db     "ExitProcess", 0
        db     "format  PE      CONSOLE", 0
        db     "format  PE      GUI", 0
        db     "format  ELF      executable", 0
        db      0
        db     "section ", 34, ".code", 34, " code readable executable", 0
        db     "segment readable executable", 0
        db     "use32", 0
        db     "jmp     @", 0
        db     "use32", 0
        db     "org 0", 0
        db      0
        db     "  db     'MENUET01'  ; 8-байтный идентификатор MenuetOS", 0
        db     "  dd     1           ; версия заголовка (всегда 1)", 0
        db     "  dd     START       ; адрес первой команды", 0
        db     "  dd     I_END       ; размер программы", 0
        db     "  dd     MEM         ; количество памяти", 0
        db     "  dd     STACKTOP    ; адрес вершины стэка", 0
        db     "  dd     0           ; адрес буфера для параметров", 0
        db     "  dd     0           ; зарезервировано", 0
        db      0
        db     "include ", 34, "macros.inc", 34, " ; макросы облегчают жизнь ассемблерщиков!", 0
        db     "START:", 0
        db     "jmp     @", 0
        db      0
        db     "       ;", 0
        db     "       ;begin", 0
        db     "push    EBP", 0
        db     "mov     EBP,  ESP", 0
        db     "sub     ESP,  ", 0
        db      0
        db     "section ", 34, ".data", 34, " data readable writeable", 0
        db      0
        db     "segment readable writeable", 0
        db      13, 10, "@@TEXT  db    ", 0
        db     "        db    ", 0
        db      0
        db     "@@DATA  rb      ", 0
        db      0
        db     "section ", 34, ".idata", 34, " import data readable writeable", 0
        db      0
        db     "dd      0, 0, 0, RVA @", 0
        db     ", RVA @", 0
        db     "dd      0, 0, 0, 0, 0", 0
        db      0
        db     "@", 0
        db     "  dd      RVA @", 0
        db     "dd      0", 0
        db      0
        db     "db     ", 34, 0
        db     ".DLL", 34, ", 0", 0
        db      0
        db     "dw      0", 0
        db     "db     ", 34, 0
        db      34, ", 0", 0
        db      0
        db     "section ", 34, ".reloc", 34, " fixups data readable discardable", 0
        db      0
        db     "I_END:                  ; метка конца программы", 0
        db     "  rb 4096               ; память для стека", 0
        db     "align 16", 0
        db     "STACKTOP:               ; метка вершины стека (при заполнении стек", 0
        db     "                        ; растет в сторону уменьшения адресов, потому", 0
        db     "                        ; память для него в коде программы встречается", 0
        db     "                        ; раньше чем его вершина)", 0
        db     "MEM:                    ; метка указывающая на конец программы плюс", 0
        db     "                        ; размер используемой ею оперативной памяти", 0
        db     "; Адрес метки MEM всегда должен быть больше чем адрес метки I_END.", 0
        db     "; Метка STACKTOP должна располагается после метки I_END и перед меткой", 0
        db     ";   MEM. STACKTOP может находится и перед I_END, но это не правильно.", 0
        db     "; Имена меток могут быть с любыми названиями, главное соблюдать", 0
        db     ";   правильный порядок их расположения.", 0
        db      0
        db     "entry   @", 0
        db      13, 0
        db     "(", 0
        db     ")", 13, 10, 0
        db      0
        db      0
        db      13, 10, 0
        db     "фТБОУМСФПТ СЪЩЛБ Context. чЕТУЙС 2.2", 13, 10, 0
        db     "(C) иПИМПЧ б.ч.  З.нПУЛЧБ  1995-2009", 13, 10, 0
        db     "йУРПМШЪПЧБОЙЕ:   context <src> [tgt]", 13, 10, 0
        db     "жПТНБФ  (tgt):  /c  - Win32 console", 13, 10, 0
        db     "                /w  - Win32 gui", 13, 10, 0
        db     "                /l  - Linux", 13, 10, 0
        db     "                /b  - binary", 13, 10, 0
        db     "                /k  - Kolibri", 13, 10, 0

@@DATA  rb      4749864
        
        I_END:                  ; метка конца программы
          rb 4096               ; память для стека
        align 16
        STACKTOP:               ; метка вершины стека (при заполнении стек
                                ; растет в сторону уменьшения адресов, потому
                                ; память для него в коде программы встречается
                                ; раньше чем его вершина)
        MEM:                    ; метка указывающая на конец программы плюс
                                ; размер используемой ею оперативной памяти
        ; Адрес метки MEM всегда должен быть больше чем адрес метки I_END.
        ; Метка STACKTOP должна располагается после метки I_END и перед меткой
        ;   MEM. STACKTOP может находится и перед I_END, но это не правильно.
        ; Имена меток могут быть с любыми названиями, главное соблюдать
        ;   правильный порядок их расположения.
