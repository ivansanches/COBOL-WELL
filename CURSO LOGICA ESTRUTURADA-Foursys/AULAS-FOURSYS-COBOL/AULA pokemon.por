programa
{
     inteiro P1, P2, P3, TotalDoce, qtdEvoluidas=0
	inteiro o1=0, o2=0, o3=0
	
	funcao inicio()
{

    
   
    // Leitura dos valores de entrada
    escreva("qual o total de doces:")
      leia(TotalDoce)

    
    
    escreva("minimo de doces para Pokemon 1 evoluir:")
      leia(P1)
    escreva("minimo de doces para Pokemon 2 evoluir:")
      leia(P2)
    escreva("minimo de doces para Pokemon 3 evoluir:")
      leia(P3)
    
    se(TotalDoce <= 0 e TotalDoce > 1000)
    
    {
    	escreva("Valor Doces invalido (O NUMERO DEVE ESTAR ENTRE 0 e 100!")
     
    }
   
    se(P1 < 0 e P1 > 1000)
    {
    	escreva("Valor de doces para evolucao do Pokemon 1 invalido (O NUMERO DEVE ESTAR ENTRE 0 e 100!")
    }

    se(P2 < 0 e P2 > 1000)
    {
    	escreva("Valor de doces para evolucao do Pokemon 2 invalido (O NUMERO DEVE ESTAR ENTRE 0 e 100!")
    }
    
    se(P3 < 0 e P3 > 1000)
    {
    	escreva("Valor de doces para evolucao do Pokemon 3 invalido (O NUMERO DEVE ESTAR ENTRE 0 e 100!")
    }
    
    senao
    {
    	
    	escreva("Doces minimos dos pokemon em ordem:\n")
    	ColocaOrdem()

    	escreva(o1,",",o2,",",o3)

     se(TotalDoce >= o1)
     {
     	TotalDoce = TotalDoce - o1
     	  qtdEvoluidas = qtdEvoluidas + 1
     }

      se(TotalDoce >= o2)
     {
     	TotalDoce = TotalDoce - o2
     	  qtdEvoluidas = qtdEvoluidas + 1
     } 

     
      se(TotalDoce >= o3)
     {
     	TotalDoce = TotalDoce - o3
     	  qtdEvoluidas = qtdEvoluidas + 1
     } 

     escreva("\nQuantidade de evolucoes:")
       escreva(qtdEvoluidas)
     escreva("\nQuantidade de doces restantes:")
       escreva(TotalDoce," doces!")
    }

    
}

	funcao ColocaOrdem()
	{
		


		se (P1>P2 e P2>P3 )
		{
			o3 = P1 
			o2 = P2  
			o1 = P3 		
		}
     
          se (P1>P3 e P3>P2)
          {
          	o3 = P1 
          	o1 = P2
          	o2 = P3 
          }

          se (P2>P1 e P1>P3)
          {
          	o2 = P1
          	o3 = P2
          	o1 = P3 
          }
          
          se (P2>P3 e P3>P1)
          {
          	o1 = P1  
          	o3 = P2
          	o2 = P3 
          }
     
          se (P3>P1 e P1>P2)
          {
          	o2 = P1 
          	o1 = P2 
          	o3 = P3 
          }

          se (P3>P2 e P2>P1)
          {
          	o1 = P1 
          	o2 = P2 
          	o3 = P3 
          }
     
     
     }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 726; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */