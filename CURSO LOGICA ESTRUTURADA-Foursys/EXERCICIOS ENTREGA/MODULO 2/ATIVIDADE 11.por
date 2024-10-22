programa
{
	
	
	
	
	inteiro cpf[]={4,5,7,5,5,9,5,1,8}//457.559.518-70
	inteiro cpf1[10]
	inteiro cpf2[11]
	inteiro mult1[]={10,9,8,7,6,5,4,3,2}
	inteiro mult2[]={11,10,9,8,7,6,5,4,3,2}
	inteiro soma = 0
	inteiro resto
	inteiro dv1
	inteiro dv2


		
	funcao inicio()
	{
		
		para(inteiro i = 0; i < 9; i++)
	     {
	     	 soma += (cpf[i] * mult1[i])
	     }
		
		resto = soma % 11
		dv1 = 11 - resto

		se(dv1 > 9)
		{
			dv1 = 0
		}
		
		para(inteiro i = 0; i < 9; i++)
		{
			cpf1[i] = cpf[i]
		}
		
		cpf1[9] = dv1
		
		soma = 0
//*---------------------------------------------------/*		
          
          para(inteiro i = 0; i < 10; i++)
	     {
	     	 soma += (cpf1[i] * mult2[i])
	     }
		
		resto = soma % 11
		dv2 = 11 - resto

		se(dv2 > 9)
		{
			dv2 = 0
		}
		
		para(inteiro i = 0; i < 10; i++)
		{
			cpf2[i] = cpf1[i]
		}
		
		cpf2[10] = dv2


          escreva("O seu CPF completo e: ")
          para(inteiro i = 0; i < 11; i++)
          {
          	escreva(cpf2[i])
          }





		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 271; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */