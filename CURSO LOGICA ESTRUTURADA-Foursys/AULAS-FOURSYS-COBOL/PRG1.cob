       IDENTIFICATION                               DIVISION.
       PROGRAM-ID. PRG1.
      *======================================================
ALT1  *== PROGRAMADOR : WELLINGTON
..    *== OBJETIVO    : MULTIPLICACAO DE 2 NUMEROS
..    *== DATA        : 28/06/2024
..    *== CONSULTORIA : EDUC
..    *== ALTERACAO   :
ALT1  *======================================================

       ENVIRONMENT                                  DIVISION.
       CONFIGURATION                         SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      *-----------------------------------------------------------------
       DATA                                         DIVISION.
       WORKING-STORAGE                       SECTION.
           77 WRK-NUMERO1        PIC S9(03)V99 VALUE ZEROS.
           77 WRK-NUMERO2        PIC S9(03)V99 VALUE ZEROS.

           77 WRK-RESULTADO      PIC S9(06) VALUE ZEROS.
           77 WRK-RESULTADO-ED   PIC -ZZZ.ZZ9,99 VALUE ZEROS.

      *-----------------------------------------------------------------
       PROCEDURE                                    DIVISION.
       0001-PRINCIPAL                        SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.

      *-----------------------------------------------------------------
       0100-INICIAR                          SECTION.
           DISPLAY"DIGITE O PRIMEIRO NUMERO: "
             ACCEPT WRK-NUMERO1
           DISPLAY"DIGITE O SEGUNDO NUMERO: "
             ACCEPT WRK-NUMERO2

           COMPUTE WRK-RESULTADO = WRK-NUMERO1 * WRK-NUMERO2.
            MOVE WRK-RESULTADO TO WRK-RESULTADO-ED.

       0100-INICIAR-FIM. EXIT.


      *-----------------------------------------------------------------
       0200-PROCESSAR                        SECTION.
           DISPLAY"O RESULTADO DA MULTIPLICACAO:   "WRK-RESULTADO-ED.


       0200-PROCESSAR-FIM. EXIT.


      *-----------------------------------------------------------------
       0300-FINALIZAR                        SECTION.
           DISPLAY"=========================="
           DISPLAY"       FIM PROGRAMA".

       0300-FINALIZAR-FIM. EXIT.
