#include "protheus.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} User Function ITEM
Ponto de entrada utilizado para modificar o cadastro de produtos em MVC
@author  Lenon
@since   26/01/2022
@see        
/*/
//-------------------------------------------------------------------

user function ITEM()
    // PARAMIXB = parâmetro obrigatório nos PE's em MVC, pois ele trás em
    // seu retorno informações importantes sobre o estado e ponto de execução
    // da rotina

    /*
        Retorno do PARAMIXB:
            [1]  O   Objeto do formulário ou do modelo, conforme o caso
            [2]  C   ID do local de execução do ponto de entrada
            [3]  C   ID do formulário
    */
    Local aParam        := PARAMIXB

    Local xRet          := .T.

    Local oObject       := aParam[1]
    Local cIdPonto      := aParam[2]
    Local cIdModel      := aParam[3]

    // Captura a operação executada na aplicação
    Local nOperation    := oObject:GetOperation()

    /*
    1. Pesquisar
    2. Visualizar
    3. Incluir
    4. Alterar
    5. Excluir
    6. Outras funções
    7. Copiar
    */

    // Se estiver diferente de nulo, quer dizer que alguma ação está sendo feita no modelo (alteração, inclusão, exclusão)
    if aParam[2] <> nil

        if cIdPonto == "MODELPOS" // se estiver na pós validação
            // verifica se o campo de cod de produto possui no mínimo 10 caracteres
            if len(alltrim(M->B1_COD)) < 10
                help(nil, nil, "CODPRODUTO", nil, "Código não permitido",;
                    1, 0, nil, nil, nil, nil, nil, { "O código <b> " + alltrim(M->B1_COD) + "</b> deve ter no mínimo 10 caracteres. <b>" })
                
                xRet    := .F.
            elseif len(alltrim(M->B1_DESC)) < 15
                help(nil, nil, "DESCPRODUTO", nil, "Descrição do protudo inválida.",;
                    1, 0, nil, nil, nil, nil, nil, { "O código <b> " + alltrim(M->B1_DESC) + "</b> deve ter no mínimo 15 caracteres. <b>" })

                xRet    := .F.
            endif
        
        elseif nOperation = 5
            help(nil, nil, "EXCLUIRPRODUTO", nil, "Exclusão não permitida.",;
                    1, 0, nil, nil, nil, nil, nil, { "O produto não pode ser excluído!" })

            xRet    := .F.
        endif
    endif

return xRet
