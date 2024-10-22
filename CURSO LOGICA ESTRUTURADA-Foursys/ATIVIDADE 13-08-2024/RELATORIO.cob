       IDENTIFICATION                          DIVISION.
       PROGRAM-ID. RELATORIO.
      *=================================================================
      * PROGRAMA    : RELATORIO
      * PROGRAMADOR : WELLINGTON SOARES CORDEIRO
      * ANALISTA    : IVAN SANCHES
      * CONSULTORIA : FOURSYS
      * DATA........: XX / XX / XXXX
      *-----------------------------------------------------------------
      * OBJETIVO....: CRIACAO DE RELATORIO
      *
      *-----------------------------------------------------------------
      * ARQUIVOS                I/O                  INCLUDE/BOOK
      * CLIENTES1               INPUT                #BOOKMSG
      *
      *-----------------------------------------------------------------
      * MODULOS.....:
      *
      *-----------------------------------------------------------------
      * ALTERACOES...:
      *
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
           10 REG-CODIGO               PIC X(003).
           10 REG-NOME                 PIC X(020).
           10 REG-EMAIL                PIC X(020).
           10 REG-STREA                PIC X(010).
           10 REG-ASSINATURA           PIC 9(003)V99.

      *-----------------------------------------------------------------
       WORKING-STORAGE                         SECTION.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DA WORKING *****".
      *-----------------------------------------------------------------
      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** FILE SATUS DO ARQUIVO *****".
      *-----------------------------------------------------------------
       01  FS-CLIENTES1                PIC 9(002).

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS DE LINHA *****".
      *-----------------------------------------------------------------
       01  WRK-QT-LINHAS               PIC 9(002)          VALUE ZEROS.

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS DO CABECALHO *****".
      *-----------------------------------------------------------------
       01  WRK-CABEC1.
           05 FILLER         PIC X(020) VALUE SPACES.
           05 FILLER         PIC X(020) VALUE
           "LISTA DE CLIENTES".
           05 FILLER         PIC X(020) VALUE SPACES.

       01  WRK-CABEC2.
           05 FILLER         PIC X(004) VALUE "COD".
           05 FILLER         PIC X(021) VALUE "NOME".
           05 FILLER         PIC X(021) VALUE "EMAIL".
           05 FILLER         PIC X(011) VALUE "STREAMING".
           05 FILLER         PIC X(005) VALUE "VALOR".

       01  WRK-CABEC3.
           05 WRK-BRANCO     PIC X(80)  VALUE SPACES.

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS DETALHE *****".
      *-----------------------------------------------------------------

       01  WRK-DETALHE.
           05 WRK-DET-CODIGO    PIC 9(003)    VALUE ZEROS.
           05 FILLER            PIC X(001)    VALUE SPACES.
           05 WRK-DET-NOME      PIC X(020)    VALUE SPACES.
           05 FILLER            PIC X(001)    VALUE SPACES.
           05 WRK-DET-EMAIL     PIC X(020)    VALUE SPACES.
           05 FILLER            PIC X(001)    VALUE SPACES.
           05 WRK-DET-STRE      PIC X(010)    VALUE SPACES.
           05 FILLER            PIC X(001)    VALUE SPACES.
           05 WRK-DET-ASSI      PIC 9(003)V99 VALUE ZEROS.

      *-----------------------------------------------------------------
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
       0000-PRINCIPAL.

           PERFORM 0100-INICIAR.

           PERFORM 0120-TESTE-VAZIO.

           PERFORM 0200-PROCESSAR UNTIL FS-CLIENTES1 NOT EQUAL 00.

           PERFORM 0300-FINALIZAR.

       0000-PRINCIPAL-FIM.                        EXIT.

      *-----------------------------------------------------------------
       0100-INICIAR                               SECTION.
      *-----------------------------------------------------------------

           OPEN INPUT CLIENTES1.

       0100-INICIAR-FIM.                          EXIT.

      *-----------------------------------------------------------------
       0110-TESTE-EXISTE                          SECTION.
      *-----------------------------------------------------------------


           IF FS-CLIENTES1 NOT EQUAL 00
               MOVE WRK-ERRO-ABERTURA     TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES1          TO WRK-STATUS-ERRO
               MOVE "0110-TESTE-EXISTE"   TO WRK-AREA-ERRO
               MOVE WRK-CLIENTE           TO WRK-ARQUIVO-ERRO
               PERFORM 9999-MSG-ERROS
           END-IF.

       0110-TESTE-EXISTE-FIM.                    EXIT.

      *-----------------------------------------------------------------
       0120-TESTE-VAZIO                          SECTION.
      *-----------------------------------------------------------------

           PERFORM 0130-LER-DADOS

           IF FS-CLIENTES1 EQUAL 10
               MOVE WRK-ARQ-EXISTE        TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES1          TO WRK-STATUS-ERRo
               MOVE "0120-TESTE-VAZIO"    TO WRK-AREA-ERRO
               MOVE WRK-CLIENTE           TO WRK-ARQUIVO-ERRO
               PERFORM 9000-MSG-ERRO

           END-IF.

           PERFORM 0140-IMP-CABECALHO.

       0120-TESTE-VAZIO-FIM.                    EXIT.

      *-----------------------------------------------------------------
       0130-LER-DADOS                           SECTION.
      *-----------------------------------------------------------------

           READ CLIENTES1.

       0130-LER-DADOS-FIM.                      EXIT.

      *-----------------------------------------------------------------
       0140-IMP-CABECALHO                       SECTION.
      *-----------------------------------------------------------------

           DISPLAY WRK-CABEC3.
           DISPLAY WRK-CABEC1.
           DISPLAY WRK-CABEC2.
           DISPLAY WRK-CABEC3.

           MOVE 4 TO WRK-QT-LINHAS.

       0140-IMP-CABECALHO-FIM.                  EXIT.

      *-----------------------------------------------------------------
       0150-IMP-DETALHE                         SECTION.
      *-----------------------------------------------------------------

           MOVE REG-CODIGO      TO    WRK-DET-CODIGO
           MOVE REG-NOME        TO    WRK-DET-NOME
           MOVE REG-EMAIL       TO    WRK-DET-EMAIL
           MOVE REG-STREA       TO    WRK-DET-STRE
           MOVE REG-ASSINATURA  TO    WRK-DET-ASSI

               DISPLAY WRK-DETALHE.

           ADD 1 TO WRK-QT-LINHAS.

       0150-IMP-DETALHE-FIM.                    EXIT.

      *-----------------------------------------------------------------
       0200-PROCESSAR                           SECTION.
      *-----------------------------------------------------------------


           IF WRK-QT-LINHAS GREATER 12

               PERFORM 0140-IMP-CABECALHO

           END-IF

               PERFORM 0150-IMP-DETALHE.
               PERFORM 0130-LER-DADOS.

       0200-PROCESSAR-FIM.                      EXIT.


      *-----------------------------------------------------------------
       0300-FINALIZAR                           SECTION.
      *-----------------------------------------------------------------

           CLOSE CLIENTES1
           IF FS-CLIENTES1  NOT EQUAL 00
               MOVE WRK-ERRO-GRAVACAO     TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES1          TO WRK-STATUS-ERRO
               MOVE "0300-FINALIZAR"      TO WRK-AREA-ERRO
               MOVE WRK-CLIENTE           TO WRK-ARQUIVO-ERRO
               PERFORM 9000-MSG-ERRO
           END-IF.
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


       9000-MSG-ERRO-FIM.              EXIT.
      *-----------------------------------------------------------------
       9999-MSG-ERROS                  SECTION.
      *-----------------------------------------------------------------

           CLOSE CLIENTES1
           DISPLAY "*****PROGRAMA COM ERRO*****".
           DISPLAY "PROGRAMA..  : " WRK-PRG-ERRO.
           DISPLAY "MSG..       : " WRK-DESCRICAO-ERRO.
           DISPLAY "FILE STATUS.: " WRK-STATUS-ERRO.
           DISPLAY "AREA/SECAO .: " WRK-AREA-ERRO.
           DISPLAY "ARQUIVO ERRO: " WRK-ARQUIVO-ERRO.
           GOBACK.

       9999-MSG-ERROS-FIM.             EXIT.

      *-----------------------------------------------------------------
