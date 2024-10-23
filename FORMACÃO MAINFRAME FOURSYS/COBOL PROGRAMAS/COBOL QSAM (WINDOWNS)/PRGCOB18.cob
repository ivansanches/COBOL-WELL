       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. PRGCOB18.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
..    *== OBJETIVO    : COMANDO LOOP (TIMES)/
..    *== DATA        : 03/07/2024
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
       77  WRK-NUMERO                     PIC 9(02) VALUE ZEROS.
       77  WRK-CONTADOR                   PIC 9(02) VALUE ZEROS.
       77  WRK-RESULTADO                  PIC 9(03) VALUE ZEROS.

       77  WRK-RESULTADO-ED               PIC ZZ9.

      *-----------------------------------------------------------------
       PROCEDURE                                 DIVISION.
       0001-PRINCIPAL                            SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIAR                              SECTION.

           DISPLAY "DIGITE O NUMERO:"
               ACCEPT WRK-NUMERO.

       0100-INICIAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                            SECTION.


           PERFORM 10 TIMES

           ADD 1 TO WRK-CONTADOR
           COMPUTE WRK-RESULTADO = WRK-NUMERO * WRK-CONTADOR
           MOVE WRK-RESULTADO TO WRK-RESULTADO-ED
           DISPLAY WRK-NUMERO " X " WRK-CONTADOR" = " WRK-RESULTADO-ED

           END-PERFORM.


       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                            SECTION.

           DISPLAY "--------------------"
           DISPLAY "    FIM PROGRAMA     ".

       0300-FINALIZAR-FIM. EXIT.
