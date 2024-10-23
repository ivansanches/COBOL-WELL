       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. PRGCOB17.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
..    *== OBJETIVO    : COMANDO PERFORM
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
       77  WRK-NOTA1                           PIC 9(02)V99 VALUE ZEROS.
       77  WRK-NOTA2                           PIC 9(02)V99 VALUE ZEROS.
       77  WRK-MEDIA                           PIC 9(02)V99 VALUE ZEROS.


      *-----------------------------------------------------------------
       PROCEDURE                                 DIVISION.
       0001-PRINCIPAL                            SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIAR                              SECTION.
           DISPLAY "NOTA 1:"
               ACCEPT WRK-NOTA1
           DISPLAY "NOTA 2:"
               ACCEPT WRK-NOTA2.




       0100-INICIAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                            SECTION.
           COMPUTE WRK-MEDIA = (WRK-NOTA1 + WRK-NOTA2) / 2.

           EVALUATE TRUE

               WHEN WRK-MEDIA GREATER 10
                   DISPLAY "ENTRE COM NOTAS VALIDAS!"
               WHEN WRK-MEDIA GREATER 6
                   DISPLAY "APROVADO"
               WHEN OTHER
                   DISPLAY "REPROVADO"

           END-EVALUATE.

       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                            SECTION.

           DISPLAY "======== FIM PROGRAMA ========".



       0300-FINALIZAR-FIM. EXIT.
