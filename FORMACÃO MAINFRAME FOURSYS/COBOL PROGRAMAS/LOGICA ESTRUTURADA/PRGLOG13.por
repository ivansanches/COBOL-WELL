programa
	{
		 inteiro numero=0
	      inteiro contador
	      inteiro resultado
		
		funcao inicio()
		{
	        inicializar()
	         se(numero>0)
	         {
	         processar()
	         }
	         finalizar()
		}
		
		
	//recebe os dados	
	     funcao inicializar()
	     {
	      escreva("Qual o numero: ")
	        leia(numero)
	      
	     }
	
	    
	//processa os dados    
	     funcao processar()
	     {
	      escreva("======== TABUADA DO ",numero," ATE 10 ========")
	     	para(contador=1; contador<=10;contador++)
	      {
	      	resultado = numero * contador
	      	escreva("\n",numero, " X ",contador, " = ", resultado,"\n")
	      }
	     
	     }
	
	//saida de dados 
	     funcao finalizar()
	     {
	     	escreva("=========== FIM DO PROGRAMA ===========\n")
	     }
     
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 487; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */