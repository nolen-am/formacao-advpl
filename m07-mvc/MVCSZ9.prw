#include "protheus.ch"
#include "FWMVCDEF.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} MVCSZ9
Primeiro projeto utilizando o MVC - Modelo 1
@author  Lenon
@since   17/01/2022
@see     https://tdn.totvs.com/display/framework/FWFormStruct
@see     https://tdn.totvs.com/display/framework/MPFormModel
@see     https://tdn.totvs.com/display/framework/FWLoadModel
@see     https://tdn.totvs.com/display/framework/FWFormView
/*/
//-------------------------------------------------------------------


// Preparando o Browse atrav�s da User Function
User Function MVCSZ9()
    Local aArea         := GetNextAlias()
    Local oBrowseSZ9

    oBrowseSZ9          := FwmBrowse():New()

    oBrowseSZ9:SetAlias("SZ9")

    oBrowseSZ9:SetDescription("Modelo 1 - Tela de Cadastro")

    // oBrowseSZ9:SetOnlyFields( {"Z9_CODIGO", "Z9_NOME", "Z9_SEXO", "Z9_STATUS"} )

    oBrowseSZ9:AddLegend("SZ9->Z9_STATUS == '1'", "GREEN", "Cadastro Ativo")
    oBrowseSZ9:AddLegend("SZ9->Z9_STATUS == '2'", "RED", "Cadastro Inativo")

    oBrowseSZ9:DisableDetails()

    oBrowseSZ9:Activate()

    RestArea()

Return

// ---------------------------- MenuDef - Op��es do Menu (aRotina) ------------------------
Static Function MenuDef()
    Local aRotina       := {}  

    /*
    Operation:
        1. Pesquisar
        2. Visualizar
        3. Incluir
        4. Alterar/Editar
        5. Excluir
        6. Outras fun��es
        7. Copiar
    */

    // Primeira forma de fazer o MenuDef:
    ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCSZ9' OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCSZ9' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Editar'     ACTION 'VIEWDEF.MVCSZ9' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVCSZ9' OPERATION 5 ACCESS 0
    ADD OPTION aRotina TITLE 'Legenda'    ACTION 'u_SZ9LEG'       OPERATION 6 ACCESS 0
    ADD OPTION aRotina TITLE 'Sobre'      ACTION 'u_SZ9SOBRE'     OPERATION 6 ACCESS 0

    // // Segunda forma de fazer o MenuDef:
    // aRotinaAut         := FWMVCMenu("MVCSZ9") // -> Recebe os menus automaticamente
    // aRotina            := {}

    // // Inserindo itens opcionais nas "Outras op��es" do MenuDef
    // ADD OPTION aRotina TITLE 'Legenda'    ACTION 'u_SZ9LEG'       OPERATION 6 ACCESS 0
    // ADD OPTION aRotina TITLE 'Sobre'      ACTION 'u_SZ9SOBRE'     OPERATION 6 ACCESS 0

    // For n := 1 To Len(aRotinaAut)
    //     aAdd(aRotina, aRotinaAut[n])
    // Next n

Return oMenu


// -------------------------------- ModelDef - Regras de neg�cio --------------------------
Static Function ModelDef()
    Local oModel        := Nil

    // Buscando a estrutura (tabela e caracteristicas dos campos) da SZ9 no dicion�rio de dados, a qual iremos utilizar no modelo
    Local oStructSZ9    := FWFormStruct(1, "ZA9") // primeiro parametro setado como 1 pois trata-se do Model

    // Instanciando a classe MPFormModel na variavel
    oModel              := MPFormModel():New("MVCSZ9", /*bPre*/, /*bPos*/, /*bCommit*/, /*bCancel*/)

    // Atribuindo formul�rio para o modelo de dados:
    // O parametro "Owner" s� dever� ser utilizado nos modelos 2 e 3, o modelo 1 trabalha apenas com uma estrutura
    // de dados, portanto, ele n�o tem nenhum owner
    oModel:AddFields("FORMSZ9", /*Owner*/, oStructSZ9)

    // Definindo chave prim�ria para a aplica��o:
    // Se a tabela do submodelo for um metadado e possuir chave prim�ria informada na tabela SX2, n�o ser� necess�rio
    // fazer uso desse m�todo pois o MVC ir� considerar a chave que est� declarada no campo "X2_UNICO" na tabela SX2
    oModel:SetPrimaryKey( {"Z9_FILIAL", "Z9_CODIGO"} )

    // Adicionando descri��o sobre o objetivo do modelo
    oModel:SetDescription("Modelo de dados do cadastro")

    // Fazendo um get na estrutura da tabela SZ9 e adicionando uma descri��o a ela
    oModel:GetModel("FORMSZ9"):SetDescription("Formul�rio de Cadastro")

Return oModel


// --------------------------------- ViewDef - Interface ---------------------------------
Static Function ViewDef()
    Local oView         := Nil

    // Chamando a fun��o que retorna o objeto model de determinado fonte
    Local oModel        := FWLoadModel("MVCSZ9")

    // Buscando a estrutura (tabela e caracteristicas dos campos) da SZ9 no dicion�rio de dados, a qual iremos utilizar no modelo
    Local oStructSZ9    := FWFormStruct(2, "ZA9") // primeiro parametro setado como 2 pois trata-se da View

    // Instando a classe FwFormView para construir a parte da interface dos dados
    oView               := FwFormView():New()

    // Passando o modelo para a View para que ela saiba qual modelo dever� seguir
    oView:SetModel(oModel)

    // Removendo campos da View para que o usu�rio n�o visualize
    oView:RemoveField("Z9_ESTCIV")

    // Atribuindo a estrutura de dados a camada de vis�o
    oView:AddField("VIEWSZ9", oStructSZ9, "FORMSZ9")

    // Criando um container com o ID "Tela"
    oView:CreateHorizontalBox("TELASZ9", 100)

    // Criando um t�tulo para o formul�rio (pode ser usado somente para uma grid ou field)
    oView:EnableTitleView("VIEWSZ9", "Visualiza��o dos cadastros.")

    // Valida��o para permitir ou n�o que a janela seja fechada ao clicar em "ok" ou "confirmar"
    // Ao passar o parametro como true, ir� for�ar o fechamento da janela
    oView:SetCloseOnOk({||.T.})

    // Relacionando um formul�rio ou uma pasta com um box visual
    oView:SetOwnerView("VIEWSZ9", "TELASZ9")

Return oView


// Fun��o respons�vel por adicionar legendas as "Outras op��es" dispon�vel no browse
User Function SZ9LEG()
    Local aLegenda      := {}

    aAdd(aLegenda, { "BR_VERDE", "Ativo" })
    aAdd(aLegenda, { "BR_VERMELHO", "Inativo" })

    BrwLegenda("Cadastros", "Ativos/Inativos", aLegenda)

Return aLegenda

// Adicionando mais um exemplo de op��o no menu de "Outras op��es"
User Function SZ9SOBRE()
    Local cSobre        := "<b>Primeira tela em MVC - Modelo 1"

    MsgInfo(cSobre)

Return
