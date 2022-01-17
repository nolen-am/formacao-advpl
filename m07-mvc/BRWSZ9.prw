#include "protheus.ch"
#include "FWMVCDEF.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} BRWSZ9
@author  Lenon
@since   14/01/2022
@see     https://tdn.totvs.com/pages/releaseview.action?pageId=62390842
/*/
//-------------------------------------------------------------------

User Function BRWSZ9()
    Local aArea     := GetNextAlias()
    Local oBrowseSZ9 // Variavel do tipo objeto que receber� a inst�ncia da classe FmwBrowse

    // Criando nova inst�ncia do objeto FwmBrowse
    oBrowseSZ9      := FwmBrowse():New()

    // Passando como parametro a tabela que queremos exibir no Browse
    oBrowseSZ9:SetAlias("SZ9")

    // T�tulo que ser� exibido no topo do Browse
    oBrowseSZ9:SetDescription("Meu primeiro Browse - Tela de Cadastro")

    // Alterando a exibi��o padr�o do Grid para que sejam exibidos somente os campos passados por par�metro
    oBrowseSZ9:SetOnlyFields( {"Z9_CODIGO", "Z9_NOME", "Z9_SEXO", "Z9_STATUS"} )

    // Adicionando legendas ao Browse
    oBrowseSZ9:AddLegend("SZ9->Z9_STATUS == '1'", "GREEN", "Cadastro Ativo")
    oBrowseSZ9:AddLegend("SZ9->Z9_STATUS == '2'", "RED", "Cadastro Inativo")

    // Passando filtro padr�o para o Browse para que somente os registros especificados no filtro sejam exibidos
    // Obs.: Ao fazer isso n�o ser� poss�vel remover o filtro padr�o durante a execu��o do Browse
    oBrowseSZ9:SetFilterDefault("Z9_STATUS == '1'")

    // Ocultando as informa��es exibidas na parte inferior da tela ("mostrar detalhes")
    oBrowseSZ9:DisableDetails()

    // Ativando o Browse
    oBrowseSZ9:Activate()

    // Liberando a �rea
    RestArea()

Return
