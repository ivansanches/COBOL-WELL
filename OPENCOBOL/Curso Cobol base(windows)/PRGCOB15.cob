       IDENTIFICATION                               DIVISION.
       PROGRAM-ID. PRGCOB15.
      *=================================================================
ALT1  *== PROGRAMADOR : WELLINGTON SOARES CORDEIRO
..    *== OBJETIVO    : CALCULO DE FRETE
..    *== DATA        : 30/06/2024
..    *== CONSULTORIA : FOURSYS
..    *== ALTERACAO   :
ALT1  *=================================================================
       ENVIRONMENT                                  DIVISION.
       CONFIGURATION                         SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

      *-----------------------------------------------------------------

       DATA                                         DIVISION.
       WORKING-STORAGE                       SECTION.
       77 WRK-PRODUTO  PIC X(20) VALUE SPACES.
       77 WRK-ESTADO   PIC 9(01) VALUE ZEROS.
       77 WRK-VALOR    PIC 9(05)V99 VALUE ZEROS.

       77 WRK-FRETESP  PIC 9(05)V99 VALUE ZEROS.
       77 WRK-FRETERJ  PIC 9(05)V99 VALUE ZEROS.
       77 WRK-FRETEES  PIC 9(05)V99 VALUE ZEROS.

       77 WRK-FRETE1   PIC 9(04)V99 VALUE ZEROS.
       77 WRK-FRETE2   PIC 9(04)V99 VALUE ZEROS.
       77 WRK-FRETE3   PIC 9(04)V99 VALUE ZEROS.

      *-----------------------------------------------------------------
       PROCEDURE                                    DIVISION.
       0001-PRINCIPAL                        SECTION.

           PERFORM 0100-INICIAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.


      *-----------------------------------------------------------------
       0100-INICIAR                          SECTION.

           DISPLAY"QUAL O PRODUTO:"
             ACCEPT WRK-PRODUTO.
           DISPLAY"QUAL O VALOR DO PRODUTO:"
             ACCEPT WRK-VALOR.
           DISPLAY"QUAL ESTADO: SP(01) RJ(02) ES(03)"
             ACCEPT WRK-ESTADO.
           DISPLAY"==================================".

       0100-INICIAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0200-PROCESSAR                        SECTION.
           COMPUTE WRK-FRETESP = WRK-VALOR * 1,10.
           COMPUTE WRK-FRETERJ = WRK-VALOR * 1,15.
           COMPUTE WRK-FRETEES = WRK-VALOR * 1,20.

           IF WRK-ESTADO EQUAL 1
               MULTIPLY WRK-VALOR BY 0,10 GIVING WRK-FRETE1
               DISPLAY "VALOR DO FRETE:"WRK-FRETE1
               DISPLAY "VALOR FINAL:"WRK-FRETESP
           END-IF.

           IF WRK-ESTADO EQUAL 2
               MULTIPLY WRK-VALOR BY 0,15 GIVING WRK-FRETE2
               DISPLAY "VALOR DO FRETE:"WRK-FRETE2
               DISPLAY "FRETE PARA RIO DE JANEIRO"WRK-FRETERJ
           END-IF.

           IF WRK-ESTADO EQUAL 3
               MULTIPLY WRK-VALOR BY 0,20 GIVING WRK-FRETE3
               DISPLAY "VALOR DO FRETE:"WRK-FRETE3
               DISPLAY "FRETE PARA ESPIRITO SANTO"WRK-FRETEES
           ELSE
               DISPLAY"MES INVALIDO - RETIRAR NA LOJA"
               DISPLAY"VALOR DO PRODUTO:"WRK-VALOR
           END-IF.

       0200-PROCESSAR-FIM. EXIT.



      *-----------------------------------------------------------------
       0300-FINALIZAR                        SECTION.

       0300-FINALIZAR-FIM. EXIT.
