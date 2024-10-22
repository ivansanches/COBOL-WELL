programa
{
	
	funcao inicio()
	{
		
        cadeia produto
        inteiro estado
	   real valorproduto
        real frete
         
          
          escreva("Qual o produto? " )
          leia(produto)
          escreva("Qual o valor? ")
          leia(valorproduto)
		escreva("Qual estado voce mora? \n (1)SP (2)RJ (3)MG) \n ")
		leia(estado)
          escolha(estado)
          {
          	caso 1:
          	escreva("Paulista")
          	pare
          	
               caso 2:
               escreva("Carioca")
               pare

               caso 3:
               escreva("Mineiro")
               pare

               caso contrario:
               escreva("Estado invalido-retirar na loja")
               pare
           }
}

}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 743; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */