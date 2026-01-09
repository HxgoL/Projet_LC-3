    .ORIG x3000

    LD R0, e ;R0 = entré
    LEA R1, m2 ; je mets l'adresse dans R1 pour acceder aux valeurs

    AND R2, R2, #0
    ADD R2, R2, #1 ;init du masque à 1

    AND R3, R3, #0
    ADD R3, R3, #15
    ADD R3, R3, #1
    
    AND R5, R5, #0 ; R5 = res

loop:   
    AND R4, R0, R2 ;on test si 0 ou 1
    BRz siZero ;si y'a un 0 alors on saute au label 

    LDR R6, R1, #0 ;on lit la valeur du masque 2 
    ADD R5, R5, R6 ;si 1 on additionne dans le res, le res avec la valeur de m2
    
siZero: 
    ADD R1, R1, #1 ;on incremente le masque pour selectionner la bonne valeur
    ADD R2, R2, R2 ; on fait masque x2

    ADD R3, R3, #-1
    BRp loop ;tant que i est positive on loop    

    HALT
    


e: .FILL x00A0

m2:    .FILL x8000
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