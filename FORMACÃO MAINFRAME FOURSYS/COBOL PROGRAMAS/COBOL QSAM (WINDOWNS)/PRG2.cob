       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. PRG2.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
..    *== OBJETIVO    :
..    *== DATA        : 02/07/2024
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
       77  WRK-VALOR                           PIC 9(06)V99 VALUE ZEROS.
       77  WRK-PORCENTAGEM                     PIC 9(02)V99 VALUE ZEROS.
       77  WRK-VALORFINAL                      PIC 9(07)V99 VALUE ZEROS.
       77  WRK-MES                             PIC 9(02)    VALUE ZEROS.
       77  WRK-STATUS                          PIC X(48)   VALUE SPACES.

       77  WRK-VALOR-AUX                       PIC 9(06)V99 VALUE ZEROS.

      *-----------------------------------------------------------------
       PROCEDURE                                 DIVISION.
       0001-PRINCIPAL                            SECTION.


           PERFORM 0100-INICIAR
           IF WRK-STATUS EQUAL SPACES
           PERFORM 0200-PROCESSAR
           PERFORM 0300-FINALIZAR
           END-IF
           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIAR                              SECTION.

           DISPLAY "QUAL O VALOR QUE PRETENDE APLICAR:"
             ACCEPT WRK-VALOR

           DISPLAY "QUANTOS MESES PRETENDE DEIXAR APLICANDO:"
               ACCEPT WRK-MES

           DISPLAY "QUAL A PORCENTAGEM DE RENDIMENTO POR MES:"
               ACCEPT WRK-PORCENTAGEM


           IF WRK-VALOR EQUAL 0
               MOVE "VALOR" TO WRK-STATUS
           END-IF.

           IF WRK-MES EQUAL 0
               MOVE "MES" TO WRK-STATUS
           END-IF.

           IF WRK-PORCENTAGEM EQUAL 0
               MOVE "PORCENTAGEM" TO WRK-STATUS
           END-IF.

           IF WRK-STATUS NOT EQUAL SPACES
               DISPLAY "FALTOU " WRK-STATUS
           END-IF.


       0100-INICIAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                            SECTION.

           DISPLAY "--------------------------"
           DISPLAY "------ PORCENTAGEM -------"

           MOVE WRK-VALOR           TO WRK-VALOR-AUX

           PERFORM WRK-MES TIMES
               COMPUTE WRK-VALOR-AUX = WRK-VALOR-AUX + WRK-VALOR-AUX *
                                                 (WRK-PORCENTAGEM / 100)

           END-PERFORM.





       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------


       0300-FINALIZAR                            SECTION.

           COMPUTE WRK-VALORFINAL = WRK-VALOR + WRK-VALOR-AUX

           DISPLAY "-----------------------"
           DISPLAY "VALOR ORIGINAL DA APLICACAO:"WRK-VALOR
           DISPLAY "VALOR FINAL DO INVESTIMENTO:"WRK-VALOR-AUX.


       0300-FINALIZAR-FIM. EXIT.
