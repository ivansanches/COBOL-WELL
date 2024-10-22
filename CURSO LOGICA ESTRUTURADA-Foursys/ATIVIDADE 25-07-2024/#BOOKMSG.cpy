      ******************************************************************
      * OBJETIVO...: BOOK DE MENSAGENS
      * PROGRAMADOR: WELLINGTON SOARES CORDEIRO
      * CONSULTORIA: FOURSYS
      * DATA.......: 22/07/2024
      ******************************************************************
       01  WRK-MSG-ARQUIVO.
           05 WRK-ERRO-ABERTURA         PIC X(030)       VALUE
               "ERRO NA ABERTURA DO ARQUIVO".

           05 WRK-ERRO-LER              PIC X(030)       VALUE
               "ERRO NA LEITURA DO ARQUIVO".

           05 WRK-ERRO-GRAVACAO         PIC X(030)       VALUE
               "ERRO NA GRAVACAO - REGCAM".

           05 WRK-ERRO-REGCAM           PIC X(030)       VALUE
               "ERRO NO FECHAMENTO DO ARQUIVO - REGCAM".

           05 WRK-ERRO-LANCAM           PIC X(030)       VALUE
               "ERRO NO FECHAMENTO DO ARQUIVO - LANCAM".

           05 WRK-LANCAM                PIC X(006)       VALUE
               "LANCAM".

           05 WRK-REGCAM                PIC X(009)       VALUE
               "REGCAM".

           05 WRK-FIM-PRG               PIC X(15)        VALUE
               "FIM DO PROGRAMA".

           05 WRK-LINHA                 PIC X(40)        VALUE
               "=============================".
