       IDENTIFICATION                               DIVISION.
       PROGRAM-ID. PRGCOB5.
      *======================================================
ALT1  *== PROGRAMADOR : WELLINGTON
..    *== OBJETIVO    : MOVENDO DADOS ENTRE VARIAVEIS
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
           77 WRK-NUMERO0        PIC X(03) VALUE ZEROS.
           77 WRK-NUMERO1        PIC 9(03) VALUE ZEROS.
           77 WRK-NUMERO2        PIC 9(03) VALUE ZEROS.

           77 WRK-RESULTADO      PIC S9(06)V99 VALUE ZEROS.
           77 WRK-RESULTADO-ED   PIC Z.ZZ9,99 VALUE ZEROS.

      *-----------------------------------------------------------------
       PROCEDURE                                    DIVISION.
       0001-PRINCIPAL                        SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.

      *-----------------------------------------------------------------
       0100-INICIAR                          SECTION.
           DISPLAY"DIGITE O VALOR DO NUMERO 1: "
             ACCEPT WRK-NUMERO0
             MOVE WRK-NUMERO0 TO WRK-NUMERO1
           DISPLAY"DIGITE O VALOR DO NUMERO 2: "
             ACCEPT WRK-NUMERO2

           COMPUTE WRK-RESULTADO = WRK-NUMERO1 - WRK-NUMERO2.
            MOVE WRK-RESULTADO TO WRK-RESULTADO-ED.

       0100-INICIAR-FIM. EXIT.


      *-----------------------------------------------------------------
       0200-PROCESSAR                        SECTION.
           DISPLAY"O RESULTADO DA SUBTRACAO:"WRK-RESULTADO-ED.


       0200-PROCESSAR-FIM. EXIT.


      *-----------------------------------------------------------------
       0300-FINALIZAR                        SECTION.
           DISPLAY"=========================="
           DISPLAY"       FIM PROGRAMA".

       0300-FINALIZAR-FIM. EXIT.
