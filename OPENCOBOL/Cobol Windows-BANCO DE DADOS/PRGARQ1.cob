       IDENTIFICATION                            DIVISION.
       PROGRAM-ID. PRGARQ1.
      *=================================================================
      *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
      *== OBJETIVO    : ABERTURA DE ARQUIVO CLIENTES.dat
      *== DATA        : 10/07/2024
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
           05 REG-ID         PIC 9(04).
           05 REG-NOME       PIC X(20).
           05 REG-TELEFONE   PIC 9(11).

       WORKING-STORAGE                           SECTION.
       77  FS-CLIENTES           PIC 9(02).

      *-----------------------------------------------------------------
       PROCEDURE                                 DIVISION.
       0001-PRINCIPAL                            SECTION.

           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.
           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIALIZAR                              SECTION.

           OPEN INPUT CLIENTES.

             IF FS-CLIENTES EQUAL 35
                 DISPLAY "ARQUIVO NAO FOI ABERTO!"
             ELSE
                 DISPLAY "ARQUIVO FOI ABERTO!"


             DISPLAY " STATUS " FS-CLIENTES.


       0100-INICIALIZAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                            SECTION.

           CONTINUE.

       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                            SECTION.

           DISPLAY"======= FIM PROGRAMA =======".
             CLOSE CLIENTES.

       0300-FINALIZAR-FIM. EXIT.
