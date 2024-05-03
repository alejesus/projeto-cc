FUNCTION Main()

    CLS
    SETMODE(26,90)

    SET SCORE OFF
    SET DATE FORMAT TO "dd/mm/yyyy"
    SET MESSAGE TO 23 CENTER

    @00,01 SAY SPACE(89) COLOR "b/w"
    @24,01 SAY SPACE(89) COLOR "b/w"
    @00,01 SAY " Projeto Conta Corrente v1.0 " COLOR "w+/b"
    @00,71 SAY " Data: " + DTOC( DATE() ) + " " COLOR "w+/b"

    nMenu := 1
    nSaldo := 0
    DO WHILE .T.

        IF nSaldo < 0
            @01,00 SAY PADC( "Saldo em C/C: " + Transform( nSaldo, "@E 999,999,999.99" ), MAXCOL() ) COLOR "r+/n"
        ELSE
            @01,00 SAY PADC( "Saldo em C/C: " + Transform( nSaldo, "@E 999,999,999.99" ), MAXCOL() ) COLOR "b+/n"
        ENDIF

        SET COLOR TO "g/n"
        SET CURSOR OFF

        @02,03 TO 08,25 // DOUBLE
        @04,05 PROMPT " Registrar Receita " MESSAGE "Lancamento de valores que somam no saldo"
        @05,05 PROMPT " Registrar Despesa " MESSAGE "Lancamento de valores que subtraem do saldo"
        @06,05 PROMPT " Sair ou Tecle ESC " MESSAGE "Pra sair e melhorar o sistema"
        MENU TO nMenu

        SET CURSOR ON

        IF nMenu = 0 .or. nMenu = 3 .or. LastKey() == 27
            EXIT
        ELSEIF nMenu = 1
            nValor := 0
            @10,20 SAY "Valor da Receita: " GET nValor PICTURE "@E 999,999,999.99" COLOR "b/n"
            READ
            // Se não pressionou ESC
            IF LastKey() <> 27
                nSaldo += nValor
            ENDIF
        ELSEIF nMenu = 2
            nValor := 0
            @10,20 SAY "Valor da Despesa: " GET nValor PICTURE "@E 999,999,999.99" COLOR "r/n"
            READ
            // Se não pressionou ESC
            IF LastKey() <> 27
                nSaldo -= nValor
            ENDIF
        ENDIF

        // Limpando a linha
        @10,20 SAY SPACE(50)

    ENDDO

    SET COLOR TO
    CLS
    ? "Tchau e ate logo ..."
    ?
    ?

RETURN