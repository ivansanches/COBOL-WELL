programa
{
/*EXERCICIO: Um caixa eletrônico trabalha com cédulas de 100, 50, 20, 10, 5, 2 e 1. 
Faça um algoritmo que, a partir do valor de um saque informado, obtenha a quantidade mínima de células necessárias, 
separadas por tipo, para atender ao valor informado pelo cliente.	*/
	
	
	
	inteiro var_valorSaque
	inteiro var_resto
	
	
	funcao inicio()
	{

      // Entrada de dados
    escreva("Digite o valor do saque: ")
    leia(var_valorSaque)
    
    // Cálculo das cédulas
    escreva("Quantidade mínima de cédulas:\n")
    
    // Cédulas de 100
    escreva("Cédulas de 100: ")
    escreva(var_valorSaque / 100)
    var_resto = var_valorSaque % 100
    var_valorSaque = var_resto
    
    // Cédulas de 50
    escreva("\nCédulas de 50: ")
    escreva(var_valorSaque / 50)
    var_resto = var_valorSaque % 50
    var_valorSaque = var_resto
    
    // Cédulas de 20
    escreva("\nCédulas de 20: ")
    escreva(var_valorSaque / 20)
    var_resto = var_valorSaque % 20
    var_valorSaque = var_resto
    
    // Cédulas de 10
    escreva("\nCédulas de 10: ")
    escreva(var_valorSaque / 10)
    var_resto = var_valorSaque % 10
    var_valorSaque = var_resto
    
    // Cédulas de 5
    escreva("\nCédulas de 5: ")
    escreva(var_valorSaque / 5)
    var_resto = var_valorSaque % 5
    var_valorSaque = var_resto
    
    // Cédulas de 2
    escreva("\nCédulas de 2: ")
    escreva(var_valorSaque / 2)
    var_resto = var_valorSaque % 2
    var_valorSaque = var_resto
    
    // Cédulas de 1
    escreva("\nCédulas de 1: ")
    escreva(var_valorSaque)

    escreva("\n============= FIM DE PROGRAMA =============")
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1576; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */