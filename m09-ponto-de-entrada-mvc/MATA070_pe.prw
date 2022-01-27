#include "protheus.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} MATA070
Ponto de entrada para cadastro de Bancos (MATA070), neste caso em especial
o ID da Model tem o mesmo nome da function do fonte padrão. Por isso esse 
ponto de entrada foi nomeado como MATA070_pe.
@author  Lenon
@since   27/01/2022
/*/
//-------------------------------------------------------------------

user function MATA070()
    local aParam        := PARAMIXB
    local xRet          := .T.

    local oObject       := aParam[1]
    local cIdPonto      := aParam[2]
    local cIdModel      := aParam[3]

    if aParam[2] <> nil
        if cIdPonto == "MODELPOS"
            if empty(M->A6_DVAGE) .or. empty(M->DV_DVCTA)
                help(nil, nil, "MATA070", nil, "DV de agência ou conta em branco!",;
                    1, 0, nil, nil, nil, nil, nil, { "O digito verificador da agência e da conta devem ser preenchidos." })

            xRet    := .F.
            endif
        endif
    endif
return xRet
