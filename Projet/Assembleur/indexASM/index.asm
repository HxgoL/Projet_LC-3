    .ORIG x3000

    LEA R1, valeur ;on charge dans R1 notre string
    LD R2, char ;on charge le charactere recherché dans R3
    JSR sousRoutine
    HALT

sousRoutine:
loop: 
        LDR R3, R1, #0 ; R3 = *s (tres important)
        Brz finDeChaine ;si on est a 0 alors la chaine est finie

        ;on fait la condition si ils sont egaux alors R3 - R2 = 0
        NOT R4, R2 ; on met -R2 dans R4
        ADD R4,R4, #1 ;ajouter un pcq c'est en complement a 2

        ADD R4, R3 ,R4 ; on fait R3 + (-R2) dans R4
        BRz sautIF ;si c'est 0 on va a notre IF

        ADD R1, R1, #1 ; s++
        BR loop ;on boucle jusqu'a fin de chaine

sautIF: ADD R0, R1, #0 ;on met dans R0 l'adresse de s+i
        RET
finDeChaine: AND R0, R0 , #0 ;on veut 0 si on trouve pas
        RET


valeur:  .STRINGZ "Bonjour a tous"
char:    .FILL x0061 ;on charge un char ascii avec son code hexa (la c'est 'a')

    .END