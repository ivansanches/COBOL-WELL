       IDENTIFICATION                               DIVISION.
       PROGRAM-ID. PRGCOB8.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON
..    *== OBJETIVO    : VARIAVEL ESTRUTURAL (GRUPO) - EXEMPLO
..    *== DATA        : 29/06/2024
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
       01 WRK-ENTRADA.
           05 WRK-CODIGO    PIC 9(04) VALUE ZEROS.
           05 WRK-NOME      PIC X(15) VALUE SPACES.
           05 WRK-SALARIO   PIC 9(06) VALUE ZEROS.

      *-----------------------------------------------------------------
       PROCEDURE                                    DIVISION.
       0001-PRINCIPAL                        SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIAR                          SECTION.

       0100-INICIAR-FIM. EXIT.
           DISPLAY"ENTRE COM OS DADOS:"
           ACCEPT WRK-ENTRADA.


      *-----------------------------------------------------------------
       0200-PROCESSAR                        SECTION.

           DISPLAY"CODIGO:"WRK-CODIGO
           DISPLAY"NOME:"WRK-NOME
           DISPLAY"SALARIO:"WRK-SALARIO.

       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                        SECTION.

       0300-FINALIZAR-FIM. EXIT.
