programa
{
// Crie um algoritmo que receba um número inteiro e retorne verdadeiro caso o número for positivo e falso se o número for negativo.

     inclua biblioteca Util --> random

     inteiro numero
	
	funcao inicio()
	{
      
       
       numero = random.sorteia(-10,10)
         escreva("O numero sorteado é: ",numero,"\n")

       se (numero > 0)
       {
       	escreva ("O numero sorteado foi: ",numero,", positivo, portanto ele é verdadeiro.")
       }
        
       se (numero < 0)
       {
       	escreva ("O numero sorteado foi",numero, ", negativo, portanto ele é falso.")
       }
       se (numero == 0)
       {
       	escreva ("O numero 0 e neutro portato nao e negativo nem positivo!")
       }
	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 592; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */