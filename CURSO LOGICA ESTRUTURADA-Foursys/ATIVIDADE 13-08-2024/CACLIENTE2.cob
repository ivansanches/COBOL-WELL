       IDENTIFICATION                          DIVISION.
       PROGRAM-ID. CACLIENTE2.
      *=================================================================
      * PROGRAMA    : RELATORIOV5
      * PROGRAMADOR : WELLINGTON SOARES CORDEIRO
      * ANALISTA    : IVAN SANCHES
      * CONSULTORIA : FOURSYS
      * DATA........: 07 / 08 / 2024
      *-----------------------------------------------------------------
      * OBJETIVO....: ARQUIVO PARA CRIACAO DO CLIENTES2.dat
      *                ORDENADO POR STREAMING
      *-----------------------------------------------------------------
      * ARQUIVOS:               I/O:                 INCLUDE/BOOK:
      * CLIENTES1               INPUT                #BOOKMSG
      * SAIDA                   OUTPUT
      *-----------------------------------------------------------------
      * MODULOS.....:
      *
      *=================================================================
      *-----------------------------------------------------------------
      * ALTERACOES..:
      *
      *=================================================================

      *=================================================================
       ENVIRONMENT                             DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       CONFIGURATION                           SECTION.
      *-----------------------------------------------------------------

       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      *-----------------------------------------------------------------
      *-----------------------------------------------------------------
       INPUT-OUTPUT                            SECTION.
      *-----------------------------------------------------------------
       FILE-CONTROL.
       SELECT CLIENTES1                        ASSIGN TO
                                           "C:\ATIVIDADE3\CLIENTES1.dat"
               FILE STATUS              IS FS-CLIENTES1.

       SELECT SAIDA                            ASSIGN TO
                                           "C:\ATIVIDADE3\CLIENTES2.dat"
               FILE STATUS              IS FS-SAIDA.

       SELECT WORK                             ASSIGN TO
                                           "C:\ATIVIDADE3\WORK.dat"
               FILE STATUS              IS FS-WORK.

      *=================================================================
       DATA                                    DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       FILE                                    SECTION.
      *-----------------------------------------------------------------
      *----------------------------------------------------------------*
      *     INPUT -  DADOS DO ARQUIVO DE ENTRADA (CLIENTES1)
      *                               LRECL = 058
      *----------------------------------------------------------------*
       FD  CLIENTES1.
       01  REG-CLIENTES.
           10 REG-CLIENTES-P1          PIC X(043).
           10 REG-CLIENTES-STREA       PIC X(010).
           10 REG-CLIENTES-P2          PIC 9(003)V99.
      *----------------------------------------------------------------*
      *     OUTPUT -  DADOS DO ARQUIVO DE ENTRADA (CLIENTES2)
      *                               LRECL = 058
      *----------------------------------------------------------------*
       FD  SAIDA.
       01  REG-SAIDA.
           10 REG-SAIDA-P1             PIC X(043).
           10 REG-SAIDA-STREA          PIC X(010).
           10 REG-SAIDA-P2             PIC 9(003)V99.

       SD  WORK.
       01  REG-WORK.
           10 REG-WORK-P1              PIC X(043).
           10 REG-WORK-STREA           PIC X(010).
           10 REG-WORK-P2              PIC 9(003)V99.


      *-----------------------------------------------------------------
       WORKING-STORAGE                         SECTION.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DA WORKING *****".
      *-----------------------------------------------------------------
      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** FILE SATUS DOS ARQUIVOS *****".
      *-----------------------------------------------------------------
       01  FS-CLIENTES1                PIC 9(002).
       01  FS-SAIDA                    PIC 9(002).
       01  FS-WORK                     PIC 9(002).

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS DE APOIO *****".
      *-----------------------------------------------------------------
       01  WRK-MODULO                  PIC X(079)          VALUE ZEROS.

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)        VALUES
           '*** AREA DE MENSAGENS DE ERRO ***'.
      *-----------------------------------------------------------------

       COPY "#BOOKMSG".
       01  WRK-MSG-ERROS.
           05  WRK-DESCRICAO-ERRO       PIC X(030)        VALUES SPACES.
           05  WRK-STATUS-ERRO          PIC 9(002)        VALUES ZEROS.
           05  WRK-PRG-ERRO             PIC X(009)        VALUES
               "RELATORIO".
           05  WRK-AREA-ERRO            PIC X(030)        VALUES SPACES.
           05  WRK-ARQUIVO-ERRO         PIC X(008)        VALUES SPACES.

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** FIM DA WORKING *****".
      *-----------------------------------------------------------------

      *=================================================================
       PROCEDURE                               DIVISION.
      *=================================================================

           SORT WORK ON ASCENDING KEY REG-WORK-STREA
           USING CLIENTES1 GIVING SAIDA.


       0000-PRINCIPAL.

           PERFORM 0100-INICIAR.

           PERFORM 0120-TESTE-VAZIO.

           PERFORM 0200-PROCESSAR UNTIL FS-CLIENTES1 NOT EQUAL 00.

           PERFORM 0300-FINALIZAR.

       0000-PRINCIPAL-FIM.                        EXIT.

      *-----------------------------------------------------------------
       0100-INICIAR                               SECTION.
      *-----------------------------------------------------------------

           OPEN INPUT CLIENTES1

           SORT WORK ON ASCENDING KEY REG-CLIENTES-STREA
           USING CLIENTES1 GIVING SAIDA.

           PERFORM 0110-TESTE-EXISTE.

       0100-INICIAR-FIM.                          EXIT.
      *-----------------------------------------------------------------
       0110-TESTE-EXISTE                          SECTION.
      *-----------------------------------------------------------------

           MOVE WRK-ERRO-ABERTURA     TO WRK-DESCRICAO-ERRO.
           MOVE FS-CLIENTES1          TO WRK-STATUS-ERRO.
           MOVE "0110-TESTE-EXISTE"   TO WRK-AREA-ERRO.
               MOVE WRK-CLIENTE       TO WRK-ARQUIVO-ERRO.

           PERFORM 0141-TESTAR-STATUS-CLIENTES.


       0110-TESTE-EXISTE-FIM.                    EXIT.

      *-----------------------------------------------------------------
       0120-TESTE-VAZIO                          SECTION.
      *-----------------------------------------------------------------

           MOVE WRK-ARQ-EXISTE        TO WRK-DESCRICAO-ERRO.
           MOVE FS-CLIENTES1          TO WRK-STATUS-ERRO.
           MOVE "0120-TESTE-VAZIO"    TO WRK-AREA-ERRO.
           MOVE WRK-CLIENTE           TO WRK-ARQUIVO-ERRO.

           PERFORM 0130-LER-DADOS
           PERFORM 0141-TESTAR-STATUS-CLIENTES.


       0120-TESTE-VAZIO-FIM.                    EXIT.
      *-----------------------------------------------------------------
       0130-LER-DADOS                           SECTION.
      *-----------------------------------------------------------------

           READ CLIENTES1.

       0130-LER-DADOS-FIM.                      EXIT.

      *-----------------------------------------------------------------
       0141-TESTAR-STATUS-CLIENTES              SECTION.
      *-----------------------------------------------------------------

           IF FS-CLIENTES1 EQUAL 10
               PERFORM 9999-MSG-ERROS
           END-IF.

       0141-TESTAR-STATUS-CLIENTE-FIM.           EXIT.

      *-----------------------------------------------------------------
       0200-PROCESSAR                            SECTION.
      *-----------------------------------------------------------------

               PERFORM 0130-LER-DADOS.

       0200-PROCESSAR-FIM.                      EXIT.


      *-----------------------------------------------------------------
       0300-FINALIZAR                           SECTION.
      *-----------------------------------------------------------------


           MOVE WRK-ERRO-GRAVACAO     TO WRK-DESCRICAO-ERRO
           MOVE "0300-FINALIZAR"      TO WRK-AREA-ERRO

           CLOSE CLIENTES1
               MOVE WRK-CLIENTE           TO WRK-ARQUIVO-ERRO
               MOVE FS-CLIENTES1          TO WRK-STATUS-ERRO
               PERFORM 0141-TESTAR-STATUS-CLIENTES.

           CLOSE SAIDA.
               MOVE WRK-SAIDA             TO WRK-ARQUIVO-ERRO
               MOVE FS-SAIDA              TO WRK-STATUS-ERRO


           GOBACK.

       0300-FINALIZAR-FIM.                      EXIT.



      *-----------------------------------------------------------------
       9000-MSG-ERRO                   SECTION.
      *-----------------------------------------------------------------

           DISPLAY "*****PROGRAMA COM ERRO*****".
           DISPLAY "PROGRAMA..  : " WRK-PRG-ERRO.
           DISPLAY "MSG..       : " WRK-DESCRICAO-ERRO.
           DISPLAY "FILE STATUS.: " WRK-STATUS-ERRO.
           DISPLAY "AREA/SECAO .: " WRK-AREA-ERRO.
           DISPLAY "ARQUIVO ERRO: " WRK-ARQUIVO-ERRO.

           MOVE WRK-MSG-ERROS TO WRK-MODULO.
           CALL "MODULO" USING WRK-MODULO.

       9000-MSG-ERRO-FIM.              EXIT.

      *-----------------------------------------------------------------
      *-----------------------------------------------------------------
       9999-MSG-ERROS                  SECTION.
      *-----------------------------------------------------------------

           CLOSE CLIENTES1
           CLOSE SAIDA
           DISPLAY "*****PROGRAMA COM ERRO*****".
           DISPLAY "PROGRAMA..  : " WRK-PRG-ERRO.
           DISPLAY "MSG..       : " WRK-DESCRICAO-ERRO.
           DISPLAY "FILE STATUS.: " WRK-STATUS-ERRO.
           DISPLAY "AREA/SECAO .: " WRK-AREA-ERRO.
           DISPLAY "ARQUIVO ERRO: " WRK-ARQUIVO-ERRO.

           MOVE WRK-MSG-ERROS TO WRK-MODULO
           CALL "MODULO" USING WRK-MODULO
           GOBACK.

       9999-MSG-ERROS-FIM.             EXIT.

      *-----------------------------------------------------------------
