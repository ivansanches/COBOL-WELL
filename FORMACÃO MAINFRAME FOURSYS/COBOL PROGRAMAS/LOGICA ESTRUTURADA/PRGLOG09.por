programa
{
	
	funcao inicio()
	{
      cadeia  nome 
      real    nota, media, notasacum=0
      inteiro contador

      escreva("Qual o nome do aluno: ")
        leia(nome)
      
      
      para(contador=1;contador<=4;contador++)
      {
       escreva("Digite a ",contador,"º nota:")
       leia(nota)
       notasacum = notasacum + nota
       }

       media = notasacum / 4
//================= IMPRESSAO ===================       
       limpa()
       escreva("Nome do aluno: ",nome,"\n")
       escreva("Media final do aluno: ",media,"\n")
       
	}
}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 565; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */