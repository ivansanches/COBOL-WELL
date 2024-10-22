       IDENTIFICATION                    DIVISION.
       PROGRAM-ID. PRGCOB4.
      *=====================================
      *== AUTOR: WELLINGTON SOARES CORDEIRO
      *== DATA: 27/06/2024
      *== OBJETIVO: VARIAVEIS (NUMERO POSITIVO E NEGATIVO)
      *== OBSERVACOES:
      *== EMPRESA: XPTO
      *======================================
       ENVIRONMENT                        DIVISION.
       CONFIGURATION                      SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA                               DIVISION.
       WORKING-STORAGE                    SECTION.

       77  WRK-VALOR1       PIC 9(03)V99        VALUE ZEROS.
       77  WRK-VALOR2       PIC 9(03)V99        VALUE ZEROS.
       77  WRK-RESULTADO    PIC S9(03)V99       VALUE ZEROS.


       PROCEDURE                          DIVISION.
       0100-RECEBE                        SECTION.
           DISPLAY "DIGITE VALOR1 :"
             ACCEPT WRK-VALOR1.
           DISPLAY "DIGITE VALOR2 :"
             ACCEPT WRK-VALOR2.
           COMPUTE WRK-RESULTADO = WRK-VALOR1 - WRK-VALOR2.

       0200-MOSTRA                        SECTION.
           DISPLAY "VALOR1: "      WRK-VALOR1.
           DISPLAY "VALOR2: "      WRK-VALOR2.
           DISPLAY "RESULTADO: "   WRK-RESULTADO.

           STOP RUN.
