    .ORIG x3000

main:   LEA R1, valeur ;met R1 = &valeur
        LEA R2, chaine2 ;fais pointer R2 vers la chaine
        AND R3,R3, #0;
        JSR sousRoutine
        HALT

sousRoutine:
copie:  LDR R3, R1, #0  ; je load dans R3 la valeur de R1
        STR R3, R2, #0 ;et je l'ecris dans R2

        ADD R2, R2, #1 ;j'incremente le pointeur sur R2
        ADD R1, R1, #1 ;j'incremente le pointeur sur R1
        
        ADD R3, R3, #0 ;pour faire BRz sur R3
        BRnp copie ;loop tant que R1 != 0, cad ca atteint le carac nul, tant que R3 est p ou n

        ;copie deja le 0
        ;AND R4,R4, #0 ;je mets R4 à 0
        ;STR R4, R2, #1 ; je mets dans l'adresse R2+1 la valeur de R4 pour le 0/
        RET


valeur: .STRINGZ "chaine a copier"
chaine2: .BLKW #64 ;bloc memoire de 64 mots

        .END