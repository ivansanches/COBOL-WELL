       IDENTIFICATION                          DIVISION.
       PROGRAM-ID. RELATORIOV5.
      *=================================================================
      * PROGRAMA    : RELATORIOV5
      * PROGRAMADOR : WELLINGTON SOARES CORDEIRO
      * ANALISTA    : IVAN SANCHES
      * CONSULTORIA : FOURSYS
      * DATA........: 07 / 08 / 2024
      *-----------------------------------------------------------------
      * OBJETIVO....: GRAVACAO DE RELATORIO NO ARQUIVO RELAT2.txt
      *               ORDENANDO POR STREAMING
      *
      *-----------------------------------------------------------------
      * ARQUIVOS:               I/O:                 INCLUDE/BOOK:
      * CLIENTES2               INPUT                #BOOKMSG
      * RELAT                   OUTPUT
      *-----------------------------------------------------------------
      * MODULOS.....:
      *
      *=================================================================
      *-----------------------------------------------------------------
      *                     ALTERACOES DO PROGRAMA
      *-----------------------------------------------------------------
      * ALTERACOES...:
ALT1  * PROGRAMADOR..: WELLINGTON SOARES CORDEIRO
.     * ANALISTA.....: IVAN SANCHES
.     * CONSULTORIA..: FOURSYS
.     * DATA.........: 31/07/2024
.     *-----------------------------------------------------------------
ALT1  * OBJETIVO.....: IMPLEMENTACAO DA PAGINA NO RELATORIO

      *-----------------------------------------------------------------
      *                     ALTERACOES DO PROGRAMA
      *-----------------------------------------------------------------
ALT2  * PROGRAMADOR..: WELLINGTON SOARES CORDEIRO
.     * ANALISTA.....: IVAN SANCHES
.     * CONSULTORIA..: FOURSYS
.     * DATA.........: 31/07/2024
.     * OBJETIVO.....: IMPLEMENTACAO DE UM CONTADOR DE
ALT2  *                TOTAL DE REGISTRO LIDOS
      *-----------------------------------------------------------------
      *                     ALTERACOES DO PROGRAMA
      *-----------------------------------------------------------------
      * ALTERACOES...:
ALT3  * PROGRAMADOR..: WELLINGTON SOARES CORDEIRO
.     * ANALISTA.....: IVAN SANCHES
.     * CONSULTORIA..: FOURSYS
.     * DATA.........: 02/08/2024
.     *-----------------------------------------------------------------
ALT3  * OBJETIVO.....: GRAVAR RELATORIO EM OUTRO ARQUIVO
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
       SELECT CLIENTES2                        ASSIGN TO
                                           "C:\ATIVIDADE3\CLIENTES2.dat"
               FILE STATUS              IS FS-CLIENTES2.

ALT3   SELECT RELAT                            ASSIGN TO
ALT3                                       "C:\ATIVIDADE3\RELAT2.dat"
ALT3           FILE STATUS              IS FS-RELAT.

      *=================================================================
       DATA                                    DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       FILE                                    SECTION.
      *-----------------------------------------------------------------
      *----------------------------------------------------------------*
      *     INPUT -  DADOS DO ARQUIVO DE ENTRADA (CLIENTES2)
      *                               LRECL = 058
      *----------------------------------------------------------------*
       FD  CLIENTES2.
       01  REG-CLIENTES.
           10 REG-CODIGO               PIC X(003).
           10 REG-NOME                 PIC X(020).
           10 REG-EMAIL                PIC X(020).
           10 REG-STREA                PIC X(010).
           10 REG-ASSINATURA           PIC 9(003)V99.

       FD  RELAT.
ALT3   01  REG-RELAT                   PIC X(068).

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
       01  FS-CLIENTES2                PIC 9(002).
ALT3   01  FS-RELAT                    PIC 9(002).

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS DE LINHA *****".
      *-----------------------------------------------------------------
       01  WRK-QT-LINHAS               PIC 9(003)          VALUE ZEROS.
       01  WRK-PAGINA                  PIC 9(003)  COMP-3  VALUE ZEROS.
      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS CONTADOR *****".
      *-----------------------------------------------------------------
ALT2   01  ACU-QTD-LIDOS               PIC 9(002)  COMP-3  VALUE ZEROS.

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS DO CABECALHO *****".
      *-----------------------------------------------------------------
       01  WRK-CABEC1.
           05 FILLER                   PIC X(020) VALUE SPACES.
           05 FILLER                   PIC X(020) VALUE
           "LISTA DE CLIENTES".
           05 FILLER                   PIC X(020) VALUE SPACES.
ALT2       05 FILLER                   PIC X(005) VALUE "PAG: ".
ALT2       05 WRK-PAG                  PIC 9(003) VALUE 1.

       01  WRK-CABEC2.
           05 FILLER                   PIC X(004) VALUE "COD".
           05 FILLER                   PIC X(021) VALUE "NOME".
           05 FILLER                   PIC X(021) VALUE "EMAIL".
           05 FILLER                   PIC X(011) VALUE "STREAMING".
           05 FILLER                   PIC X(005) VALUE "VALOR".

       01  WRK-CABEC3.
           05 WRK-BRANCO               PIC X(80)  VALUE SPACES.

       01  WRK-CABEC4.
           05 FILLER                   PIC X(026) VALUE
           "VALOR TOTAL DO STREAMING:".
           05  WRK-STREAMING           PIC X(027)   VALUE SPACES.
           05 WRK-ASSI-ED              PIC ZZ.ZZ9,99.

       01  WRK-CABEC5.
           05 FILLER                   PIC X(053) VALUE
           "VALOR TOTAL DO RELATORIO:".
           05 WRK-VALOR-TOTAL-ED       PIC ZZ.ZZ9,99.

       01  WRK-CABEC6.
           05 FILLER                   PIC X(068) VALUE ALL "-".

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS DE MASCARA *****".
      *-----------------------------------------------------------------
       01  WRK-ASSIS                   PIC 9(004)V99 COMP-3 VALUE ZEROS.

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS DE APOIO *****".
      *-----------------------------------------------------------------
ALT2   01  WRK-PAG-AUX                 PIC 9(003) COMP-3   VALUE 1.
       01  WRK-MODULO                  PIC X(079)          VALUE ZEROS.
       01  WRK-VALOR-ASSI              PIC 9(004)V99       VALUE ZEROS.
       01  WRK-TOTAL-COMPLETO          PIC 9(004)V99       VALUE ZEROS.

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS DETALHE *****".
      *-----------------------------------------------------------------

       01  WRK-DETALHE.
           05 WRK-DET-CODIGO           PIC 9(003)    VALUE ZEROS.
           05 FILLER                   PIC X(001)    VALUE SPACES.
           05 WRK-DET-NOME             PIC X(020)    VALUE SPACES.
           05 FILLER                   PIC X(001)    VALUE SPACES.
           05 WRK-DET-EMAIL            PIC X(020)    VALUE SPACES.
           05 FILLER                   PIC X(001)    VALUE SPACES.
           05 WRK-DET-STRE             PIC X(010)    VALUE SPACES.
           05 FILLER                   PIC X(001)    VALUE SPACES.
           05 WRK-DET-ASSI             PIC Z.ZZ9,99    VALUE ZEROS.

      *-----------------------------------------------------------------
       01  FILLER                      PIC X(050)          VALUE
           "***** INICIO DAS VARIAVEIS MASCARA *****".
      *-----------------------------------------------------------------
       01  WRK-VALOR-TOTAL             PIC 9(004)V99      VALUE ZEROS.
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
       01  FILLER                       PIC X(050)          VALUE
           "***** FIM DA WORKING *****".
      *-----------------------------------------------------------------

      *=================================================================
       PROCEDURE                               DIVISION.
      *=================================================================
       0000-PRINCIPAL.

           PERFORM 0100-INICIAR.

           PERFORM 0120-TESTE-VAZIO.

           PERFORM 0200-PROCESSAR UNTIL FS-CLIENTES2 NOT EQUAL 00.

           PERFORM 0300-FINALIZAR.

       0000-PRINCIPAL-FIM.                        EXIT.

      *-----------------------------------------------------------------
       0100-INICIAR                               SECTION.
      *-----------------------------------------------------------------

           OPEN INPUT CLIENTES2
ALT3            OUTPUT RELAT.

           PERFORM 0110-TESTE-EXISTE.

       0100-INICIAR-FIM.                          EXIT.
      *-----------------------------------------------------------------
       0110-TESTE-EXISTE                          SECTION.
      *-----------------------------------------------------------------

           MOVE WRK-ERRO-ABERTURA     TO WRK-DESCRICAO-ERRO.
           MOVE FS-CLIENTES2          TO WRK-STATUS-ERRO.
           MOVE "0110-TESTE-EXISTE"   TO WRK-AREA-ERRO.
               MOVE WRK-CLIENTE       TO WRK-ARQUIVO-ERRO.

           PERFORM 0141-TESTAR-STATUS-CLIENTES.


       0110-TESTE-EXISTE-FIM.                    EXIT.

      *-----------------------------------------------------------------
       0120-TESTE-VAZIO                          SECTION.
      *-----------------------------------------------------------------

           MOVE WRK-ARQ-EXISTE        TO WRK-DESCRICAO-ERRO.
           MOVE FS-CLIENTES2          TO WRK-STATUS-ERRO.
           MOVE "0120-TESTE-VAZIO"    TO WRK-AREA-ERRO.
           MOVE WRK-CLIENTE           TO WRK-ARQUIVO-ERRO.

           PERFORM 0130-LER-DADOS
           PERFORM 0141-TESTAR-STATUS-CLIENTES.

ALT1       MOVE WRK-PAG-AUX TO WRK-PAG.
               PERFORM 0140-IMP-CABECALHO.



       0120-TESTE-VAZIO-FIM.                    EXIT.
      *-----------------------------------------------------------------
       0130-LER-DADOS                           SECTION.
      *-----------------------------------------------------------------

           READ CLIENTES2.

       0130-LER-DADOS-FIM.                      EXIT.

      *-----------------------------------------------------------------
       0140-IMP-CABECALHO                       SECTION.
      *-----------------------------------------------------------------

           IF WRK-PAG GREATER 1
                  MOVE WRK-CABEC3     TO REG-RELAT
                       WRITE REG-RELAT AFTER PAGE
           END-IF.

ALT3       MOVE WRK-CABEC1     TO REG-RELAT.
ALT3           WRITE REG-RELAT AFTER 1 LINE.

ALT3       MOVE WRK-CABEC2     TO REG-RELAT.
ALT3           WRITE REG-RELAT AFTER 1 LINE.

ALT3

      *     MOVE 4              TO WRK-QT-LINHAS.

ALT1  *     MOVE WRK-PAG        TO WRK-PAG-AUX.

           MOVE REG-STREA      TO WRK-STREAMING.

ALT1       ADD 1               TO WRK-PAG.



       0140-IMP-CABECALHO-FIM.                  EXIT.

      *-----------------------------------------------------------------
       0141-TESTAR-STATUS-CLIENTES              SECTION.
      *-----------------------------------------------------------------

           IF FS-CLIENTES2 NOT EQUAL 00
               PERFORM 9999-MSG-ERROS
           END-IF.

       0141-TESTAR-STATUS-CLIENTE-FIM.           EXIT.

      *-----------------------------------------------------------------
       0142-TESTAR-STATUS-RELAT                  SECTION.
      *-----------------------------------------------------------------

           IF FS-RELAT NOT EQUAL 00
               PERFORM  9999-MSG-ERROS
           END-IF.

       0142-TESTAR-STATUS-RELAT-FIM.             EXIT.


      *-----------------------------------------------------------------
       0150-IMP-DETALHE                          SECTION.
      *-----------------------------------------------------------------



           MOVE REG-CODIGO      TO    WRK-DET-CODIGO
           MOVE REG-NOME        TO    WRK-DET-NOME
           MOVE REG-EMAIL       TO    WRK-DET-EMAIL
           MOVE REG-STREA       TO    WRK-DET-STRE
           MOVE REG-ASSINATURA  TO    WRK-DET-ASSI

ALT3       MOVE WRK-DETALHE     TO    REG-RELAT.
ALT3           WRITE REG-RELAT AFTER 1 LINE.

           ADD 1 TO WRK-QT-LINHAS.


       0150-IMP-DETALHE-FIM.                     EXIT.

      *-----------------------------------------------------------------
       0200-PROCESSAR                            SECTION.
      *-----------------------------------------------------------------

           MOVE REG-ASSINATURA TO WRK-VALOR-ASSI.

      *     ADD 1 TO WRK-QT-LINHAS.
ALT2       ADD 1 TO ACU-QTD-LIDOS.

           IF REG-STREA NOT EQUAL WRK-STREAMING

               PERFORM 0210-IMP-VALOR
               PERFORM 0140-IMP-CABECALHO

           END-IF.

           COMPUTE WRK-ASSIS   = WRK-ASSIS + WRK-VALOR-ASSI.

      *     ADD REG-ASSINATURA TO WRK-TOTAL-COMPLETO.

           PERFORM 0150-IMP-DETALHE.


           IF WRK-QT-LINHAS EQUAL 13
      *        PERFORM 0210-IMP-VALOR
               PERFORM 0140-IMP-CABECALHO
               MOVE ZEROS TO WRK-QT-LINHAS
      *         PERFORM 0150-IMP-DETALHE
               ADD 1 TO WRK-PAGINA

           END-IF.

      *         MOVE REG-STREA TO WRK-STREAMING

               PERFORM 0130-LER-DADOS.

       0200-PROCESSAR-FIM.                      EXIT.
      *-----------------------------------------------------------------
       0210-IMP-VALOR                           SECTION.
      *-----------------------------------------------------------------



           MOVE WRK-ASSIS                 TO WRK-ASSI-ED.

           ADD WRK-ASSIS                  TO WRK-TOTAL-COMPLETO.
           MOVE WRK-TOTAL-COMPLETO        TO WRK-VALOR-TOTAL-ED

           MOVE WRK-CABEC4                TO REG-RELAT.
               WRITE REG-RELAT AFTER 1 LINE.


           MOVE ZEROS TO WRK-ASSIS.

           MOVE 0 TO WRK-QT-LINHAS.



       0210-IMP-VALOR-FIM.                  EXIT.

      *-----------------------------------------------------------------
       0300-FINALIZAR                           SECTION.
      *-----------------------------------------------------------------

           IF ACU-QTD-LIDOS GREATER 00

               DISPLAY WRK-LINHA
ALT2           DISPLAY "TOTAL DE REGISTROS LIDOS:"ACU-QTD-LIDOS
               DISPLAY WRK-LINHA
      *     IF WRK-QT-LINHAS LESS  13

               PERFORM 0210-IMP-VALOR
               MOVE WRK-CABEC6                TO REG-RELAT
               WRITE REG-RELAT AFTER 1 LINE
               MOVE WRK-CABEC5                TO REG-RELAT
               WRITE REG-RELAT AFTER 1 LINE

      *     END-IF

           END-IF.



           MOVE WRK-ERRO-GRAVACAO     TO WRK-DESCRICAO-ERRO
           MOVE "0300-FINALIZAR"      TO WRK-AREA-ERRO

           CLOSE CLIENTES2
               MOVE WRK-CLIENTE           TO WRK-ARQUIVO-ERRO
               MOVE FS-CLIENTES2          TO WRK-STATUS-ERRO
               PERFORM 0141-TESTAR-STATUS-CLIENTES.

ALT3       CLOSE RELAT
               MOVE WRK-RELAT             TO WRK-ARQUIVO-ERRO
               MOVE FS-RELAT              TO WRK-STATUS-ERRO
               PERFORM 0142-TESTAR-STATUS-RELAT.




           MOVE  WRK-VALOR-TOTAL TO WRK-VALOR-TOTAL-ED

           MOVE WRK-ASSIS TO WRK-ASSI-ED


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

           CLOSE CLIENTES2
           CLOSE RELAT
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
