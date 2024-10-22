programa
{
//Dados 3 números inteiros e distintos, faça um algoritmo que os coloque em ordem.


     inteiro num1
     inteiro num2
     inteiro num3
     inteiro auxiliar


	
	funcao inicio()
	{

          escreva("Digite um número: ")
            leia(num1)
          escreva("Digite um número: ")
            leia(num2)
          escreva("Digite um número: ")
            leia(num3)

       se ( num1 > num2)
       {
       	auxiliar=num1
       	num1=num2
       	num2=auxiliar
       }

       se ( num1 > num3)
       {
       	auxiliar=num1
       	num1=num3
       	num3=auxiliar
       }

       se ( num2 > num3)
       {
       	auxiliar=num2
       	num2=num3
       	num3=auxiliar
       }

       escreva("\nOrdem crescente dos valores: ", num1, ", ", num2,", ",num3)


       }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 155; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */