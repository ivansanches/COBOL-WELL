programa
{
	
	funcao inicio()
	{
		
       cadeia produto
       inteiro estado
	  real valorproduto
       real fretesp
       real freterj
       real fretemg 
       real valorfinal 
          
          escreva("Qual o produto? " )
          leia(produto)
          escreva("Qual o valor? ")
          leia(valorproduto)
		escreva("Qual estado voce mora? \n (1)SP (2)RJ (3)MG) \n ")
		leia(estado)
          escreva("============================================\n")
          escolha(estado)
          {
          	caso 1:
          	escreva("Produto: ",produto,"\n")
          	escreva("Valor do produto: ",valorproduto,"\n") 
          	escreva("Estado: Sao Paulo\n")
          	fretesp = valorproduto * 0.10
          	valorfinal = valorproduto + fretesp
          	escreva("Frete para SP: ",fretesp,"\n")
          	escreva("Valor final com frete: ",valorfinal)
          	pare
          	
               caso 2:
               escreva("Produto: ",produto,"\n")
               escreva("Valor do produto: ",valorproduto,"\n")        
               escreva("Estado: Rio de Janeiro\n")
               freterj = valorproduto * 0.15
               valorfinal = valorproduto + freterj
               escreva("Frete para RJ: ",freterj,"\n")
               escreva("Valor final com frete: ",valorfinal)
               
               pare

               caso 3:
               escreva("Produto: ",produto,"\n")
               escreva("Valor do produto: ",valorproduto,"\n")
               escreva("Estado: Minas Gerais\n")
               fretemg = valorproduto * 0.20
               valorfinal = valorproduto + fretemg
               escreva("Frete para MG: ",fretemg,"\n")
               escreva("Valor final com frete: ",valorfinal)
               pare

               caso contrario:
               escreva("Estado invalido-RETIRAR NA LOJA")
               pare
           }

           
}

}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1898; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */