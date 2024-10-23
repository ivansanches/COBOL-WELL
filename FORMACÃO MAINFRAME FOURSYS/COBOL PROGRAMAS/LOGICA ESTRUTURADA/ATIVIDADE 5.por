programa
{
//Dada a quantidade de segundos de um cronometro, faça um algoritmo que obtenha a quantidade de horas, minutos e segundos do cronometro.


     inteiro horas 
     inteiro minutos
     inteiro segundos
	
	funcao inicio()
	{

//entrada de dados
       escreva("Digite quantos segundos ter o cronometro: ")
         leia(segundos)

//calculospara converter os segundos em horas, minutos e segundos
       horas = segundos / 3600
       minutos = (segundos % 3600) / 60
       segundos = (segundos % 3600) % 60

// saida de dados 
       escreva("O cronometro tem ",horas," horas, ",minutos," minutos e ",segundos," segundos.")
	
	
	
	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 648; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */