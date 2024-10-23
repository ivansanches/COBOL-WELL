programa
{
/*Crie o seguinte algoritmo em Portugol:

 Tente adivinhar um numero sorteado de 1 a 100. Enquanto o chute não for igual ao número*/ 	
	
    inclua biblioteca Util --> random

    inteiro numSorteado = random.sorteia(1,100)
    inteiro chute = 0
    inteiro tentativas = 0 

    funcao inicio()
	{
      
      enquanto(chute != numSorteado)
      {
        escreva("TENTE ADIVINHAR O NUMERO(entre 1 e 100).\n")      
        escreva("Digite seu numero: ")
        leia(chute)
      
        
	      tentativas = tentativas++  
	      se (chute == numSorteado)
	      {
	      	limpa()
	      	escreva("===============================================================================\n")
	      	escreva("Parabéns! Você acertou o número sorteado em ", tentativas, " tentativa(s).\n")
	      }
	        
	      se (chute > numSorteado) 
	        {
	        	escreva("O número sorteado é menor do que ", chute, ". Tente novamente.\n")
	        	escreva("=================================================================\n")
	        }
	      se (chute < numSorteado)
	       {
	       	escreva("O número sorteado é maior do que ", chute, ". Tente novamente.\n")
	       	escreva("=================================================================\n")
	       }

      }
      

      escreva("O numero sorteado era: ",numSorteado)
}
	  
	
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 596; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */