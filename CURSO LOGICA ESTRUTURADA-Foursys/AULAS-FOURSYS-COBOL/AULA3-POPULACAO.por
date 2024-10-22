programa
{
     inteiro PopulacaoA   
     inteiro PopulacaoB   
     inteiro ContadorAnos = 0
     real    PorcentagemA 
     real    PorcentagemB 
	funcao inicio()
	{
       escreva("Qual a populacao do pais A: ")
         leia(PopulacaoA)
      escreva("===========================================\n")
       
       escreva("Qual a populacao do pais B: ")
         leia(PopulacaoB)
      escreva("============================================\n")
       
       escreva("Qual a porcentagem de crescimento do pais A: ")
         leia(PorcentagemA)
       escreva("============================================\n")
       
       escreva("Qual a porcentagem de crescimento do pais B: ")
         leia(PorcentagemB)
       escreva("============================================\n")
       
       se(PopulacaoA > PopulacaoB)
       {
       	escreva("A populacao do pais A ja e maior que a do pais B !")
       	escreva("\n===================================================")
       }

       
       enquanto(PopulacaoA < PopulacaoB)
       {
       	ContadorAnos++
          PopulacaoA = PopulacaoA + ( PopulacaoA *  PorcentagemA / 100)
          PopulacaoB = PopulacaoB  + ( PopulacaoB *  PorcentagemB / 100)
          escreva("\nANO:" ,ContadorAnos,"   Populacao do pais A:",PopulacaoA,"   /    ANO:",ContadorAnos,"   Populacao do pais B:",PopulacaoB)
       }
          escreva("\n====================================================================")
          escreva("\nA populacao do pais A passara a populacao do pais B em ",ContadorAnos," anos.")
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1385; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */