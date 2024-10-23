programa
{
// Faça um algoritmo que some todos os números inteiros, compreendidos entre 2 números informados
	
	
	inteiro inicial
	inteiro final
	inteiro soma = 0
	inteiro contador = 0
	
	
		
		funcao inicio()
     {
	      
	      escreva ("Digite o numero inicial: ")
	         leia(inicial)
	      escreva ("Digite o numero final: ")
	         leia(final)
	      escreva("============================\n")
	
	      se(inicial <= final)
	      {
	           inicial++
	         para(contador=inicial ; contador < final; contador++)
	           soma = soma + contador
	      }

	      
		 escreva("Numero 1: ",inicial,"\n")
		 escreva("Numero 2: ",final,"\n")
		 escreva("A soma entre ",inicial," e ",final," e de : ", soma)
		 
	 }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 685; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */