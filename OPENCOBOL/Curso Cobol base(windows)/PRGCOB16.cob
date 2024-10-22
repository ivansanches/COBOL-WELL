       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. PRGCOB16.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
..    *== OBJETIVO    : EVALUETE
..    *== DATA        : 01/07//2024
..    *== CONSULTORIA : FOURSYS
..    *== ALTERACAO   :
ALT1  *=================================================================
       ENVIRONMENT                               DIVISION.
       CONFIGURATION                             SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      *-----------------------------------------------------------------

       DATA                                      DIVISION.
       WORKING-STORAGE                           SECTION.

      *==================== VARIAVEIS DE APOIO
       77  WRK-PRODUTO                 PIC X(30)           VALUE SPACES.
       77  WRK-ESTADO                  PIC X(02)           VALUE SPACES.
       77  WRK-VALOR                   PIC 9(08)V99        VALUE ZEROS.
       77  WRK-FRETE                   PIC 9(08)V99        VALUE ZEROS.

      *==================== VARIAVIES DE EDICAO
       77  WRK-VALOR-ED                PIC ZZ.ZZZ.ZZ9,99.
       77  WRK-FRETE-ED                PIC ZZ.ZZZ.ZZ9,99.

      *-----------------------------------------------------------------
       PROCEDURE                                 DIVISION.
       0001-PRINCIPAL                            SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIAR                              SECTION.

           DISPLAY "PRODUTO:"
               ACCEPT WRK-PRODUTO.

           DISPLAY "VALOR:"
               ACCEPT WRK-VALOR.

           DISPLAY "ESTADO (SP/RJ/ES)"
               ACCEPT WRK-ESTADO.

       0100-INICIAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                            SECTION.

           EVALUATE WRK-ESTADO

           WHEN "SP"
               COMPUTE WRK-FRETE = WRK-VALOR * 0,10
      *----------------------------------------------------------------*

           WHEN "RJ"
               COMPUTE WRK-FRETE = WRK-VALOR * 0,15
      *----------------------------------------------------------------*

           WHEN "ES"
               COMPUTE WRK-FRETE = WRK-VALOR * 0,20
      *----------------------------------------------------------------*

           WHEN OTHER
               DISPLAY "ESTADO INVALIDO - RETIRAR NA LOJA"

           END-EVALUATE.

       0200-PROCESSAR-FIM. EXIT.


      *-----------------------------------------------------------------
       0300-FINALIZAR                            SECTION.

           DISPLAY "VALOR FINAL" WRK-VALOR-ED.

           IF WRK-FRETE GREATER 0
               DISPLAY "VALOR FRETE" WRK-FRETE-ED
           END-IF.

       0300-FINALIZAR-FIM. EXIT.
