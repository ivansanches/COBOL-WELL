programa
{
    inteiro cnpj[12] = {1,2,3,4,5,6,7,8,9,2,3,5} // 12.345.678/9234-56
    inteiro cnpj1[12]
    inteiro cnpj2[14] // Ajustei para 14 para acomodar os dígitos verificadores
    inteiro mult1[] = {5,4,3,2,9,8,7,6,5,4,3,2}
    inteiro mult2[] = {6,5,4,3,2,9,8,7,6,5,4,3,2}
    inteiro soma = 0
    inteiro resto
    inteiro dv1
    inteiro dv2

    funcao inicio()
    {
        // Cálculo do primeiro dígito verificador (dv1)
        para(inteiro i = 0; i < 12; i++)
        {
            soma += (cnpj[i] * mult1[i])
        }
        
        resto = soma % 11
        se(resto < 2)
        {
            dv1 = 0
        }
        senao
        {
            dv1 = 11 - resto
        }
        
        // Armazenando os valores calculados em cnpj1
        para(inteiro i = 0; i < 10; i++)
        {
            cnpj1[i] = cnpj[i]
        }
        cnpj1[10] = dv1
        
        soma = 0
        
        // Cálculo do segundo dígito verificador (dv2)
        para(inteiro i = 0; i < 12; i++) // Corrigido para < 13
        {
            soma += (cnpj1[i] * mult2[i])
        }
        
        resto = soma % 11
        se(resto < 2)
        {
            dv2 = 0
        }
        senao
        {
            dv2 = 11 - resto
        }
        
        // Armazenando os valores finais em cnpj2
        para(inteiro i = 0; i < 12; i++)
        {
            cnpj2[i] = cnpj1[i]
        }
        cnpj2[12] = dv2 // Ajustei para índice 12

        // Exibindo o CNPJ completo formatado
        escreva("O seu CNPJ completo e: ")
        para(inteiro i = 0; i < 12; i++)
        {
            se(i == 8)
            {
                escreva("/")
            }
            escreva(cnpj2[i])
        }
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1001; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */