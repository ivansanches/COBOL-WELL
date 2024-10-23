       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. ATIVIDADELEITURA.
      *=================================================================
      *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
      *== OBJETIVO    : LEITURA DO ARQUIVO LANCAM.dat
      *== DATA        : 18/07/2024
      *== CONSULTORIA : FOURSYS
      *=================================================================
      *=================== ESPECIFICACOES DE ARQUIVO ===================
      *    ARQUIVO                  TIPO                      BOOK
      *    LANCAN.txt               INPUT                     #MSGERRO
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

       WORKING-STORAGE                           SECTION.
       01  FS-LANCAM                       PIC  9(02).

      *== VARIAVEL DE MASCARA
       01  WRK-LANCAMENTO-ED               PIC ZZ.ZZZ.ZZ9,99 VALUE ZERO.
       01  WRK-AGENCIA                     PIC  9(04).
       01  WRK-CONTA                       PIC  9(05).
       01  WRK-LANCAMENTO                  PIC  9(08)V99.
       01  WRK-GERENTE                     PIC  X(01).
       01  WRK-TIPOCLIENTE                 PIC  X(01).

      *== VARIAVEIS DE MENSAGEM
       01  WRK-MSG-ERRO                    PIC  X(30).
       01  WRK-ERRO-ABERTURA               PIC  X(30)      VALUE
           "ERRO NA ABERTURA DO ARQUIVO".
       01  WRK-FECHAMENTO-ARQ              PIC  X(30)      VALUE
           "ERRO NO FECHAMENTO".

      *== VARIAVEL DE LINHA
       01  WRK-LINHA                       PIC  X(40)      VALUE
           "=======================================".

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

           OPEN INPUT LANCAM.
                   IF FS-LANCAM EQUAL 0
                       PERFORM 0110-LER-REGISTRO
                   ELSE
                       MOVE WRK-ERRO-ABERTURA TO WRK-MSG-ERRO
                       PERFORM 0120-MSG
                       GOBACK
                   END-IF.

       0100-INICIALIZAR-FIM. EXIT.

      *-----------------------------------------------------------------

       0110-LER-REGISTRO                          SECTION.

           READ LANCAM.

       0110-LER-REGISTRO-FIM.EXIT.

      *-----------------------------------------------------------------

       0120-MSG                                  SECTION.

           DISPLAY WRK-MSG-ERRO.

       0120-TRATA-ERRO-FIM.                       EXIT.

      *-----------------------------------------------------------------

       0200-PROCESSAR                            SECTION.

                 ADD 1 TO WRK-ACUM-LIDOS
                 PERFORM 0210-VALIDA

                 MOVE REG-AGENCIA     TO WRK-AGENCIA
                 MOVE REG-CONTA       TO WRK-CONTA
                 MOVE REG-LANCAMENTO  TO WRK-LANCAMENTO-ED
                 MOVE REG-GERENTE     TO WRK-GERENTE
                 MOVE REG-TIPOCLIENTE TO WRK-TIPOCLIENTE

                 IF WRK-PASSOU EQUAL "S"
                     ADD 1 TO WRK-ACUM-VALIDOS
                     DISPLAY "AGENCIA...." WRK-AGENCIA
                     DISPLAY "CONTA.." WRK-CONTA
                     DISPLAY "LANCAMENTO.." WRK-LANCAMENTO-ED
                     DISPLAY "GERENTE.."WRK-GERENTE
                     DISPLAY "CLIENTE.."WRK-TIPOCLIENTE
                     DISPLAY WRK-LINHA
                 END-IF
                     PERFORM 0110-LER-REGISTRO.

       0200-PROCESSAR-FIM. EXIT.

      *-----------------------------------------------------------------

       0210-VALIDA                                SECTION.

           IF REG-TIPOCLIENTE EQUAL "F" AND
              REG-GERENTE EQUAL "P"
               MOVE "S" TO WRK-PASSOU

           ELSE

               MOVE "N" TO WRK-PASSOU

           END-IF.

       0210-VALIDA-FIM.EXIT.

      *-----------------------------------------------------------------

       0300-FINALIZAR                            SECTION.

           DISPLAY "==== STATISTICA ===="
               DISPLAY "TOTAL DE REGISTROS LIDOS:" WRK-ACUM-LIDOS
               DISPLAY "TOTAL DE REGISTROS VALIDOS:"WRK-ACUM-VALIDOS
           DISPLAY WRK-LINHA

           CLOSE LANCAM

           IF FS-LANCAM NOT EQUAL '00'
               MOVE  WRK-FECHAMENTO-ARQ TO WRK-MSG-ERRO
               PERFORM 0120-MSG
           END-IF.


       0300-FINALIZAR-FIM.                        EXIT.

      *-----------------------------------------------------------------
