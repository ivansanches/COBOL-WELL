programa
{
	
	funcao inicio()
	{

      real boleto[4] 
      real saldoConta
      inteiro contador


     escreva("Qual o saldo da sua conta: ")
       leia(saldoConta)
      
      
      para(contador = 0; contador<=3; contador++)
      {
      	escreva("Digite o valor do ", contador+1,"º boleto: ")
      	  leia(boleto[contador])
      }


      saldoConta = saldoConta - (boleto[0] + boleto[1] + boleto[2] + boleto[3])

      escreva("Saldo restante : ",saldoConta)

      se(saldoConta < 0)
      {
      	escreva("\nSaldo negativo")
      }
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 531; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */