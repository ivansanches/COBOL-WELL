programa
{
	
	inteiro  var_cancelar = 0
	cadeia   var_produto
	real     valor_produto=0
	real     valor_frete = 0
	real     valor_frete_completo = 0
	real     var_total_gasto2 = 0
	real     var_total_gasto = 0
	real     valor_final = 0
	inteiro  contador = 0
	
	
	
	
	funcao inicio()
	{
      escreva("----------------------------------------\n")
       escreva("COMPRAS ONLINE(DIGITE '0' PARA COMECAR)\n")
      leia(var_cancelar)
      limpa() 
      
      
      enquanto(var_cancelar!=99)
   {
      
       
       contador=contador++
       escreva("========================================\n")
       escreva("Qual o nome do ",contador,"º produto : ")
         leia(var_produto)
       escreva("Qual o valor do ",contador,"º produto: $")
         leia(valor_produto)
       
       var_cancelar=0 
       
       se(valor_produto>79.90)
       {
       	escreva("FRETE GRATIS\n")
       	escreva("Valor do produto sem o frete:",valor_produto,"\n")
       	  var_total_gasto = var_total_gasto + valor_produto
       }
       
       senao
       {
       	escreva("FRETE DE 15%\n")
       	valor_frete_completo = valor_produto * 1.15
       	valor_frete = valor_produto * 0.15
       	escreva("Valor do produto com o frete:",valor_frete_completo,"\n")
       	escreva("Valor do frete: ",valor_frete,"\n")
       	   var_total_gasto2 = var_total_gasto2 +  valor_frete_completo
       }

       escreva("==============================================")
       escreva("\nQUER CONTINUAR AS COMPRAS? SIM(00) NAO(99)\n")
         leia(var_cancelar)

      
       
      
      
  }
       valor_final = var_total_gasto + var_total_gasto2
       escreva("Valor total da compra: ",valor_final,"\n")
       escreva("============= FIM DO PROGRAMA =============")
//
      



		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1382; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */