       IDENTIFICATION                   DIVISION.
       PROGRAM-ID.                      ATI4.
      *=================================================================
      * PROGRAMA   : ATI4
      * PROGRAMADOR: WELLINGTON SOARES CORDEIRO
      * ANALISTA   : IVAN SANCHES
      * CONSULTORIA: FOURSYS
      * DATA.......: 25/07/2024
      *-----------------------------------------------------------------
      * OBJETIVO...: LER ARQUIVO DE LANCAMENTOS E MOSTRAR VALIDOS
      *              E GRAVACAO DE DADOS EM ARQUIVO
      *-----------------------------------------------------------------
      * ARQUIVOS   :           TIPO:                  INCLUDE/BOOK:
      *  LANCAM                INPUT                  LANCAM
      *  REG-CAM               OUTPUT                 REGCAM
      *
      *-----------------------------------------------------------------
      * MODULOS....:
      *    LOGS(GRAVACAO DE ERROS DE EXECUCAO)       BOOK:
      *                                              LOGS
      *
      *-----------------------------------------------------------------
      * ALTERACOES.:
      *================================================================*

      *=================================================================
       ENVIRONMENT                      DIVISION.
      *================================================================*

      *-----------------------------------------------------------------
       CONFIGURATION                    SECTION.
      *-----------------------------------------------------------------

       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      *-----------------------------------------------------------------
       INPUT-OUTPUT                     SECTION.
      *-----------------------------------------------------------------

       FILE-CONTROL.
           SELECT LANCAM                ASSIGN TO
                                        "C:\ATIVIDADE3\ANCAM.txt"
               FILE STATUS              IS FS-LANCAM.

           SELECT REGCAM                ASSIGN TO
                                        "C:\ATIVIDADE3\REGCAM.txt"
               FILE STATUS              IS FS-REGCAM.

      *================================================================*
       DATA                             DIVISION.

      *================================================================*

      *-----------------------------------------------------------------
       FILE                             SECTION.
      *-----------------------------------------------------------------
      *----------------------------------------------------------------*
      *     INPUT -  DADOS DO ARQUIVO DE ENTRADA (LANCAM)
      *                               LRECL = 021
      *----------------------------------------------------------------*
       FD  LANCAM.
       COPY '#LANCAM'.

      *----------------------------------------------------------------*
      *     OUTPUT-  DADOS DO ARQUIVO DE SAIDA (REGCAM)
      *                               LRECL = 019
      *----------------------------------------------------------------*
       FD  REGCAM.
       COPY '#REGCAM'.

      *-----------------------------------------------------------------
       WORKING-STORAGE                  SECTION.
      *-----------------------------------------------------------------

      *----------------------------------------------------------------
       01  FILLER                       PIC X(050)        VALUES
           '*** INICIO DE WORKING ATI3 ***'.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)        VALUES
           '*** VARIAVEIS DO PROGRAMA ***'.
      *-----------------------------------------------------------------

       01  WRK-TOTAL-LANCAMENTO         PIC 9(010)V99     COMP-3.
       01  WRK-PASSOU                   PIC X(001)        VALUES SPACES.
       01  WRK-MODULO                   PIC X(078).

      *-----------------------------------------------------------------
       01    FILLER                     PIC X(050)        VALUES
           '*** AREA DE ACUMULADORES *** '.
      *-----------------------------------------------------------------

       01  ACU-VALIDOS-LANCAM          PIC 9(002) COMP-3  VALUES ZEROS.
       01  ACU-LIDOS-LANCAM            PIC 9(002) COMP-3  VALUES ZEROS.
       01  ACU-GRAVADOS-REGCAM         PIC 9(002) COMP-3  VALUES ZEROS.

      *-----------------------------------------------------------------
       01    FILLER                    PIC X(050)         VALUES
           '*** AREA DE VARIAVEIS DE MASCARA *** '.
      *-----------------------------------------------------------------

       01  WRK-TOTAL-LANCAMENTO-ED      PIC Z.ZZZ.ZZZ.ZZ9,99.

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(031)        VALUES
           '*** FILE STATUS DOS ARQUIVOS***'.
      *-----------------------------------------------------------------

       01  FS-LANCAM                    PIC 9(002)        VALUES ZEROS.
       01  FS-REGCAM                    PIC 9(002)        VALUES ZEROS.

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)        VALUES
           '*** VARIAVEIS DE ERRO ***'.
      *-----------------------------------------------------------------
       01  WRK-MSG-ERROS.
           05  WRK-DESCRICAO-ERRO       PIC X(030)        VALUES SPACES.
           05  WRK-STATUS-ERRO          PIC 9(002)        VALUES ZEROS.
           05  WRK-PRG-ERRO             PIC X(008)        VALUES
               "ATI4".
           05  WRK-AREA-ERRO            PIC X(030)        VALUES SPACES.
           05  WRK-ARQUIVO-ERRO         PIC X(008)        VALUES SPACES.

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)        VALUES
           '*** AREA DE MENSAGENS DE ERRO ***'.
      *-----------------------------------------------------------------

      *== BOOK MENSAGENS
       COPY "#BOOKMSG".
      *----------------------------------------------------------------
       01  FILLER                       PIC X(050)        VALUES
           '*** FIM  DE WORKING ATI3 ***'.
      *-----------------------------------------------------------------

      *================================================================*
       PROCEDURE                     DIVISION.
      *================================================================*

       0000-INICIO.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR    UNTIL FS-LANCAM EQUAL 10.
           PERFORM 0300-FINALIZAR.

       0000-FIM.

      *-----------------------------------------------------------------
       0100-INICIAR                  SECTION.
      *-----------------------------------------------------------------

           OPEN INPUT LANCAM
                OUTPUT REGCAM.

           PERFORM 0105-TESTE-STATUS


           PERFORM 0110-LER-REGISTRO.


       0100-INICIAR-FIM.             EXIT.

      *-----------------------------------------------------------------
       0105-TESTE-STATUS             SECTION.
      *-----------------------------------------------------------------

       0106-TESTE-LANCAM.

           IF FS-LANCAM  NOT EQUAL 00
               MOVE WRK-ERRO-ABERTURA   TO  WRK-DESCRICAO-ERRO
               MOVE FS-LANCAM           TO  WRK-STATUS-ERRO
               MOVE "0106-TESTE-LANCAM" TO WRK-AREA-ERRO
               MOVE WRK-LANCAM          TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATA-ERRO
           END-IF.

       0107-TESTE-REGCAM.
           IF FS-REGCAM  NOT EQUAL 00
               MOVE WRK-ERRO-ABERTURA   TO  WRK-DESCRICAO-ERRO
               MOVE FS-LANCAM           TO  WRK-STATUS-ERRO
               MOVE "0107-TESTE-REGCAM" TO WRK-AREA-ERRO
               MOVE WRK-REGCAM          TO WRK-ARQUIVO-ERRO
               PERFORM 0310-FINALIZAR-LANCAM
               PERFORM 9999-TRATA-ERRO
           END-IF.

       0105-TESTE-STATUS-FIM.        EXIT.

      *-----------------------------------------------------------------
       0110-LER-REGISTRO             SECTION.
      *-----------------------------------------------------------------
           READ LANCAM.
           IF FS-LANCAM EQUAL 00 OR FS-LANCAM EQUAL 10
               CONTINUE
           ELSE
               MOVE WRK-ERRO-LER        TO WRK-DESCRICAO-ERRO
               MOVE FS-LANCAM           TO WRK-STATUS-ERRO
               MOVE "0110-LER-REGISTRO" TO WRK-AREA-ERRO
               MOVE WRK-LANCAM          TO WRK-ARQUIVO-ERRO
               PERFORM 9000-MSG-ERRO
               GOBACK
           END-IF.

       0110-LER-REGISTRO-FIM.        EXIT.

      *-----------------------------------------------------------------
       0200-PROCESSAR                SECTION.
      *-----------------------------------------------------------------

           ADD 1                     TO ACU-LIDOS-LANCAM.

           PERFORM 0220-VALIDA.

           IF WRK-PASSOU             EQUAL "S"

               MOVE REG-AGENCIA      TO REG-AGENCIA-REGCAM
               MOVE REG-CONTA        TO REG-CONTA-REGCAM
               MOVE REG-LANCAMENTO   TO REG-LANCAMENTO-REGCAM
               PERFORM  0240-GRAVAR-ARQUIVO
               IF REG-REGCAM NOT EQUAL 00
                   PERFORM  0280-SOMA-LANCAMENTO
               ELSE
                  CONTINUE
               END-IF
               ADD 1                 TO ACU-VALIDOS-LANCAM
           END-IF

           PERFORM 0110-LER-REGISTRO

           IF FS-LANCAM EQUAL 10
               PERFORM 0210-STATISTICA
           END-IF.

       0200-FIM-PROCESSAR.           EXIT.

      *-----------------------------------------------------------------
       0210-STATISTICA                 SECTION.
      *-----------------------------------------------------------------

           MOVE WRK-TOTAL-LANCAMENTO  TO  WRK-TOTAL-LANCAMENTO-ED.
           DISPLAY "= REGISTROS LIDOS    : "ACU-LIDOS-LANCAM
           DISPLAY "= REGISTROS VALIDOS  : "ACU-VALIDOS-LANCAM
           DISPLAY "= REGISTROS GRAVADOS : "ACU-GRAVADOS-REGCAM
           DISPLAY "= TOTAL LANCAMENTO   :"WRK-TOTAL-LANCAMENTO-ED.
           DISPLAY WRK-LINHA.

       0210-STATISTICA-FIM.            EXIT.

      *-----------------------------------------------------------------
       0220-VALIDA                     SECTION.
      *-----------------------------------------------------------------

           IF REG-TIPO-CLIENTE EQUAL "F"
                                      AND REG-GERENTE EQUAL "P"
               MOVE "S"               TO WRK-PASSOU
           ELSE
               MOVE "N"               TO WRK-PASSOU
           END-IF.

       0220-VALIDA-FIM.                 EXIT.

      *-----------------------------------------------------------------
       0240-GRAVAR-ARQUIVO              SECTION.
      *-----------------------------------------------------------------

           WRITE REG-REGCAM.

           IF FS-REGCAM               NOT EQUAL '00'
               MOVE WRK-ERRO-GRAVACAO     TO WRK-DESCRICAO-ERRO
               MOVE FS-REGCAM             TO WRK-STATUS-ERRO
               MOVE "0240-GRAVAR-ARQUIVO" TO WRK-AREA-ERRO
               MOVE WRK-REGCAM            TO WRK-ARQUIVO-ERRO
               PERFORM 9000-MSG-ERRO
           ELSE

               ADD 1 TO ACU-GRAVADOS-REGCAM

           END-IF.

       0240-GRAVAR-ARQUIVO-FIM.       EXIT.

      *-----------------------------------------------------------------
       0280-SOMA-LANCAMENTO           SECTION.
      *-----------------------------------------------------------------

           ADD REG-LANCAMENTO         TO WRK-TOTAL-LANCAMENTO.

       0280-SOMA-LANCAMENTO-FIM.      EXIT.


      *-----------------------------------------------------------------
       0300-FINALIZAR                 SECTION.
      *-----------------------------------------------------------------

       0310-FINALIZAR-LANCAM.
           CLOSE LANCAM.
           IF FS-LANCAM               NOT EQUAL '00'
               MOVE WRK-ERRO-LANCAM         TO WRK-DESCRICAO-ERRO
               MOVE FS-LANCAM               TO WRK-STATUS-ERRO
               MOVE "0310-FINALIZAR-LANCAM" TO WRK-AREA-ERRO
               MOVE WRK-LANCAM          TO WRK-ARQUIVO-ERRO
               PERFORM 9000-MSG-ERRO
           END-IF.

       0320-FINALIZAR-REGCAM.
           CLOSE REGCAM.
           IF FS-REGCAM               NOT EQUAL '00'
               MOVE WRK-ERRO-REGCAM         TO WRK-DESCRICAO-ERRO
               MOVE FS-LANCAM               TO WRK-STATUS-ERRO
               MOVE "0320-FINALIZAR-REGCAM" TO WRK-AREA-ERRO
               MOVE WRK-REGCAM              TO WRK-ARQUIVO-ERRO
               PERFORM 9000-MSG-ERRO
           END-IF

           DISPLAY WRK-FIM-PRG
           STOP RUN.


       0300-FIM-FINALIZAR.             EXIT.

      *-----------------------------------------------------------------
       9000-MSG-ERRO                   SECTION.
      *-----------------------------------------------------------------

           DISPLAY "*****PROGRAMA COM ERRO*****".
           DISPLAY "PROGRAMA..  : " WRK-PRG-ERRO.
           DISPLAY "MSG..       : " WRK-DESCRICAO-ERRO.
           DISPLAY "FILE STATUS.: " WRK-STATUS-ERRO.
           DISPLAY "AREA/SECAO .: " WRK-AREA-ERRO.
           DISPLAY "ARQUIVO ERRO: " WRK-ARQUIVO-ERRO
           DISPLAY WRK-LINHA
           DISPLAY WRK-MSG-ERROS
           DISPLAY WRK-LINHA.


       9000-MSG-ERRO-FIM.              EXIT.

      *-----------------------------------------------------------------
       9999-TRATA-ERRO                 SECTION.
      *-----------------------------------------------------------------

           DISPLAY "*****PROGRAMA INTERROMPIDO*****".
           DISPLAY "PROGRAMA..  : " WRK-PRG-ERRO.
           DISPLAY "MSG..       : " WRK-DESCRICAO-ERRO.
           DISPLAY "FILE STATUS.: " WRK-STATUS-ERRO.
           DISPLAY "AREA/SECAO .: " WRK-AREA-ERRO.
           DISPLAY "ARQUIVO ERRO: " WRK-ARQUIVO-ERRO
           DISPLAY WRK-LINHA
           DISPLAY WRK-MSG-ERROS
           DISPLAY WRK-LINHA

           MOVE WRK-MSG-ERROS TO WRK-MODULO
           CALL "MODULO" USING WRK-MODULO
           GOBACK.

      *-----------------------------------------------------------------
       9999-TRATA-ERRO-FIM.            EXIT.
      *-----------------------------------------------------------------
