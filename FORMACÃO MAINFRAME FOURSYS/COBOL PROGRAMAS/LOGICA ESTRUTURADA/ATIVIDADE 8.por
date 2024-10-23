programa
{

     inteiro estudante
     inteiro industriario
     inteiro socio 
     inteiro aposentado
     real desconto


	funcao inicio()
	{
	
    
    escreva("Você é estudante? (1)SIM (2)NAO: ")
    leia(estudante)
    escreva("Você é trabalhador indústria? (1)SIM (2)NAO: ")
    leia(industriario)
    escreva("Você é sócio do clube? (1)SIM (2)NAO: ")
    leia(socio)
    escreva("Você é aposentado? (1)SIM (2)NAO: ")
    leia(aposentado)
    
    desconto = 0
    
    
    se (aposentado == 1)
        desconto = desconto + 100

     
    se (socio == 1)
        desconto = desconto + 80    
    
    
    se (estudante == 1)
        desconto = desconto + 50

   
    se (industriario == 1)
        desconto = desconto + 30         
   
    escreva("Desconto total: R$", desconto)
   
	}
}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 125; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */