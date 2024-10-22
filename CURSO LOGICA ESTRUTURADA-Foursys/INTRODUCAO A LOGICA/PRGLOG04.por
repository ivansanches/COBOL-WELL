programa
{
	
	funcao inicio()
	{
     cadeia produto
     real valor,desconto,valordesconto,precofinal

    escreva("Qual o produto que deseja? ")
    leia(produto)

    escreva("Qual o valor do produto? ")
    leia(valor)

    escreva("Qual o desconto oferecido? ")
    leia(desconto)

    
    valordesconto = valor * (desconto / 100)
    precofinal = valor - valordesconto
    escreva ("============================\n")
    escreva ("Produto: ",produto,"\n")
    escreva ("Valor: ",valor,"\n")
    escreva ("Desconto: %",desconto,"\n")
    escreva ("Valor do desconto: ",valordesconto,"\n")
    escreva ("============================\n")
    escreva ("VALOR FINAL DO PRODUTO COM O DESCONTO: ",precofinal)	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 380; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */