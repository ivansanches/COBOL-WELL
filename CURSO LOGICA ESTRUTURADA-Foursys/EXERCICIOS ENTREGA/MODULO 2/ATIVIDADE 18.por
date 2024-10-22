programa
{
    
    inclua biblioteca Tipos    --> tipo
    inclua biblioteca Texto    --> txt
    inclua biblioteca Arquivos --> arquivo
     
    logico  existe_arquivo = falso
    inteiro cliente
    inteiro qt
    inteiro saldo = 0 
    cadeia  registro 
    cadeia  caminho = "C:/COBOL-FOURSYS/CLIENTES.txt"
    
	funcao inicio()
	{

        inicializar()
        se(existe_arquivo)
        {
      	processar()
      	finalizar()
        }
     }

     funcao inicializar()
    {

    	existe_arquivo = arquivo.arquivo_existe(caminho)
    	se(existe_arquivo==falso)
    	{
    		escreva("Arquivo nao existe")
    	}
    
    }

    funcao processar()
    {
    	cliente=arquivo.abrir_arquivo(caminho, arquivo.MODO_LEITURA)
    
     enquanto(nao arquivo.fim_arquivo(cliente))
     {
     	registro = arquivo.ler_linha(cliente)

     	qt=txt.numero_caracteres(registro)
     	se(qt>0)
     	{
     		se(txt.obter_caracter(registro,25) == 'P')
     		{
     			escreva(registro, "\n")
     			saldo = saldo + tipo.cadeia_para_inteiro(txt.extrair_subtexto(registro,09,14),10)
     		}
     	}
     }

    }

    funcao finalizar()
    {
     arquivo.fechar_arquivo(cliente)
     estatistica()
     }

     funcao estatistica()
     {
      escreva("==========================\n")
      escreva("O saldo final dos clientes premium é de: ",saldo)
     }
    
    
    
    
    
    
    }
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1354; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */