       IDENTIFICATION                               DIVISION.
       PROGRAM-ID. PRGCOB14.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
..    *== OBJETIVO    : MEDIA ALUNO(IF)
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
       77 WRK-NOTA1    PIC 9(02)V99 VALUE ZEROS.
       77 WRK-NOTA2    PIC 9(02)V99 VALUE ZEROS.
       77 WRK-MEDIA    PIC 9(02)V99 VALUE ZEROS.

       77 WRK-MEDIA-ED PIC Z9,99 VALUE ZEROS.


      *-----------------------------------------------------------------
       PROCEDURE                                    DIVISION.
       0001-PRINCIPAL                        SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIAR                          SECTION.
           DISPLAY "DIGITE NOTA 1:"
             ACCEPT WRK-NOTA1

           DISPLAY "DIGITE NOTA 2:"
             ACCEPT WRK-NOTA2.




       0100-INICIAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                        SECTION.
           COMPUTE WRK-MEDIA = (WRK-NOTA1 + WRK-NOTA2) / 2.
           MOVE WRK-MEDIA TO WRK-MEDIA-ED.

           DISPLAY "======================"

           IF WRK-MEDIA GREATER 6
               DISPLAY "ALUNO APROVADO!"
           ELSE
               DISPLAY "ALUNO REPROVADO!"
           END-IF.




       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                        SECTION.

           DISPLAY "MEDIA FINAL:"WRK-MEDIA-ED.

       0300-FINALIZAR-FIM. EXIT.
