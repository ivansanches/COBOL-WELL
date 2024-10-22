programa
{
	
	funcao inicio()
	{
      inteiro cargo, setor, idade

      escreva("Qual seu Cargo:(1)GERENTE (2)SUPERVISOR \n")
        leia(cargo)
      escreva("Qual seu Setor:(1)ADM (2)TIC \n")
        leia(setor)
      escreva("Qual sua idade: \n")
        leia(idade)

      escreva("=====================================\n")
      se(cargo == 1 e setor == 2)
        escreva("Parabens voçê ira receber um bonus!")

      se(cargo == 1 e setor == 1)
        escreva("Infelizmente voçê não foi selecionado para receber o bonus")

       se(cargo == 2 e setor == 2)
        escreva("Infelizmente voçê não foi selecionado para receber o bonus")

      
       se(cargo == 2 e setor == 1)
        escreva("Infelizmente voçê não foi selecionado para receber o bonus")

            
       se(cargo == 1 e setor == 2 e idade >=60)
        escreva("Parabens voçê ira receber um bonus plus!")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 901; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */