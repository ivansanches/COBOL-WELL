programa
{
// Crie um algoritmo que receba um número inteiro e retorne verdadeiro caso o número for positivo e falso se o número for negativo.

     inclua biblioteca Util --> random

     inteiro numero
	
	funcao inicio()
	{
      
      randomNumero()
      inicializar()
      processar()
      finalizar()
      
     }

     funcao randomNumero()
     {
     	 numero = random.sorteia(-10,10)    
     }
     
     
     funcao inicializar()
     {
      
         escreva("O numero sorteado é: ",numero,"\n")
     }

     funcao processar()
     {
       se (numero > 0)
       {
       	escreva ("O numero sorteado foi: ",numero,", e esse numero é positivo, portanto ele é verdadeiro.")
       }
        
       se (numero < 0)
       {
       	escreva ("O numero sorteado foi: ",numero, ", e esse numero é negativo, portanto ele é falso.")
       }
       se (numero == 0)
       {
       	escreva ("O numero 0 é neutro portato não é negativo nem positivo!")
       }
	}

	funcao finalizar()
	{
		escreva("\n=========== FIM DE PROGRAMA ===========")
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 239; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */