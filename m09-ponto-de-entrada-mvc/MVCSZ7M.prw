#include "protheus"

//-------------------------------------------------------------------
/*/{Protheus.doc} MVCSZ7M
description
@author  Lenon
@since   27/01/2022
/*/
//-------------------------------------------------------------------

user function MVCSZ7M()
    local aParam        := PARAMIXB
    local xRet          := .T.

    local oObject       := aParam[1]
    local cIdPonto      := aParam[2]
    local cIdModel      := aParam[3]

    if aParam[2] <> nil
        if cIdPonto == "FORMLINEPOS"
            if FWFldGet("Z7_QUANT",/*nLinha*/,/*oModel*/,/*.T.*/) > 10
                help(nil, nil, "QUANT>10", nil, "Quantidade não permitida",;
                    1, 0, nil, nil, nil, nil, nil, { "Atenção! Neste período de pandemia, limitamos a quantidade de compra em até 10 unidades." })

                xRet    := .F.
            endif
        endif

    endif

return xRet
