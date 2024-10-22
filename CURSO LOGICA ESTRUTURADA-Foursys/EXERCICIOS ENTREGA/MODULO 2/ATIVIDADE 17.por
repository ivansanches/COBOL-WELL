programa
{
	

     real var_vendas[12]
     real var_valorVenda
     inteiro var_indice
     inteiro var_mes


	
	funcao inicio()
	{
       para(var_indice=0;var_indice<=11; var_indice++)
        {
         var_vendas[var_indice] = 0
        }

       escreva("Informe o mês da venda: ")
         leia(var_mes)

       enquanto (var_mes !=99)
       {
          se (var_mes >= 1 e var_mes <= 12)
          { 
       	  escreva("Informe o valor da venda: ")
       	    leia(var_valorVenda)
       	  var_vendas[var_mes] = var_vendas[var_mes] + var_valorVenda
          }
          senao
          {
         	  escreva("Mês invalido. Informe novamente: ")
          }
            escreva("Informe o mês da venda(digite 99 para encerrear): ")
              leia(var_mes)
       }

       escreva("====================================\n")
       escreva("Valores acumulados por mês:\n")

      
       para(var_indice=0;var_indice<12; var_indice++)
       {
       	escreva("Mês ",var_indice+1, ": R$ ", var_vendas[var_indice], "\n")
       }


       escreva("\n============== FIM DE PROGRAMA ==============")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1061; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */