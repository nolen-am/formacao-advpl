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
    // PARAMIXB = par�metro obrigat�rio nos PE's em MVC, pois ele tr�s em
    // seu retorno informa��es importantes sobre o estado e ponto de execu��o
    // da rotina

    /*
        Retorno do PARAMIXB:
            [1]  O   Objeto do formul�rio ou do modelo, conforme o caso
            [2]  C   ID do local de execu��o do ponto de entrada
            [3]  C   ID do formul�rio
    */
    Local aParam        := PARAMIXB

    Local xRet          := .T.

    Local oObject       := aParam[1]
    Local cIdPonto      := aParam[2]
    Local cIdModel      := aParam[3]

    // Captura a opera��o executada na aplica��o
    Local nOperation    := oObject:GetOperation()

    /*
    1. Pesquisar
    2. Visualizar
    3. Incluir
    4. Alterar
    5. Excluir
    6. Outras fun��es
    7. Copiar
    */

    // Se estiver diferente de nulo, quer dizer que alguma a��o est� sendo feita no modelo (altera��o, inclus�o, exclus�o)
    if aParam[2] <> nil

        if cIdPonto == "MODELPOS" // se estiver na p�s valida��o
            // verifica se o campo de cod de produto possui no m�nimo 10 caracteres
            if len(alltrim(M->B1_COD)) < 10
                help(nil, nil, "CODPRODUTO", nil, "C�digo n�o permitido",;
                    1, 0, nil, nil, nil, nil, nil, { "O c�digo <b> " + alltrim(M->B1_COD) + "</b> deve ter no m�nimo 10 caracteres. <b>" })
                
                xRet    := .F.
            elseif len(alltrim(M->B1_DESC)) < 15
                help(nil, nil, "DESCPRODUTO", nil, "Descri��o do protudo inv�lida.",;
                    1, 0, nil, nil, nil, nil, nil, { "O c�digo <b> " + alltrim(M->B1_DESC) + "</b> deve ter no m�nimo 15 caracteres. <b>" })

                xRet    := .F.
            endif
        
        elseif nOperation = 5
            help(nil, nil, "EXCLUIRPRODUTO", nil, "Exclus�o n�o permitida.",;
                    1, 0, nil, nil, nil, nil, nil, { "O produto n�o pode ser exclu�do!" })

            xRet    := .F.
        endif
    endif

return xRet
