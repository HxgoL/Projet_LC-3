    .ORIG x3000

main:
    LD R1, a
    LD R2, b
    JSR testProduit
    JSR calculProduit
    HALT

testProduit:
    ST R7, memR7
    LD R6, a
    JSR clz
    ST R3, clzA

    LD R6, b ; on met dans le parametre b
    JSR clz
    ST R3, clzB

    LD R3, clzA ; met clz(a) dans R3
    LD R4, clzB ; met clz(b) dans R4
    
    ADD R5, R3, R4 ; met dans R5 clz(a) + clz(b)
    
    AND R6, R6, #0
    ADD R6, R6, #15
    ADD R6, R6, #1
    NOT R6, R6
    ADD R6, R6, #1 

    ADD R0, R5, R6 ; met dans R0 le resultat
    BRzp casZeroEtPos ; si la somme est negatif c'est bon 
    LD R7, memR7
    RET ; sinon ca return R0

casZeroEtPos:
    AND R0, R0, #0
    NOT R0, R0 ; si y'a un overflow on met 2^16 - 1 (not 0 c'est 0xffff)
    HALT

calculProduit:
    AND R0, R0, #0
    LD R1, a
    LD R2, b ; reload car utilisé dans clz
    AND R3, R3, #0
    ADD R3, R3, #1 ; R3 = masque = x0001
    ADD R5, R1, #0
    ADD R6, R3, #15 ; R6 = i = 16

loopMult:
    AND R4, R2, R3 ; test b AND masque

    BRz siZeroMult ; si c'est zero ou saute l'instructionb
    ADD R0, R0, R5
siZeroMult:
    ADD R5, R5, R5 ; shiftA = a*2^i
    ADD R3, R3, R3 ; m*2
    ADD R6, R6, #-1
    BRp loopMult
    RET

clz:
    ADD R0, R6, #0 ; R6 parametre qui peut etre ecrase
    LEA R1, m

    AND R2, R2, #0
    ADD R2, R2, #15
    ADD R2, R2, #1

    AND R3, R3, #0 ; compteurDe0

loop: 
    LDR R4, R1, #0 ;on charge la valeur du masque dans R4
    AND R5, R0, R4 ; on compare la valeur et notre masque
    BRnp siUn ; si on a un 1, on termine

    ADD R1, R1, #1

    ADD R3, R3, #1 ; compteurDe0++
    ADD R2, R2, #-1
    BRp loop ; tant que i > 0 on continue 

siUn:
    RET

a:  .FILL x4000
b:  .FILL x0002

clzA: .BLKW 1 ; memoire en plus pour stocker clzA car plus de registres
clzB: .BLKW 1

memR7: .BLKW 1

m:  .FILL x8000
    .FILL x4000
    .FILL x2000
    .FILL x1000
    .FILL x0800
    .FILL x0400
    .FILL x0200
    .FILL x0100
    .FILL x0080
    .FILL x0040
    .FILL x0020
    .FILL x0010
    .FILL x0008
    .FILL x0004
    .FILL x0002
    .FILL x0001

.END