       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. PRGBUSCA.
      *=================================================================
      * PROGRAMA   : PRGBUSCA
      * PROGRAMADOR: WELLINGTON SOARES CORDEIRO
      * ANALISTA   : IVAN SANCHES
      * CONSULTORIA: FOURSYS
      * DATA.......: 26/07/2024
      *-----------------------------------------------------------------
      * OBJETIVO...: PROCURAR REGISTRO ERRO NO ARQUIVO LOGS
      *-----------------------------------------------------------------
      * ARQUIVOS   :           TIPO:                  INCLUDE/BOOK:
      *  LOGS                  INPUT                  #BOOKMSG
      *
      *-----------------------------------------------------------------
      * MODULOS....:
      *
      *-----------------------------------------------------------------
      * ALTERACOES.:
      *
      *=================================================================
       ENVIRONMENT                               DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       CONFIGURATION                             SECTION.
      *-----------------------------------------------------------------
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *-----------------------------------------------------------------
       INPUT-OUTPUT                              SECTION.
      *-----------------------------------------------------------------
       FILE-CONTROL.
           SELECT LOGS ASSIGN
           TO "C:\ATIVIDADE3\LOGS.txt"
             FILE STATUS IS FS-LOGS.
      *-----------------------------------------------------------------

      *=================================================================
       DATA                                      DIVISION.
      *=================================================================
      *-----------------------------------------------------------------
       FILE                                      SECTION.
      *-----------------------------------------------------------------


      *----------------------------------------------------------------*
      *     INPUT -  DADOS DO ARQUIVO DE ENTRADA (LOGS)
      *                               LRECL = 086
      *----------------------------------------------------------------*
       FD LOGS.
       01 REG-LOGS.
           05  LOG-DESCRICAO-ERRO       PIC X(030)        VALUES SPACES.
           05  LOG-STATUS-ERRO          PIC 9(002)        VALUES ZEROS.
           05  LOG-PRG-ERRO             PIC X(008)        VALUES SPACES.
           05  LOG-AREA-ERRO            PIC X(030)        VALUES SPACES.
           05  LOG-ARQUIVO-ERRO         PIC X(008)        VALUES SPACES.
           05  LOG-DATA                 PIC 9(008)        VALUES ZEROS.

      *-----------------------------------------------------------------
       WORKING-STORAGE                           SECTION.
      *-----------------------------------------------------------------
      *-----------------------------------------------------------------
       01  FILLER                       PIC X(031)        VALUES
           '*** INICIO AREA DE WORKING ***'.
      *-----------------------------------------------------------------
       01  FILLER                       PIC X(031)        VALUES
           '*** FILE STATUS DOS ARQUIVOS***'.
      *-----------------------------------------------------------------

       77  FS-LOGS                      PIC 9(002).


      *-----------------------------------------------------------------
       01    FILLER                     PIC X(050)        VALUES
           '*** VARIAVEIS ACUMULADORES *** '.
      *-----------------------------------------------------------------

       01  ACU-OCORRENCIA               PIC 9(003) COMP-3 VALUES ZEROS.
       01  ACU-LIDOS                    PIC 9(003) COMP-3 VALUES ZEROS.
      *-----------------------------------------------------------------

       01    FILLER                     PIC X(050)        VALUES
           '*** VARIAVEIS DE CONSULTA *** '.
      *-----------------------------------------------------------------

       01  WRK-CONSULTA                PIC X(008).

      *-----------------------------------------------------------------

       01    FILLER                     PIC X(050)        VALUES
           '*** VARIAVEIS DE MENSAGEM *** '.
      *-----------------------------------------------------------------

       01  WRK-MSGERRO                 PIC X(080).

      *== BOOK DE MENSAGENS ERRO
       COPY "#BOOKMSG".

      *-----------------------------------------------------------------
       01    FILLER                     PIC X(050)        VALUES
           '*** FIM AREA DE WORKING *** '.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
      *=================================================================
       PROCEDURE                                 DIVISION.
      *=================================================================
      *-----------------------------------------------------------------
       0001-PRINCIPAL                            SECTION.
      *-----------------------------------------------------------------

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR UNTIL FS-LOGS NOT EQUAL 00.
           PERFORM 0300-FINALIZAR.

      *-----------------------------------------------------------------
       0100-INICIAR                              SECTION.
      *-----------------------------------------------------------------
           OPEN INPUT LOGS.
           PERFORM 0110-TESTE-EXISTE.

           READ LOGS.
           PERFORM 0120-TESTE-VAZIO.


           DISPLAY "QUAL O PROGRAMA QUE DESEJA CONSULTAR?"
           ACCEPT WRK-CONSULTA.
           DISPLAY WRK-LINHA.

           IF WRK-CONSULTA EQUAL LOG-PRG-ERRO
              DISPLAY "HISTORICO DE ERRO DO PROGRAMA: "WRK-CONSULTA
              DISPLAY WRK-LINHA
              PERFORM 0200-PROCESSAR
           ELSE
               MOVE WRK-PRGS-ERRO TO WRK-MSGERRO
               DISPLAY WRK-MSGERRO
               PERFORM 0200-PROCESSAR
           END-IF.


       0100-INICIAR-FIM. EXIT.
      *-----------------------------------------------------------------
       0110-TESTE-EXISTE                          SECTION.
      *-----------------------------------------------------------------

           IF FS-LOGS NOT EQUAL 00
               MOVE WRK-ERRO-ABERTURA TO WRK-MSGERRO
               DISPLAY WRK-MSGERRO
               CLOSE LOGS
               GOBACK
           END-IF.

       0110-TESTE-EXISTE-FIM. EXIT.

      *-----------------------------------------------------------------
       0120-TESTE-VAZIO                          SECTION.
      *-----------------------------------------------------------------
           IF FS-LOGS EQUAL 10
               MOVE WRK-ARQ-EXISTE TO WRK-MSGERRO
               DISPLAY WRK-MSGERRO
               PERFORM 0300-FINALIZAR
           END-IF.

       0110-TESTE-VAZIO-FIM.  EXIT.

      *-----------------------------------------------------------------
       0200-PROCESSAR                            SECTION.
      *-----------------------------------------------------------------

           IF WRK-CONSULTA EQUAL LOG-PRG-ERRO
           ADD 1 TO ACU-OCORRENCIA
           DISPLAY REG-LOGS
           END-IF.
           ADD 1 TO ACU-LIDOS.
           READ LOGS.

       0200-PROCESSAR-FIM. EXIT.


      *-----------------------------------------------------------------
       0300-FINALIZAR                            SECTION.
      *-----------------------------------------------------------------

           CLOSE LOGS.
           IF FS-LOGS NOT EQUAL 00
                  MOVE WRK-ERRO-FECHA TO WRK-MSGERRO
                  DISPLAY WRK-MSGERRO
                  GOBACK
           ELSE
               DISPLAY WRK-LINHA
               DISPLAY"TOTAL DE OCORRENCIAS ENCONTRADOS: "ACU-OCORRENCIA
               DISPLAY"TOTAL DE REGISTROS LIDOS        : "ACU-LIDOS
               DISPLAY WRK-LINHA
               DISPLAY WRK-FIM-PRG
               GOBACK
           END-IF.

       0300-FINALIZAR-FIM. EXIT.
      *-----------------------------------------------------------------
