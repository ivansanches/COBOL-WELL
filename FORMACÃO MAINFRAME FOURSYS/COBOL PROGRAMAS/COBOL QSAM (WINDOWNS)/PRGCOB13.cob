       IDENTIFICATION                               DIVISION.
       PROGRAM-ID. PRGCOB13.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
..    *== OBJETIVO    :OPERADORES ARITIMETICOS(COMPUTE)
..    *== DATA        : 30/06/2024
..    *== CONSULTORIA : FOURSYS
..    *== ALTERACAO   :
ALT1  *=================================================================
       ENVIRONMENT                                  DIVISION.
       CONFIGURATION                         SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      *-----------------------------------------------------------------

       DATA                                         DIVISION.
       WORKING-STORAGE                       SECTION.
       77 WRK-NUM1         PIC 9(04)  VALUE ZEROS.
       77 WRK-NUM2         PIC 9(04)  VALUE ZEROS.
       77 WRK-RESULTADO    PIC 9(08)  VALUE ZEROS.

       77 WRK-RESULTADO-ED PIC ZZ.ZZZ.ZZ9 VALUE ZEROS.


      *-----------------------------------------------------------------
       PROCEDURE                                    DIVISION.
       0001-PRINCIPAL                        SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIAR                          SECTION.

           DISPLAY"DIGITE O NUMERO 1:"
             ACCEPT WRK-NUM1
           DISPLAY"DIGITE O NUMERO 2:"
             ACCEPT WRK-NUM2.

       0100-INICIAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                        SECTION.
      *==================== ADD(SOMA)
      *    ADD WRK-NUM1 WRK-NUM2 TO WRK-RESULTADO


      *==================== SUBTRACT(SUBTRACAO)
      *    SUBTRACT WRK-NUM1 FROM WRK-NUM2 GIVING WRK-RESULTADO


      *==================== MULTIPLY(MULTIPLICACAO)
      *    MULTIPLY WRK-NUM1 BY WRK-NUM2 GIVING WRK-RESULTADO.


      *==================== DIVIDE(DIVISAO)
      *    DIVIDE WRK-NUM1 BY WRK-NUM2 GIVING WRK-RESULTADO
      *         ON SIZE ERROR
      *            DISPLAY "ERRO - DIVISAO POR ZERO NAO PODE!"

      *==================== COMPUTE
           COMPUTE WRK-RESULTADO = (WRK-NUM1 + WRK-NUM2) / 2.



       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                        SECTION.

           MOVE WRK-RESULTADO TO WRK-RESULTADO-ED.
           DISPLAY WRK-RESULTADO-ED.

       0300-FINALIZAR-FIM. EXIT.
