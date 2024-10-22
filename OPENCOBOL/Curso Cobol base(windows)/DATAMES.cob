       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. DATAMES.
      *=================================================================
      *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
      *== OBJETIVO    : MODULO QUE DEVOLVE A DATA POR EXTENSO
      *== DATA        : 03/07/2024
      *== CONSULTORIA : FOURSYS
      *== ALTERACAO   :
      *=================================================================
       ENVIRONMENT                               DIVISION.
       CONFIGURATION                             SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      *-----------------------------------------------------------------

       DATA                                      DIVISION.
       WORKING-STORAGE                           SECTION.
       01  WRK-DATA.
           05 WRK-ANO                       PIC 9(04).
           05 WRK-MES                       PIC 9(02).
           05 WRK-DIA                       PIC 9(02).

       01  WRK-MESES.
           05 WRK-MES-EX                    PIC X(09) OCCURS 12 TIMES.
      *-----------------------------------------------------------------
       LINKAGE                                   SECTION.

       01  LNK-AREA.
           05 LNK-DATA PIC X(30).


      *-----------------------------------------------------------------
       PROCEDURE                                DIVISION
                                                USING LNK-AREA.

       0001-PRINCIPAL                           SECTION.

           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           GOBACK.


      *-----------------------------------------------------------------
       0100-INICIALIZAR                          SECTION.

           ACCEPT WRK-DATA FROM DATE YYYYMMDD.



       0100-INICIALIZAR-FIM. EXIT.




      *-----------------------------------------------------------------
       0200-PROCESSAR                           SECTION.

           PERFORM 0250-MOSTRA-MES.
           STRING " SAO PAULO, "         DELIMITED SIZE
                  WRK-DIA                DELIMITED SIZE
                  " DE "                 DELIMITED SIZE
                  WRK-MES-EX(WRK-MES)    DELIMITED SIZE
                  " DE "                 DELIMITED SIZE
                  WRK-ANO                DELIMITED SIZE
                  INTO LNK-DATA.


       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0250-MOSTRA-MES                          SECTION.
           MOVE "JANEIRO"   TO WRK-MES-EX(01).
           MOVE "FEVEREIRO" TO WRK-MES-EX(02).
           MOVE "MARCO"     TO WRK-MES-EX(03).
           MOVE "ABRIL"     TO WRK-MES-EX(04).
           MOVE "MEIO"      TO WRK-MES-EX(05).
           MOVE "JUNHO"     TO WRK-MES-EX(06).
           MOVE "JULHO"     TO WRK-MES-EX(07).
           MOVE "AGOSTO"    TO WRK-MES-EX(08).
           MOVE "SETEMBRO"  TO WRK-MES-EX(09).
           MOVE "OUTUBRO"   TO WRK-MES-EX(10).
           MOVE "NOVEMBRO"  TO WRK-MES-EX(11).
           MOVE "DEZEMBRO"  TO WRK-MES-EX(12).


       0300-FINALIZAR                           SECTION.

           DISPLAY "====== FIM PROGRAMA ======".

       0300-FINALIZAR-FIM. EXIT.
