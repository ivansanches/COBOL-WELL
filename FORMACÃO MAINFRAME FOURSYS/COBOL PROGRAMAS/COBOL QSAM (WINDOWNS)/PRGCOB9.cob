       IDENTIFICATION                               DIVISION.
       PROGRAM-ID. PRGCOB9.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON
..    *== OBJETIVO    : OPERADORES ARITIMETICOS (SOMA - ADD)
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
       77 WRK-NUM1         PIC 9(04)  VALUE ZEROS.
       77 WRK-NUM2         PIC 9(04)  VALUE ZEROS.
       77 WRK-RESULTADO    PIC 9(05)  VALUE ZEROS.

       77 WRK-RESULTADO-ED PIC ZZ.ZZ9 VALUE ZEROS.


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
             ACCEPT WRK-NUM2
           ADD WRK-NUM1 WRK-NUM2 TO WRK-RESULTADO
           MOVE WRK-RESULTADO TO WRK-RESULTADO-ED.

       0100-INICIAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                        SECTION.
           DISPLAY"==== SOMA ==== "
           DISPLAY WRK-RESULTADO-ED.

       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                        SECTION.

       0300-FINALIZAR-FIM. EXIT.
