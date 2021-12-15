        ORG $0

start:
        ld      hl,$2000
        ld      sp,hl       ; pilha no final da Ram
loop1:
        xor     a           ; n = 0
loop2:
        push    af
        call    fibo
        out     ($55),a     ; mostrar fibo(n)
        pop     af
        inc     a
        cp      14
        jr      nZ,loop2    ; repetir até n = 13
        jr      loop1       ; depois voltar para n = 0
        
fibo:
        cp      2
        ret     c           ; fibo(0) = 0, fibo(1) = 1
        dec     a
        push    af
        call    fibo
        ld      b,a         ; b = fibo(n-1)
        pop     af
        dec     a
        push    bc
        call    fibo        ; a = fibo(n-2)
        pop     bc
        add     b           ; fibo(n) = fibo(n-1)+fibo(n-2)
        ret
        
