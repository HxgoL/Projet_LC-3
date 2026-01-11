    .ORIG x3000

    AND R0, R0, #0
    LD R0, x

    ADD R1, R0, #-1

    JSR xor
    JSR popcnt
    ADD R2, R2, #-1

    HALT

xor:
    NOT R2, R1 ; a (+) b = a*not(b) + not(a)+b
    AND R3, R0, R2 ; R0*not(R1)

    NOT R4, R0
    AND R5, R4, R1 ; not(R0)*R1

    ADD R6, R3, R5  ; res dans R6 à retenir !
    RET

popcnt:
    ;on veut compter les 1 dans R6
    AND R2, R2, #0
    ADD R5, R2, #15
    ADD R5, R5, #1 ;i = 16

    ADD R3, R2, #1 ; on definit un masque
loop:
    AND R4, R6, R3 ; on met dans R4 le res de masque AND xor 
    BRz siZero ; si c'est pas un 1 on saute
    ADD R2, R2, #1
siZero: 
    ADD R3, R3, R3 ; on fait x2 sur le masque

    ADD R5, R5, #-1
    BRp loop
    RET

x: .FILL x00A0

.END