programa
{
	
	funcao inicio()
	{
     cadeia nome
     real media,nota1, nota2

     escreva("Qual o nome do aluno: ")
       leia(nome)
     escreva("Valor nota 1: ")
       leia(nota1)
     escreva("Valor nota 2 ")
       leia(nota2)


    media = (nota1 + nota2) / 2

     escreva("===============================\n")
     escreva("Nome do aluno: ",nome,"\n")
     escreva("Nota 1: ",nota1,"\n")
     escreva("Nota 2: ",nota2,"\n")
     escreva("Media: ",media,"\n")

     se (media >= 7) 
	{
	escreva("Aluno Aprovado")
     }
     senao se (media >= 2)
     {
     escreva("Aluno de recuperação")
     }
     senao 
     {
     escreva("Aluno reprovado")	
     }
     
}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 240; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */