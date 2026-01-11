    .ORIG x3000

    LD R0, x
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
    HALT



x:  .FILL x00A0
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