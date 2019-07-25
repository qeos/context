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
        jmp     @10020

@10000:        ;mcall
        push    EBP
        mov     EBP,  ESP
    mcall dword [EBP+8], dword [EBP+12], dword [EBP+16], dword [EBP+20], dword [EBP+24], dword [EBP+28]
        mov     ESP,  EBP
        pop     EBP
        ret     24

@10001:        ;mcall1
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10000    ; mcall
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10002:        ;mcall2
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10000    ; mcall
        mov     ESP,  EBP
        pop     EBP
        ret     8

@10003:        ;mcall3
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10000    ; mcall
        mov     ESP,  EBP
        pop     EBP
        ret     12

@10004:        ;mcall4
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  0
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP+20]
        push    EAX
        mov     EAX,  dword [EBP+16]
        push    EAX
        mov     EAX,  dword [EBP+12]
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10000    ; mcall
        mov     ESP,  EBP
        pop     EBP
        ret     16

@10005:        ;str2
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  24
        mov     EAX,  @@TEXT+24
        mov     dword [EBP-4], EAX
        mov     EAX,  @@TEXT+57
        mov     dword [EBP-8], EAX
        mov     EAX,  0
        mov     dword [EBP-12], EAX
@10006: 
        mov     EAX,  dword [EBP+8]
        cmp     EAX,  0
        ja      @10008
@10007: 
        mov     EAX,  dword [EBP-12]
        cmp     EAX,  0
        jne     @10009
@10008: 
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
        jmp     @10006
@10009: 
        mov     AL,   0
        mov     EBX,  dword [EBP-12]
        add     EBX,  dword [EBP-4]
        mov     byte  [EBX+0], AL
        mov     EAX,  0
        mov     dword [EBP-16], EAX
        mov     EAX,  dword [EBP-12]
        sub     EAX,  1
        mov     dword [EBP-20], EAX
@10010: 
        mov     EAX,  dword [EBP-20]
        mov     EBX,  dword [EBP-16]
        cmp     EAX,  EBX
        jbe     @10012
@10011: 
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
        jmp     @10010
@10012: 
        mov     EAX,  dword [EBP-4]
        mov     ESP,  EBP
        pop     EBP
        ret     8

@10013:        ;str
        push    EBP
        mov     EBP,  ESP
        mov     EAX,  10
        push    EAX
        mov     EAX,  dword [EBP+8]
        push    EAX
        call    @10005    ; str2
        mov     ESP,  EBP
        pop     EBP
        ret     4

@10014:        ;draw_window
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  40
        mov     EAX,  1
        push    EAX
        mov     EAX,  12
        push    EAX
        call    @10002    ; mcall2
        mov     EAX,  40
        push    EAX
        lea     EAX,  [EBP-40]
        push    EAX
        mov     EAX,  3
        push    EAX
        mov     EAX,  48
        push    EAX
        call    @10004    ; mcall4
        mov     EAX,  @@TEXT+74
        push    EAX
        mov     EAX,  0
        push    EAX
        mov     EAX,  dword [EBP-20]
        or      EAX,  855638016
        push    EAX
        mov     EAX,  13107350
        push    EAX
        mov     EAX,  13107500
        push    EAX
        mov     EAX,  0
        push    EAX
        call    @10000    ; mcall
        lea     EAX,  [EBP-40]
        push    EAX
        mov     EAX,  dword [EBP-8]
        or      EAX,  2415919104
        push    EAX
        mov     EAX,  655380
        push    EAX
        mov     EAX,  4
        push    EAX
        call    @10004    ; mcall4
        mov     EAX,  2
        push    EAX
        mov     EAX,  12
        push    EAX
        call    @10002    ; mcall2
        mov     ESP,  EBP
        pop     EBP
        ret     0

@10015:        ;key
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  12
        mov     AL,   144
        mov     byte  [EBP-4], AL
        mov     AL,   0
        mov     byte  [EBP-2], AL
        mov     EAX,  2
        push    EAX
        call    @10001    ; mcall1
        mov     byte  [EBP-8], AL
        mov     AL,   byte  [EBP-8]
        and     EAX,  0FFH
        push    EAX
        call    @10013    ; str
        mov     dword [EBP-12], EAX
        mov     EAX,  dword [EBP-12]
        mov     AL,   byte  [EAX+0]
        mov     byte  [EBP-3], AL
        lea     EAX,  [EBP-4]
        push    EAX
        mov     EAX,  55
        push    EAX
        mov     EAX,  55
        push    EAX
        call    @10003    ; mcall3
        mov     ESP,  EBP
        pop     EBP
        ret     0

@10016:        ;button
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
        mov     EAX,  17
        push    EAX
        call    @10001    ; mcall1
        mov     dword [EBP-4], EAX
        mov     EAX,  dword [EBP-4]
        mov     EBX,  256
        xor     EDX,  EDX
        div     EBX
        cmp     EAX,  1
        jne     @10018
@10017: 
        mov     EAX,  4294967295
        push    EAX
        call    @10001    ; mcall1
@10018: 
@10019: 
        mov     ESP,  EBP
        pop     EBP
        ret     0

@10020:        ;begin
        push    EBP
        mov     EBP,  ESP
        sub     ESP,  4
@10021: 
        mov     EAX,  1
        cmp     EAX,  1
        jne     @10028
@10022: 
        call    @10014    ; draw_window
        mov     EAX,  10
        push    EAX
        call    @10001    ; mcall1
        mov     dword [EBP-4], EAX
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  2
        jne     @10024
@10023: 
        call    @10015    ; key
        jmp     @10027
@10024: 
        mov     EAX,  dword [EBP-4]
        cmp     EAX,  3
        jne     @10026
@10025: 
        call    @10016    ; button
@10026: 
@10027: 
        jmp     @10021
@10028: 
        mov     ESP,  EBP
        pop     EBP

@@TEXT  db     "Context 2.0 for Kolibri", 0
        db     "10987654321098765432109876543210", 0
        db     "0123456789ABCDEF", 0
        db     "Sample program", 0
        
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
