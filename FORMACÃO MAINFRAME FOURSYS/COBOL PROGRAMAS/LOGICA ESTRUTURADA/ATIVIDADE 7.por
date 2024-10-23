programa
{
/*Dada a temperaturade uma pessoa, mostrar sua situação, de acordo com as seguintes faixas de temperatura:
Abaixo de 36,5º   hipotermia
De 36,6º até 37º   normal
De 37º até 38º   estado febril
Acima de 38º   febre */

     real temperatura
      cadeia situacao 
	
	funcao inicio()
	{
      

      escreva("Qual a temperatura? ")
        leia(temperatura)

      se (temperatura <= 36.5)
      situacao = "Hipotermia"

      senao se (temperatura >=36.6 e temperatura <= 37)
      situacao = "Normal"

      senao se (temperatura > 37 e temperatura <= 38)
      situacao = "Estado Febril"
      
      senao 
      situacao = "Febre"

      escreva("A temperatura é de: ",temperatura,"º graus,"," portanto o estado da pessoa é de ",situacao)


		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 273; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */