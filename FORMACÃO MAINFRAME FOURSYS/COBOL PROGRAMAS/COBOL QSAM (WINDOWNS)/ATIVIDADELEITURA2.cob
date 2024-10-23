       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. ATIVIDADELEITURA2.
      *=================================================================
      *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
      *== OBJETIVO    : LEITURA E GRAVACAO
      *== DATA        : 21/07/2024
      *== CONSULTORIA : FOURSYS
      *=================================================================
      *=================== ESPECIFICACOES DE ARQUIVO ===================
      *    ARQUIVO                  TIPO                      BOOK
      *    LANCAN.txt               INPUT                     #MSGERRO
      *    REGCAN.txt               OUTPUT
      *
      *=================================================================
      *== ALTERACAO   :
      *== PROGRAMADOR :
      *== OBJETIVO    :
      *== DATA        : XX/XX/XXXX
      *== CONSULTORIA :
      *=================================================================

       ENVIRONMENT                               DIVISION.

       CONFIGURATION                             SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT                              SECTION.
       FILE-CONTROL.
           SELECT LANCAM ASSIGN TO "C:\ATIVIDADE\LANCAM.txt"
             FILE STATUS IS FS-LANCAM.

           SELECT REGCAM ASSIGN TO "C:\ATIVIDADE\REGCAM.txt"
             FILE STATUS IS FS-REGCAM.
      *-----------------------------------------------------------------

       DATA                                      DIVISION.
       FILE                                      SECTION.
       FD LANCAM.
       01  REG-LANCAM.
           05 REG-AGENCIA                  PIC  9(04).
           05 REG-CONTA                    PIC  9(05).
           05 REG-LANCAMENTO               PIC  9(08)V99.
           05 REG-GERENTE                  PIC  X(01).
           05 REG-TIPOCLIENTE              PIC  X(01).

       FD REGCAM.
       01  REG-REGCAM.
           05 RE-AGENCIA                   PIC  9(04).
           05 RE-CONTA                     PIC  9(05).
           05 RE-LANCAMENTO                PIC  9(08)V99.


       WORKING-STORAGE                           SECTION.
       01  FS-LANCAM                       PIC  9(02).
       01  FS-REGCAM                       PIC  9(02).

      *== VARIAVEIS DE APOIO
       01  WRK-SALDO                       PIC 9(20).

      *== VARIAVEIS DE MASCARA
       01  WRK-SALDO-ED                    PIC Z.ZZZ.ZZ9,99.
       01  WRK-ACUM-VALIDOS-ED             PIC Z9.
       01  WRK-ACUM-LIDOS-ED               PIC Z9.

      *== VARIAVEIS DE MENSAGEM
       COPY "#BOOKMSG".
       01  WRK-MSG-ERRO                    PIC  X(30).


      *== VARAIVEIS CONTADORES
       01  WRK-ACUM-LIDOS                  PIC  9(04)      VALUE ZEROS.
       01  WRK-ACUM-VALIDOS                PIC  9(04)      VALUE ZEROS.

      *== VARAIVEIS CONDICAO
       01  WRK-PASSOU                      PIC X(01)       VALUE SPACES.

      *-----------------------------------------------------------------

       PROCEDURE                                 DIVISION.
       0001-PRINCIPAL                            SECTION.

               PERFORM 0100-INICIALIZAR.
               PERFORM 0200-PROCESSAR UNTIL FS-LANCAM NOT EQUAL 00
               PERFORM 0300-FINALIZAR

           GOBACK.

       0001-PRINCIPAL-FIM.                        EXIT.

      *-----------------------------------------------------------------

       0100-INICIALIZAR                          SECTION.

           OPEN INPUT LANCAM
               OUTPUT REGCAM.

                   IF FS-LANCAM EQUAL 0
                       PERFORM 0110-LER-REGISTRO
                   ELSE
                       MOVE WRK-ABERTURA-ARQ TO WRK-MSG-ERRO
                       PERFORM 0120-MSG
                       GOBACK
                   END-IF.

       0100-INICIALIZAR-FIM.                      EXIT.

      *-----------------------------------------------------------------

       0110-LER-REGISTRO                         SECTION.

           READ LANCAM.
      *     IF FS-LANCAM NOT EQUAL 0 AND FS-LANCAM NOT EQUAL 10




       0110-LER-REGISTRO-FIM.                    EXIT.

      *-----------------------------------------------------------------

       0120-MSG                                  SECTION.

           DISPLAY WRK-MSG-ERRO.

       0120-TRATA-ERRO-FIM.                      EXIT.

      *-----------------------------------------------------------------

       0200-PROCESSAR                            SECTION.

                 ADD 1 TO WRK-ACUM-LIDOS
                 PERFORM 0210-VALIDA

                 MOVE REG-AGENCIA     TO RE-AGENCIA
                 MOVE REG-CONTA       TO RE-CONTA
                 MOVE REG-LANCAMENTO  TO RE-LANCAMENTO
                 WRITE REG-REGCAM

                 IF WRK-PASSOU EQUAL "S"

                     PERFORM 0220-SALDO-FINAL
                     ADD 1 TO WRK-ACUM-VALIDOS

                 END-IF

                     PERFORM 0110-LER-REGISTRO.

       0200-PROCESSAR-FIM.                       EXIT.

      *-----------------------------------------------------------------

       0210-VALIDA                               SECTION.

           IF REG-TIPOCLIENTE EQUAL "F" AND
              REG-GERENTE EQUAL "P"
               MOVE "S" TO WRK-PASSOU

           ELSE

               MOVE "N" TO WRK-PASSOU

           END-IF.

       0210-VALIDA-FIM.                          EXIT.

      *-----------------------------------------------------------------

       0220-SALDO-FINAL                          SECTION.

           COMPUTE WRK-SALDO  = WRK-SALDO + REG-LANCAMENTO.

       0220-SALDO-FINAL-FIM.                     EXIT.

      *-----------------------------------------------------------------

       0300-FINALIZAR                            SECTION.

           MOVE WRK-SALDO        TO WRK-SALDO-ED
           MOVE WRK-ACUM-LIDOS   TO WRK-ACUM-LIDOS-ED
           MOVE WRK-ACUM-VALIDOS TO WRK-ACUM-VALIDOS-ED

           DISPLAY "==== STATISTICA ===="
           DISPLAY "TOTAL DE REGISTROS LIDOS: " WRK-ACUM-LIDOS-ED
           DISPLAY "TOTAL DE REGISTROS VALIDOS: "WRK-ACUM-VALIDOS-ED
           DISPLAY "SALDO FINAL: $" WRK-SALDO-ED
           DISPLAY WRK-LINHA

           CLOSE LANCAM
           CLOSE REGCAM

           IF FS-LANCAM NOT EQUAL '00'
               MOVE  WRK-ERRO-LANCAM TO WRK-MSG-ERRO
               PERFORM 0120-MSG
           END-IF

           IF FS-REGCAM NOT EQUAL '00'
               MOVE  WRK-ERRO-REGCAM TO WRK-MSG-ERRO
               PERFORM 0120-MSG
           END-IF.


       0300-FINALIZAR-FIM.                        EXIT.

      *-----------------------------------------------------------------
