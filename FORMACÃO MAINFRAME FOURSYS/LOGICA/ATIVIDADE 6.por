programa
{
//Crie um algoritmo que receba um número inteiro e retorne verdadeiro caso o número for PRIMO e falso se o número não for PRIMO.

     inteiro x
     inteiro valor = 1 
     inteiro divisores = 0

	
	funcao inicio()
	{
		

		escreva("Digite um numero inteiro: ")
		leia(x)


          se(x > 0){
          	enquanto(valor <= x){
          		se(x % valor == 0){
          			divisores++
          		}
          	     valor++
          	}
          	se(divisores == 2){
          		escreva("O numero ",x," é um numero primo, portanto é verdadeiro!\n")
          	}
          	senao{
          		escreva("O numero ",x," não é um numero primo, portanto é falso!\n")
          	}
          }
          
          senao
          {
          escreva("Numero negativo ou igual a zero!\n")
          }

		
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 209; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */