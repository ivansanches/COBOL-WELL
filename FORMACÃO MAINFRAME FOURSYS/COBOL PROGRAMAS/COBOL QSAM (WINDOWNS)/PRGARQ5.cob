       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. PRGARQ5.
      *=================================================================
      *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
      *== OBJETIVO    : INCLUSAO DE 1 REGISTRO ARQUIVO CLIENTES.dat
      *== DATA        : 12/07/2024
      *== CONSULTORIA : FOURSYS
      *=================================================================
      *== ALTERACAO   :
      *=================================================================
       ENVIRONMENT                               DIVISION.

       CONFIGURATION                             SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT                              SECTION.
       FILE-CONTROL.
           SELECT CLIENTES ASSIGN
           TO "C:\COBOL\Cobol Windows-BANCO DE DADOS\DADOS\CLIENTES.dat"
                                   FILE STATUS IS FS-CLIENTES.
      *-----------------------------------------------------------------

       DATA                                      DIVISION.
       FILE                                      SECTION.
       FD CLIENTES.
       01  REG-CLIENTES.
           05 REG-ID                     PIC 9(04).
           05 REG-NOME                   PIC X(20).
           05 REG-TELEFONE               PIC 9(11).

       WORKING-STORAGE                           SECTION.
       77  FS-CLIENTES                   PIC 9(02).
       77  WRK-MSG-ERRO                  PIC X(30) VALUE SPACES.

      *========== VARIAVEIS DE ENTRADA DE DADOS
       77  WRK-ID                        PIC 9(04) VALUE ZEROS.
       77  WRK-NOME                      PIC X(20) VALUE SPACES.
       77  WRK-TELEFONE                  PIC 9(11) VALUE ZEROS.

      *-----------------------------------------------------------------
       PROCEDURE                                 DIVISION.
       0001-PRINCIPAL                            SECTION.

           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.
           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIALIZAR                              SECTION.

           OPEN EXTEND CLIENTES.

             IF FS-CLIENTES EQUAL 35
                 MOVE "ARQUIVO NAO FOI ABERTO!" TO WRK-MSG-ERRO
                 PERFORM 9000-TRATA-ERRO
             END-IF.
                 PERFORM 0110-RECEBE-DADO.

       0100-INICIALIZAR-FIM. EXIT.

      *-----------------------------------------------------------------

       0110-RECEBE-DADO                             SECTION.

             DISPLAY "======= INCLUSAO DE DADOS ======="
             DISPLAY "DIGITE O CODIGO.."
                 ACCEPT WRK-ID
             DISPLAY "DIGITE O NOME.."
                 ACCEPT WRK-NOME
             DISPLAY "DIGITE O TELEFONE.."
                 ACCEPT WRK-TELEFONE.

       0110-RECEBER-FIM. EXIT.

      *-----------------------------------------------------------------
       0200-PROCESSAR                            SECTION.

             MOVE WRK-ID            TO REG-ID.
             MOVE WRK-NOME          TO REG-NOME.
             MOVE WRK-TELEFONE      TO REG-TELEFONE.
           WRITE REG-CLIENTES.

       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                            SECTION.

           DISPLAY"======= FIM PROGRAMA INCLUSAO =======".
             CLOSE CLIENTES.

       0300-FINALIZAR-FIM. EXIT.

      *-----------------------------------------------------------------

       9000-TRATA-ERRO                           SECTION.

           DISPLAY WRK-MSG-ERRO.
           GOBACK.

       9000-TRATA-ERRO-FIM. EXIT.
