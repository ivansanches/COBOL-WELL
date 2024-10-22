programa
{
	
	funcao inicio()
	{
	 inteiro nacionalidade, idade
      cadeia nome

      
      escreva("===================================================\n")
	 escreva("Informe seu nome: ")
	   leia(nome)
      escreva("Informe sua idade: ")
        leia(idade)
      escreva("Informe sua nacionalidade (1)BRASIL (2)ESTRANGEIRA   : ")
        leia(nacionalidade)
      escreva("===================================================\n")
        
      se(nacionalidade == 1 e idade >=16)
        escreva("Parabéns voçê esta apto a votar!")
        
      se(nacionalidade == 1 e idade <16)
        escreva("Voçê ainda não esta apto a votar, apenas quando completar 16 anos!")
        
      se(nacionalidade == 2 e idade >=16)
        escreva("Desculpa, estrangeiros não podem votar, apenas brasileiros!")
       
      se(nacionalidade == 2 e idade <16)
        escreva("Desculpa, estrangeiros não podem votar, apenas brasileiros!")

        escreva("\n===================================================")
              
           
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 959; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */