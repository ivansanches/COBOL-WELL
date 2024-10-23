       IDENTIFICATION                               DIVISION.
       PROGRAM-ID. PRGCOB5.
      *======================================================
ALT1  *== PROGRAMADOR : WELLINGTON
..    *== OBJETIVO    : VARIAVEIS DE NIVEL(ESTRUTURAL) - FILLER
      *                 PARTE II
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
       01 WRK-DATA.
          05 WRK-ANO PIC X(04) VALUE SPACES.
          05 WRK-MES PIC X(02) VALUE SPACES.
          05 WRK-DIA PIC X(02) VALUE SPACES.

       01 WRK-DATA-ED.
          05 WRK-DIA PIC X(02) VALUE SPACES.
          05 FILLER  PIC X(01) VALUE "/".
          05 WRK-MES PIC X(02) VALUE SPACES.
          05 FILLER  PIC X(01) VALUE "/".
          05 WRK-ANO PIC X(04) VALUE SPACES.

      *-----------------------------------------------------------------
       PROCEDURE                                    DIVISION.
       0001-PRINCIPAL                        SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.

      *-----------------------------------------------------------------
       0100-INICIAR                          SECTION.

           ACCEPT WRK-DATA FROM DATE YYYYMMDD.
            MOVE CORR WRK-DATA TO WRK-DATA-ED.

       0100-INICIAR-FIM. EXIT.


      *-----------------------------------------------------------------
       0200-PROCESSAR                        SECTION.

           DISPLAY "DATA INTEIRA:"WRK-DATA
           DISPLAY WRK-DATA-ED.

       0200-PROCESSAR-FIM. EXIT.


      *-----------------------------------------------------------------
       0300-FINALIZAR                        SECTION.


       0300-FINALIZAR-FIM. EXIT.
