programa
{
	
     inteiro numeroAleatorio[15]={1,2,4,7,8,14,17,22,48,72,98,105,118,207,333}
     inteiro numeroBusca=0
     inteiro qtdNumero=0

	
	funcao inicio()
	{

      escreva("Digite o numero que deseja procurar: ")
        leia(numeroBusca)


      para(inteiro i=0; i<=14; i++)
      {
      	se(numeroBusca==numeroAleatorio[i])
      	{
      		qtdNumero++
      		escreva("\nO numero da pesquisa se encontra na coluna: ",i,"\n")
      	}
       }
       
        para(inteiro i=0; i<=0; i++)
      {
      	se(numeroBusca!=numeroAleatorio[i])
      	{
      		qtdNumero++
      		escreva("Numero digitado não se encontra nessa matriz! por favor digite outro. ")
      	}
       }

      escreva("\n=============================================\n")
      escreva("Quantidade de numeros encontrados: ",qtdNumero)


		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 501; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */