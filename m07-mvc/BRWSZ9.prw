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
    Local oBrowseSZ9 // Variavel do tipo objeto que receberá a instância da classe FmwBrowse

    // Criando nova instância do objeto FwmBrowse
    oBrowseSZ9      := FwmBrowse():New()

    // Passando como parametro a tabela que queremos exibir no Browse
    oBrowseSZ9:SetAlias("SZ9")

    // Título que será exibido no topo do Browse
    oBrowseSZ9:SetDescription("Meu primeiro Browse - Tela de Cadastro")

    // Alterando a exibição padrão do Grid para que sejam exibidos somente os campos passados por parâmetro
    oBrowseSZ9:SetOnlyFields( {"Z9_CODIGO", "Z9_NOME", "Z9_SEXO", "Z9_STATUS"} )

    // Adicionando legendas ao Browse
    oBrowseSZ9:AddLegend("SZ9->Z9_STATUS == '1'", "GREEN", "Cadastro Ativo")
    oBrowseSZ9:AddLegend("SZ9->Z9_STATUS == '2'", "RED", "Cadastro Inativo")

    // Passando filtro padrão para o Browse para que somente os registros especificados no filtro sejam exibidos
    // Obs.: Ao fazer isso não será possível remover o filtro padrão durante a execução do Browse
    oBrowseSZ9:SetFilterDefault("Z9_STATUS == '1'")

    // Ocultando as informações exibidas na parte inferior da tela ("mostrar detalhes")
    oBrowseSZ9:DisableDetails()

    // Ativando o Browse
    oBrowseSZ9:Activate()

    // Liberando a área
    RestArea()

Return
