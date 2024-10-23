       IDENTIFICATION                               DIVISION.
       PROGRAM-ID. PRGCOB23.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON
..    *== OBJETIVO    :
..    *== DATA        : 08/07/2024
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
       COPY  "#BOOKDATA".

      *-----------------------------------------------------------------
       PROCEDURE                                    DIVISION.
       0001-PRINCIPAL                        SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIAR                          SECTION.

           DISPLAY"ENTRE COM OS DADOS:"
           ACCEPT WRK-ENTRADA.

       0100-INICIAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                        SECTION.

           DISPLAY"CODIGO:"WRK-CODIGO
           DISPLAY"NOME:"WRK-NOME
           DISPLAY"SALARIO:"WRK-SALARIO.

       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                        SECTION.

       0300-FINALIZAR-FIM. EXIT.
