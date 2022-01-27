#include "protheus.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} CUSTOMERVENDOR
@author  Lenon
@since   27/01/2022
@version version
/*/
//-------------------------------------------------------------------

user function CUSTOMERVENDOR()
    Local aParam        := PARAMIXB
    Local xRet          := xRet

    Local oObj          := aParam[1]
    Local cIdPonto      := aParam[2]
    Local cIdModel      := aParam[3]

    Local cRazSoc       := alltrim(M->A2_NOME)
    Local cFantasia     := alltrim(M->A2_NREDUZ)

    if aParam[2] <> nil // -> se for diferente de incluir/alterar/excluir/visualizar
        if cIdPonto == "MODELPOS"
           if len(cRazSoc) < 20
                help(nil, nil, "RAZSOC", nil, "Raz�o social inv�lida",;
                    1, 0, nil, nil, nil, nil, nil, { "A raz�o social <b> " + alltrim(M->A2_NOME) + "</b> deve ter no m�nimo 20 caracteres. <b>" })

                xRet := .F.
           elseif len(cFantasia) < 10
                help(nil, nil, "RAZSOC", nil, "Nome reduzido inv�lido",;
                    1, 0, nil, nil, nil, nil, nil, { "O nome reduzido <b> " + alltrim(M->A2_NREDUZ) + "</b> deve ter no m�nimo 10 caracteres. <b>" })

                xRet := .F.
           endif 
        elseif cIdPonto == "BUTTONBAR"
            xRet    := {{ "Produto x Fornecedor", "Produto x Fornecedor", {|| MATA061() }, "Chama a amarra��o Prod x For" }}
        endif
    endif

return xRet
