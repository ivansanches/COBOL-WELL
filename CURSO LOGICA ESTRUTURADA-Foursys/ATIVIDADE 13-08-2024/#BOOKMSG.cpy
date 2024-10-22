       01  WRK-MSG-ARQUIVO.

           05 WRK-ERRO-ABERTURA         PIC X(030)       VALUE
               "ERRO NA ABERTURA DO ARQUIVO".

           05 WRK-ERRO-LER              PIC X(030)       VALUE
               "ERRO NA LEITURA DO ARQUIVO".

           05 WRK-ERRO-GRAVACAO         PIC X(030)       VALUE
               "ERRO NA GRAVACAO DO ARQUIVO".

           05 WRK-ERRO-REGCAM           PIC X(030)       VALUE
               "ERRO NO FECHAMENTO DO ARQUIVO - REGCAM".

           05 WRK-ERRO-LANCAM           PIC X(030)       VALUE
               "ERRO NO FECHAMENTO DO ARQUIVO - LANCAM".

           05 WRK-ERRO-FECHA            PIC X(030)       VALUE
               "ERRO NO FECHAMENTO DO ARQUIVO".

           05 WRK-LANCAM                PIC X(006)       VALUE
               "LANCAM".

           05 WRK-REGCAM                PIC X(009)       VALUE
               "REGCAM".

           05 WRK-RELAT                 PIC X(009)       VALUE
               "RELAT".

           05 WRK-SAIDA                 PIC X(009)       VALUE
               "SAIDA".

           05 WRK-CLIENTE               PIC X(009)       VALUE
               "CLIENTE1".

           05 WRK-FIM-PRG               PIC X(015)        VALUE
               "FIM DO PROGRAMA".

           05 WRK-LINHA                 PIC X(080)        VALUE
           "==========================================================".

           05 WRK-ARQ-EXISTE            PIC X(080)        VALUE
               "ARQUIVO NAO POSSUI REGISTRO".

           05 WRK-PRGS-ERRO            PIC X(080)          VALUE
               "NENHUMA OCORRENCIA DESSE PROGRAMA".
