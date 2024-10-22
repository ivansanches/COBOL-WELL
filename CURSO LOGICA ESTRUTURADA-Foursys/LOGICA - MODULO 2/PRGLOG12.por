programa
{
	
	funcao inicio()
	{
      cadeia  nome[3]={"Wellington","Rafael","Isabelly"}
      inteiro contador
      inteiro contaNota
      real    notas[3][2]={ {7.0,5.0}, {9.0,4.0}, {5.5,8.2} }


      para(contador=0;contador<=2;contador++)
       {
       	escreva("==================\n",nome[contador], "\n")


          para(contaNota=0;contaNota<=1;contaNota++)
          {
          escreva("Nota: ",notas[contador][contaNota],"\n")
          }
       	
       }
      









		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 447; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */