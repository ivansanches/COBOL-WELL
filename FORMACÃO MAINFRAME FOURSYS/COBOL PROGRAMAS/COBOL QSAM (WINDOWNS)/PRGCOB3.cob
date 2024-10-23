       IDENTIFICATION                    DIVISION.
       PROGRAM-ID. PRGCOB3.
      *=====================================
      *== AUTOR: WELLINGTON SOARES CORDEIRO
      *== DATA: 27/06/2024
      *== OBJETIVO: VARIAVEIS (CASAS DECIMAIS)
      *== OBSERVACOES:
      *== EMPRESA: XPTO
      *======================================
       ENVIRONMENT                        DIVISION.
       CONFIGURATION                      SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA                               DIVISION.
       WORKING-STORAGE                    SECTION.

       77  WRK-NOME        PIC X(30)    VALUE SPACES.
       77  WRK-IDADE       PIC 9(03)    VALUE ZEROS.
       77  WRK-SALARIO     PIC 9(08)V99 VALUE ZEROS.


       PROCEDURE                          DIVISION.
       0100-RECEBE                        SECTION.
           DISPLAY "DIGITE SEU NOME:"
             ACCEPT WRK-NOME.
           DISPLAY "DIGITE SUA IDADE:"
             ACCEPT WRK-IDADE.
           DISPLAY "DIGITE SEU SALARIO:"
             ACCEPT WRK-SALARIO.

       0200-MOSTRA                        SECTION.
           DISPLAY "IDADE DIGITADA: "    WRK-IDADE.
           DISPLAY "NOME DIGITADO: "     WRK-NOME.
           DISPLAY "SALARIO DIGITADO: "  WRK-SALARIO.

           STOP RUN.
