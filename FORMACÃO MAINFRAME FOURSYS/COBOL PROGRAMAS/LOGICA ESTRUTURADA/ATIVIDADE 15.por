programa
{
	
      inteiro A[10]={2,3,4,5,6,7,8,9,10,11}
      real soma_pares 
      inteiro qtd_pares
      inteiro i
      real media


	
	funcao inicio()
{
     
      soma_pares = 0
      qtd_pares = 0
    
      
      para(i=0; i<10; i++)
      {
      	se (A[i] % 2 == 0)
      	{
      		soma_pares = soma_pares + A[i]
      		qtd_pares = qtd_pares + 1 
      	}
      }

        se (qtd_pares > 0)
          {
              media = soma_pares / qtd_pares
              escreva("A media dos elementos pares é: ",media,"\n")
             
          }
          
          senao 
          {
          	escreva("Não ha elementos pares no vetor.")
          }
      	
}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 122; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */