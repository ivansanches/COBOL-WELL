        IDENTIFICATION DIVISION.
        PROGRAM-ID. VENDAS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 VAR-VENDAS PIC 9(5)V99 OCCURS 12 TIMES.
       01 VAR-VALOR-VENDA PIC 9(5)V99.
        01 VAR-INDICE PIC 99.
       01 VAR-MES PIC 99.

       PROCEDURE DIVISION.
       INICIO.
       PERFORM VENDAS-INICIAIS.
       DISPLAY "Informe o mês da venda: ".
        ACCEPT VAR-MES.
       PERFORM UNTIL VAR-MES = 99
        IF VAR-MES >= 1 AND VAR-MES <= 12
            DISPLAY "Informe o valor da venda: ".
            ACCEPT VAR-VALOR-VENDA.
            COMPUTE VAR-VENDAS(VAR-MES) = VAR-VENDAS(VAR-MES) + VAR-VALOR-VENDA
        ELSE
            DISPLAY "Mês inválido. Informe novamente: ".
        END-IF
        DISPLAY "Informe o mês da venda (digite 99 para encerrar): ".
        ACCEPT VAR-MES
       END-PERFORM.

       DISPLAY "====================================".
       DISPLAY "Valores acumulados por mês:".
       PERFORM VENDAS-FINAIS.
        DISPLAY "".
       DISPLAY "============== FIM DE PROGRAMA ==============".
       STOP RUN.

       VENDAS-INICIAIS.
       PERFORM VARYING VAR-INDICE FROM 1 BY 1 UNTIL VAR-INDICE > 12
        COMPUTE VAR-VENDAS(VAR-INDICE) = 0
       END-PERFORM.

       VENDAS-FINAIS.
       PERFORM VARYING VAR-INDICE FROM 1 BY 1 UNTIL VAR-INDICE > 12
        DISPLAY "Mês ", VAR-INDICE, ": R$ ", VAR-VENDAS(VAR-INDICE)
       END-PERFORM.
