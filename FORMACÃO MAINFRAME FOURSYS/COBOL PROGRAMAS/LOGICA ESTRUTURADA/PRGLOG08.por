programa
{
	
	funcao inicio()
{
      inteiro num, res, cont
      cont = 1

      escreva("Qual o numero: \n")
      leia(num)

//===================== TABUADA NORMAL ===============================           
      escreva("============= Tabuada Normal =============\n")

      enquanto(cont <= 10)
      {
       res = num * cont
       escreva(num," X ",cont," = ",res,"\n")
       cont ++
      }
//===================== TABUADA INVERTIDA ===============================     
      
       cont = 10

       escreva("\n============= Tabuada Ivertida =============\n")
       leia(num)

      enquanto(cont >= 1)
      {
       res = num * cont
       escreva(num," X ",cont," = ",res,"\n")
       cont --
      }
//===================== TABUADA DE 2 EM 2===============================   
      
       cont = 1

       escreva("\n============= Tabuada 2 em 2 =============\n")
       leia(num)

      enquanto(cont <= 10)
      {
       res = num * cont
       escreva(num," X ",cont," = ",res,"\n")
       cont = cont + 2
      }
 
 
 }

	 
	
      
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1033; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */