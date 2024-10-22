       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. ATI1.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
..    *== OBJETIVO    :
..    *== DATA        : XX/XX/2024
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
       77  WRK-PRODUTO                   PIC X(30) VALUE SPACES.
       77  WRK-VALOR                     PIC 9(05) VALUE ZEROS.
       77  WRK-VALOR-ACUM                PIC 9(03) VALUE ZEROS.
       77  WRK-PRODUTO-QTD               PIC 9(03) VALUE ZEROS.
       77  WRK-CONFIRMA                  PIC X(03) VALUE SPACES.






      *-----------------------------------------------------------------
       PROCEDURE                                 DIVISION.
       0001-PRINCIPAL                            SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIAR                              SECTION.
           DISPLAY " DIGITE 'FIM' PARA ENCERRAR PROGRAMA."
           DISPLAY "=====================================".


       0100-INICIAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                            SECTION.

           DISPLAY "COMPRA DE PRODUTO(FIM PARA ENCERRAR)"
               ACCEPT WRK-CONFIRMA

           PERFORM UNTIL WRK-CONFIRMA EQUAL "FIM"
               DISPLAY "----------------------------------------------"
               DISPLAY "DIGITE O NOME DO PRODUTO: (FIM PARA ENCERRAR):"
               ACCEPT WRK-PRODUTO
               DISPLAY "DIGITE O VALOR DO PRODUTO:"
                   ACCEPT WRK-VALOR
               ADD 1 TO WRK-PRODUTO-QTD
               COMPUTE WRK-VALOR-ACUM = WRK-VALOR-ACUM + WRK-VALOR
               DISPLAY "QUER CONTINUAR A COMPRA?"
                   ACCEPT WRK-CONFIRMA
           END-PERFORM.


       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                            SECTION.

           IF WRK-PRODUTO-QTD GREATER 0
               DISPLAY "---- LISTA DE PRODUTOS ----"
               DISPLAY "QUANTIDADES DE PRODUTOS:"WRK-PRODUTO-QTD
               DISPLAY "VALOR FINAL DA COMPRA:"WRK-VALOR-ACUM
           ELSE
               DISPLAY"NENHUM PRODUTO ADICIONADO!"

           END-IF.
       0300-FINALIZAR-FIM. EXIT.
