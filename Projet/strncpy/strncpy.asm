    .ORIG x3000

main:   LEA R1, valeur ;met R1 = &valeur
        LEA R2, chaine2 ;fais pointer R2 vers la chaine
        AND R3, R3, #0;
        AND R4, R4, #0; R4 = 0

        LD R5, n ; R5 = n

        JSR sousRoutine
        HALT

sousRoutine:
        ;cas ou n = 0
        ADD R5, R5, #0 ; R5 pour BR
        BRz fin
copie:  
        LDR R3, R1, #0  ; je load dans R3 la valeur de R1
        STR R3, R2, #0 ;et je l'ecris dans R2

        ADD R2, R2, #1 ;j'incremente le pointeur sur R2
        
        ADD R5, R5, #-1 ;n-- 
        BRz fin ;pour quand n<length(String)
        
        ADD R3, R3, #0 ;pour faire BRz sur R3
        BRz boucle0 ; quand on arrive a '0/' et n>0

        ADD R1, R1, #1 ; incr pointeur R1 ici pour boucler correctement
        BR copie

boucle0:    
        ;tant que n>0, on met 0 et n--
        STR R4, R2, #0 ; R4 est def a 0 donc on met 0 dans le tableau
        ADD R5, R5, #-1
        ADD R2, R2, #1 ;on incremente le pointeur

        BRp boucle0
        ;copie deja le 0
        ;AND R4,R4, #0 ;je mets R4 à 0
        ;STR R4, R2, #1 ; je mets dans l'adresse R2+1 la valeur de R4 pour le 0/
        RET

cas_ou_n_petit:
        RET 
fin:    RET
valeur: .STRINGZ "chaine a copier"
chaine2:.BLKW #64 ;bloc memoire de 64 mots
n:      .FILL #20 ;test avec 20

        .END