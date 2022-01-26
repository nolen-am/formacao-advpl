#include "protheus.ch"
#include "FWMVCDEF.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} MVCSZ7
Fun��o principal para a constru��o da tela de solicita��o de compras 
desenvolvido no Modelo 2 do MVC.
@author  Lenon
@since   18/01/2022
@see     https://tdn.totvs.com/display/framework/FWFormModelStruct - Model
@see     https://tdn.totvs.com/display/framework/FWFormStruct - Model
@see     https://tdn.totvs.com/display/framework/MPFormModel - Model
@see     https://tdn.totvs.com/display/framework/FWBuildFeature - Model
@see     https://tdn.totvs.com/display/framework/FWFormGridModel - Model

@see     https://tdn.totvs.com/display/framework/FWFormViewStruct - View
@see     https://tdn.totvs.com/display/framework/FWFormView - View

@see     https://tdn.totvs.com/display/framework/FWModelActive - User Function GrvSZ7
@see     https://tdn.totvs.com/display/tec/DBSkip - User Function GrvSZ7
@see     https://tdn.totvs.com/pages/viewpage.action?pageId=23889360 - User Function GrvSZ7
/*/
//-------------------------------------------------------------------

User Function MVCSZ7()
    Local aArea         := GetArea()

    Local oBrowse       := FwmBrowse():New()

    oBrowse:SetAlias("SZ7")
    oBrowse:SetDescription("Solicita��o de Compras")
    
    oBrowse:Activate()

    RestArea(aArea)

Return

Static Function MenuDef()
    // Primeira op��o de Menu:
    // Local aRotina       := FWMVCMenu(MVCSZ7)

    // Segunda op��o de Menu:
    Local aRotina       := {}

    ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCSZ7' OPERATION 2 ACCESS 0
    ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION 3 ACCESS 0
    ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCSZ7' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION 5 ACCESS 0

    // Terceira op��o de Menu:
    // Local aRotina       := {}

    // ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_VIEW   ACCESS 0
    // ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_INSERT ACCESS 0
    // ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_UPDATE ACCESS 0
    // ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVCSZ7' OPERATION MODEL_OPERATION_DELETE ACCESS 0

Return aRotina

Static Function ModelDef()
    // Objeto respons�vel pela cria��o da estrutura tempor�ria do cabe�alho
    Local oStCabec      := FWFormModelStruct():New()

    // Objeto respons�vel pela estrutura dos itens
    Local oStItens      := FWFormStruct(1,"SZ7")

    // Variavel que ir� validar a inclus�o/altera��o/exclus�o dos itens na tabela atrav�s da user function u_GrvSZ7()
    Local bVldCom       := {|| u_GrvSZ7()}

    // Objeto principal do MVC, ele tr�s as caracter�sticas do dicion�rio de dados
    // e � o respons�vel pela estrutura de tabelas, campos e registros.
    Local oModel        := MPFormModel():New("MVCSZ7m",/*bPre*/,/*bPos*/, bVldCom /*bCommit*/,/*bCancel*/)

    // Cria��o da tabela tempor�ria que ser� utilizada para representar o cabe�alho:
    //                Alias -  Array com os campos que s�o PK  -   Descri��o
    oStCabec:AddTable("SZ7", {"Z7_FILIAL","Z7_NUM","Z7_ITEM"},"Cabe�alho SZ7")

    // Cria��o dos campos da tabela tempor�ria
    oStCabec:AddField(;
    "Filial",;                                                                                  // [01]  C   Titulo do campo
    "Filial",;                                                                                  // [02]  C   ToolTip do campo
    "Z7_FILIAL",;                                                                               // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_FILIAL")[1],;                                                                    // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                                       // [08]  B   Code-block de valida��o When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .F.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FILIAL,FWxFilial('SZ7'))" ),;   // [11]  B   Code-block de inicializacao do campo
    .T.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                                        // [14]  L   Indica se o campo � virtual

oStCabec:AddField(;
    "Pedido",;                                                                                  // [01]  C   Titulo do campo
    "Pedido",;                                                                                  // [02]  C   ToolTip do campo
    "Z7_NUM",;                                                                                  // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_NUM")[1],;                                                                       // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                                       // [08]  B   Code-block de valida��o When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .F.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_NUM,'')" ),;                    // [11]  B   Code-block de inicializacao do campo
    .T.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                                        // [14]  L   Indica se o campo � virtual

oStCabec:AddField(;
    "Emissao",;                                                                                 // [01]  C   Titulo do campo
    "Emissao",;                                                                                 // [02]  C   ToolTip do campo
    "Z7_EMISSAO",;                                                                              // [03]  C   Id do Field
    "D",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_EMISSAO")[1],;                                                                   // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                                       // [08]  B   Code-block de valida��o When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_EMISSAO,dDataBase)" ),;         // [11]  B   Code-block de inicializacao do campo
    .T.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                                        // [14]  L   Indica se o campo � virtual


oStCabec:AddField(;
    "Fornecedor",;                                                                              // [01]  C   Titulo do campo
    "Fornecedor",;                                                                              // [02]  C   ToolTip do campo
    "Z7_FORNECE",;                                                                              // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_FORNECE")[1],;                                                                   // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                                       // [08]  B   Code-block de valida��o When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FORNECE,'')" ),;                // [11]  B   Code-block de inicializacao do campo
    .F.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                                        // [14]  L   Indica se o campo � virtual

oStCabec:AddField(;
    "Loja",;                                                                                    // [01]  C   Titulo do campo
    "Loja",;                                                                                    // [02]  C   ToolTip do campo
    "Z7_LOJA",;                                                                                 // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_LOJA")[1],;                                                                      // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                                       // [08]  B   Code-block de valida��o When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_LOJA,'')" ),;                   // [11]  B   Code-block de inicializacao do campo
    .F.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                                        // [14]  L   Indica se o campo � virtual

oStCabec:AddField(;
    "Usuario",;                                                                                 // [01]  C   Titulo do campo
    "Usuario",;                                                                                 // [02]  C   ToolTip do campo
    "Z7_USER",;                                                                                 // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_USER")[1],;                                                                      // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de valida��o do campo
    Nil,;                                                                                       // [08]  B   Code-block de valida��o When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigat�rio
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_USER,__cuserid)" ),;            // [11]  B   Code-block de inicializacao do campo
    .F.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma opera��o de update.
    .F.)                                                                                        // [14]  L   Indica se o campo � virtual


    // Nesta etapa iremos tratar a estrutura dos Itens que ser�o utilizados e exibidos no Grid da aplica��o:

    // Modificando Inicializadores Padr�o (MODEL_FIELD_INIT), para n�o dar mensagem de colunas vazias
    oStItens:SetProperty("Z7_NUM",      MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '"*"'))
    oStItens:SetProperty("Z7_USER",     MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '__cUserId')) // Trazer o usu�rio autom�tico
    oStItens:SetProperty("Z7_EMISSAO",  MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'dDatabase')) // Trazer a data autom�tica
    oStItens:SetProperty("Z7_FORNECE",  MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '"*"'))
    oStItens:SetProperty("Z7_LOJA",     MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '"*"'))


    // A partir de agora, faremos a uni�o das estruturas, vinculando o cabe�alho tempor�rio acima com os itens.
    // Tamb�m faremos o v�nculo da estrutura de dados dos itens com o modelo
    oModel:AddFields("SZ7MASTER",,oStCabec) // Fazendo o v�nculo com o oStCabec (cabe�alho com itens tempor�rios)
    oModel:AddGrid("SZ7DETAIL","SZ7MASTER",oStItens,,,,,)

    // Setando a rela��o entre cabe�alho e item, neste ponto, dizemos atrav�s de qual/quais campo(s) o grid est� vinculado com o cabe�alho
    // Primeira forma de fazer:
    aRelations := {}
    aAdd(aRelations,{"Z7_FILIAL",'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial("SZ7"))'})
    aAdd(aRelations,{"Z7_NUM","SZ7->Z7_NUM"})
    oModel:SetRelation("SZ7DETAIL",aRelations,SZ7->(IndexKey(1)))

    // Segunda forma de fazer:
    // oModel:SetRelation('SZ7DETAIL',{{'Z7_FILIAL','Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial("SZ7"))'},{'Z7_NUM','SZ7->Z7_NUM'}},SZ7->(IndexKey(1)))

    // Setando a chave prim�ria, lembrando que, se ela estiver definida no X2_UNICO, faz valer o que est� no X2_UNICO
    oModel:SetPrimaryKey({})

    // � como se fosse a "chave prim�ria do GRID"
    oModel:GetModel("SZ7DETAIL"):SetUniqueline({"Z7_ITEM"}) // o intuito � que este campo n�o se repita

    // Setando a descri��o/t�tulo que ser� exibida no cabe�alho 
    oModel:GetModel("SZ7MASTER"):SetDescription("Cabe�alho da solicita��o de compras.")

    // Setando a descri��o/t�tulo que ser� exibida no grid de itens
    oModel:GetModel("SZ7DETAIL"):SetDescription("Itens da solicita��o de compras.")

    // Finalizando a fun��o ModelDef
    oModel:GetModel("SZ7DETAIL"):SetUseOldGrid(.T.) // Setando o modelo antigo de Grid que permite pegar aHeader e aCols

Return oModel

Static Function ViewDef()
    Local oView         := Nil

    // Fazendo o load do model referente a fun��o/fonte MVCSZ7, desta forma se este model
    // estivesse em um outro fonte, poder�amos utiliza-lo externamente sem a necessidade
    // de reescreve-lo 
    Local oModel        := FwLoadModel("MVCSZ7")

    // Objeto encarregado de montar a estrutura tempor�ria do cabe�alho da View
    Local oStCabec      := FwFormViewStruct():New()

    // Objeto respons�vel por montar a parte de estrutura dos itens/grid
    // Como estamos utilizando FwFormStruct, ele traz a estrutura de TODOS OS CAMPOS, sendo assim
    // caso n�o queira que algum campo seja exibido na grid, devemos remover este campo com RemoveField
    Local oStItens      := FwFormStruct(2,"SZ7")

    // Criando os campos do cabe�alho dentro da estrutura da View
    oStCabec:AddField(;
        "Z7_NUM",;                                                                              // [01]  C   Nome do Campo
        "01",;                                                                                  // [02]  C   Ordem
        "Pedido",;                                                                              // [03]  C   Titulo do campo
        X3Descric('Z7_NUM'),;                                                                   // [04]  C   Descricao do campo
        Nil,;                                                                                   // [05]  A   Array com Help
        "C",;                                                                                   // [06]  C   Tipo do campo
        X3Picture("Z7_NUM"),;                                                                   // [07]  C   Picture
        Nil,;                                                                                   // [08]  B   Bloco de PictTre Var
        Nil,;                                                                                   // [09]  C   Consulta F3
        Iif(INCLUI, .T., .F.),;    	                                                            // [10]  L   Indica se o campo � alteravel
        Nil,;                                                                                   // [11]  C   Pasta do campo
        Nil,;                                                                                   // [12]  C   Agrupamento do campo
        Nil,;                                                                                   // [13]  A   Lista de valores permitido do campo (Combo)
        Nil,;                                                                                   // [14]  N   Tamanho maximo da maior op��o do combo
        Nil,;                                                                                   // [15]  C   Inicializador de Browse
        Nil,;                                                                                   // [16]  L   Indica se o campo � virtual
        Nil,;                                                                                   // [17]  C   Picture Variavel
        Nil)                                                                                    // [18]  L   Indica pulo de linha ap�s o campo

    oStCabec:AddField(;
        "Z7_EMISSAO",;                                                                          // [01]  C   Nome do Campo
        "02",;                                                                                  // [02]  C   Ordem
        "Emissao",;                                                                             // [03]  C   Titulo do campo
        X3Descric('Z7_EMISSAO'),;                                                               // [04]  C   Descricao do campo
        Nil,;                                                                                   // [05]  A   Array com Help
        "D",;                                                                                   // [06]  C   Tipo do campo
        X3Picture("Z7_EMISSAO"),;                                                               // [07]  C   Picture
        Nil,;                                                                                   // [08]  B   Bloco de PictTre Var
        Nil,;                                                                                   // [09]  C   Consulta F3
        Iif(INCLUI, .T., .F.),;                                                                 // [10]  L   Indica se o campo � alteravel
        Nil,;                                                                                   // [11]  C   Pasta do campo
        Nil,;                                                                                   // [12]  C   Agrupamento do campo
        Nil,;                                                                                   // [13]  A   Lista de valores permitido do campo (Combo)
        Nil,;                                                                                   // [14]  N   Tamanho maximo da maior op��o do combo
        Nil,;                                                                                   // [15]  C   Inicializador de Browse
        Nil,;                                                                                   // [16]  L   Indica se o campo � virtual
        Nil,;                                                                                   // [17]  C   Picture Variavel
        Nil)                                                                                    // [18]  L   Indica pulo de linha ap�s o campo

    oStCabec:AddField(;
        "Z7_FORNECE",;                                                                          // [01]  C   Nome do Campo
        "03",;                                                                                  // [02]  C   Ordem
        "Fornecedor",;                                                                          // [03]  C   Titulo do campo
        X3Descric('Z7_FORNECE'),;                                                               // [04]  C   Descricao do campo
        Nil,;                                                                                   // [05]  A   Array com Help
        "C",;                                                                                   // [06]  C   Tipo do campo
        X3Picture("Z7_FORNECE"),;                                                               // [07]  C   Picture
        Nil,;                                                                                   // [08]  B   Bloco de PictTre Var
        "SA2",;                                                                                 // [09]  C   Consulta F3
        Iif(INCLUI, .T., .F.),;                                                                 // [10]  L   Indica se o campo � alteravel
        Nil,;                                                                                   // [11]  C   Pasta do campo
        Nil,;                                                                                   // [12]  C   Agrupamento do campo
        Nil,;                                                                                   // [13]  A   Lista de valores permitido do campo (Combo)
        Nil,;                                                                                   // [14]  N   Tamanho maximo da maior op��o do combo
        Nil,;                                                                                   // [15]  C   Inicializador de Browse
        Nil,;                                                                                   // [16]  L   Indica se o campo � virtual
        Nil,;                                                                                   // [17]  C   Picture Variavel
        Nil)                                                                                    // [18]  L   Indica pulo de linha ap�s o campo

    oStCabec:AddField(;
        "Z7_LOJA",;                                                                             // [01]  C   Nome do Campo
        "04",;                                                                                  // [02]  C   Ordem
        "Loja",;                                                                                // [03]  C   Titulo do campo
        X3Descric('Z7_LOJA'),;                                                                  // [04]  C   Descricao do campo
        Nil,;                                                                                   // [05]  A   Array com Help
        "C",;                                                                                   // [06]  C   Tipo do campo
        X3Picture("Z7_LOJA"),;                                                                  // [07]  C   Picture
        Nil,;                                                                                   // [08]  B   Bloco de PictTre Var
        Nil,;                                                                                   // [09]  C   Consulta F3
        Iif(INCLUI, .T., .F.),;                                                                 // [10]  L   Indica se o campo � alteravel
        Nil,;                                                                                   // [11]  C   Pasta do campo
        Nil,;                                                                                   // [12]  C   Agrupamento do campo
        Nil,;                                                                                   // [13]  A   Lista de valores permitido do campo (Combo)
        Nil,;                                                                                   // [14]  N   Tamanho maximo da maior op��o do combo
        Nil,;                                                                                   // [15]  C   Inicializador de Browse
        Nil,;                                                                                   // [16]  L   Indica se o campo � virtual
        Nil,;                                                                                   // [17]  C   Picture Variavel
        Nil)                                                                                    // [18]  L   Indica pulo de linha ap�s o campo

    oStCabec:AddField(;
        "Z7_USER",;                                                                             // [01]  C   Nome do Campo
        "05",;                                                                                  // [02]  C   Ordem
        "Usu�rio",;                                                                             // [03]  C   Titulo do campo
        X3Descric('Z7_USER'),;                                                                  // [04]  C   Descricao do campo
        Nil,;                                                                                   // [05]  A   Array com Help
        "C",;                                                                                   // [06]  C   Tipo do campo
        X3Picture("Z7_USER"),;                                                                  // [07]  C   Picture
        Nil,;                                                                                   // [08]  B   Bloco de PictTre Var
        Nil,;                                                                                   // [09]  C   Consulta F3
        .F.,;                                                                                   // [10]  L   Indica se o campo � alteravel
        Nil,;                                                                                   // [11]  C   Pasta do campo
        Nil,;                                                                                   // [12]  C   Agrupamento do campo
        Nil,;                                                                                   // [13]  A   Lista de valores permitido do campo (Combo)
        Nil,;                                                                                   // [14]  N   Tamanho maximo da maior op��o do combo
        Nil,;                                                                                   // [15]  C   Inicializador de Browse
        Nil,;                                                                                   // [16]  L   Indica se o campo � virtual
        Nil,;                                                                                   // [17]  C   Picture Variavel
        Nil)                                                                                    // [18]  L   Indica pulo de linha ap�s o campo


    // Removendo os campos que n�o dever�o ser exibidos na grid
    oStItens:RemoveField("Z7_NUM")
    oStItens:RemoveField("Z7_EMISSAO")
    oStItens:RemoveField("Z7_FORNECE")            
    oStItens:RemoveField("Z7_LOJA")      
    oStItens:RemoveField("Z7_USER") 

    /*
    Agora vamos para a segunda parte da ViewDef, onde faremos a conex�o das estruturas de dados montadas acima
    com o objeto oView, e passaremos para a nossa aplica��o todas as caracter�sticas visuais do projeto
    */

    // Instanciando a classe FwFormView para o objeto oView
    oView := FwFormView():New()

    // Passando para o objeto oView o modelo de dados que quero atrelar a ele Modelo + Visualiza��o
    oView:SetModel(oModel)

    // Montando a estrutura de visualiza��o do Master e do Detalhe (Cabe�alho e Itens)
    oView:AddField("VIEW_SZ7M",oStCabec,"SZ7MASTER") // Cabe�alho/Master
    oView:AddGrid("VIEW_SZ7D", oStItens,"SZ7DETAIL") // Itens/Grid

    // Criamos a tela, dividindo proporcionalmente o tamanho do cabe�alho e o tamanho do Grid
    oView:CreateHorizontalBox("CABEC",30)
    oView:CreateHorizontalBox("GRID", 60)

    // Abaixo, indicamos para onde vai cada View criada, VIEW_SZ7M ir� para Cabec e VIEW_SZ7D ir� para Grid 
    // Sendo assim, associamos o View a cada Box criado
    oView:SetOwnerView("VIEW_SZ7M","CABEC") 
    oView:SetOwnerView("VIEW_SZ7D","GRID") 

    // Ativando os t�tulos de cada View/Box criado
    oView:EnableTitleView("VIEW_SZ7M","Cabe�alho Solicita��o de Compras")
    oView:EnableTitleView("VIEW_SZ7D","Itens de Solicitacao de Compras")

    /*
    Metodo que seta um bloco de c�digo para verificar se a janela deve ou n�o
    ser fechada ap�s a execu��o do bot�o "OK".
    */
    oView:SetCloseOnOk({|| .T.})

Return oView

//-------------------------------------------------------------------
/*/{Protheus.doc} User Function GrvSZ7
Fun��o respons�vel por validar a inclus�o/altera��o/exclus�o dos itens na tabela.
@author  Lenon
@since   19/01/2022
/*/
//-------------------------------------------------------------------
User Function GrvSZ7()
    Local lRet          := .T.
    Local aArea         := GerArea()

    // Captura o modelo ativo durante a execu��o da fun��o, no caso o objeto do modelo (oModel)
    // que est� sendo manipulado 
    Local oModel        := FwModelActive()
    
    // Carrega o modelo de dados do master/cabe�alho com base no model geral que foi capturado acima
    Local oModelCabe    := oModel:GetModel("SZ7MASTER")

    // Carrega o modelo de dados do detail/itens com base no model geral que foi capturado acima.
    // Este modelo ser� respons�vel pela estrutura do aHeader e aCols da Grid.
    Local oModelItem    := oModel:GetModel("SZ7DETAIL") 

    // Capturando os valores que est�o no cabe�alho atrav�s do m�todo GetValue()
    // Armazenamos os valores dos campos dentro das vari�veis que por sua vez ser�o
    // utilizadas para gravar o que foi digitado na view para dentro do banco de dados.
    Local cFilSZ7       := oModelCabe:GetValue("Z7_FILIAL")
    Local cNum          := oModelCabe:GetValue("Z7_NUM")
    Local dEmissao      := oModelCabe:GetValue("Z7_EMISSAO")
    Local cFornece      := oModelCabe:GetValue("Z7_FORNECE")
    Local cLoja         := oModelCabe:GetValue("Z7_LOJA")
    Local cUser         := oModelCabe:GetValue("Z7_USER")

    // Vari�veis que far�o a captura dos valores com base no aHeader e no aCols do Grid
    Local aHeaderAux    := oModelItem:aHeader
    Local aColsAux      := oModelItem:aCols


    // Nesta etapa iremos pegar a posi��o de cada campo dentro do Grid
    // Lembrando que neste caso s� precisamos pegar a posi��o dos campos que n�o est�o no cabe�alho
    // somente os itens da Grid
    Local nPosItem      := aScan(aHeaderAux, {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_ITEM")})
    Local nPosProd      := aScan(aHeaderAux, {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_PRODUTO")})
    Local nPosQtd       := aScan(aHeaderAux, {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_QUANT")})
    Local nPosPrc       := aScan(aHeaderAux, {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_PRECO")})
    Local nPosTotal     := aScan(aHeaderAux, {|x| AllTrim(Upper(x[2])) == AllTrim("Z7_TOTAL")})

    // Pegando a linha atual em que o usu�rio est� posicionado para utilizar no for
    Local nLinAtu       := 0

    // Identificando qual tipo de opera��o que o usu�rio est� tentando realizar (inclus�o, altera��o ou exclus�o)
    Local cOption       := oModelCabe:GetOperation()

    // Selecionando a �rea que ser� manipulada
    DbSelectArea("SZ7")
    SZ7->(DbSetOrder(1))

    if cOption == MODEL_OPERATION_INSERT
        // Antes de fazer o insert, verificaremos se a linha est� deletada
        for nLinAtu := 1 to Len(aColsAux)
            if !aColsAux[nLinhaAtu][Len(aColsAux)+1] // express�o l�gica que ir� verificar se uma linha est� exclu�da no aCols
                RecLock("SZ7", .T.)
                    // Fazendo a grava��o dos dados do cabe�alho:
                    Z7_FILIAL       := cFilSZ7
                    Z7_NUM          := cNum
                    Z7_EMISSAO      := dEmissao
                    Z7_FORNECE      := cFornece
                    Z7_LOJA         := cLoja
                    Z7_USER         := cUser

                    // Fazendo a grava��o dos dados dos itens:
                    Z7_ITEM         := aColsAux[nLinhaAtu, nPosItem]
                    Z7_PRODUTO      := aColsAux[nLinhaAtu, nPosProd]
                    Z7_QUANT        := aColsAux[nLinhaAtu, nPosQtd]
                    Z7_PRECO        := aColsAux[nLinhaAtu, nPosPrc]
                    Z7_TOTAL        := aColsAux[nLinhaAtu, nPosTotal]
                
                SZ7->(MsUnlock())
            endif
        next nLinAtu

    elseif cOption == MODEL_OPERATION_UPDATE
        for nLinAtu := 1 to Len(aColsAux)
            if aColsAux[nLinhaAtu][Len(aColsAux)+1] // express�o l�gica que ir� verificar se uma linha est� exclu�da no aCols
                // Precisamos verificar se a linha est� deletada ou se est� inclu�da no banco
                SZ7->(DbSetOrder(2))
                if SZ7->(DbSeek(cFilSZ7 + cNum + aColsAux[nLinhaAtu, nPosItem])) // faz a busca pelo item e se encontrar, dever� deletar do banco
                    RecLock("SZ7", .F.)
                        DbDelete()
                    SZ7->(MsUnlock())
                endif
            else // Se a linha n�o estiver exclu�da, fazemos a altera��o
            // Embora seja uma altera��o, devemos poder adicionar novos itens no pedido
            // sendo assim, precisaremos validar se estes itens existem no banco ou n�o
            // caso eles n�o existam, faremos a sua inclus�o
                SZ7->(DbSetOrder(2))
                if SZ7->(DbSeek(cFilSZ7 + cNum + aColsAux[nLinhaAtu, nPosItem])) // faz a busca pelo item e se encontrar, far� uma altrera��o
                    RecLock("SZ7", .F.)
                    Z7_FILIAL       := cFilSZ7
                    Z7_NUM          := cNum
                    Z7_EMISSAO      := dEmissao
                    Z7_FORNECE      := cFornece
                    Z7_LOJA         := cLoja
                    Z7_USER         := cUser

                    Z7_ITEM         := aColsAux[nLinhaAtu, nPosItem]
                    Z7_PRODUTO      := aColsAux[nLinhaAtu, nPosProd]
                    Z7_QUANT        := aColsAux[nLinhaAtu, nPosQtd]
                    Z7_PRECO        := aColsAux[nLinhaAtu, nPosPrc]
                    Z7_TOTAL        := aColsAux[nLinhaAtu, nPosTotal]
                
                    SZ7->(MsUnlock())
                else // se n�o encontramos o item para alterar, � porque n�o est� na base de dados, ent�o deveremos incluir este item
                    RecLock("SZ7", .T.)
                    Z7_FILIAL       := cFilSZ7
                    Z7_NUM          := cNum
                    Z7_EMISSAO      := dEmissao
                    Z7_FORNECE      := cFornece
                    Z7_LOJA         := cLoja
                    Z7_USER         := cUser

                    Z7_ITEM         := aColsAux[nLinhaAtu, nPosItem]
                    Z7_PRODUTO      := aColsAux[nLinhaAtu, nPosProd]
                    Z7_QUANT        := aColsAux[nLinhaAtu, nPosQtd]
                    Z7_PRECO        := aColsAux[nLinhaAtu, nPosPrc]
                    Z7_TOTAL        := aColsAux[nLinhaAtu, nPosTotal]
                
                    SZ7->(MsUnlock())
                endif
            endif
        next nLinAtu

    elseif cOption == MODEL_OPERATION_DELETE
        SZ7->(DbSetOrder(1))

        WHILE !SZ7->(EOF()) .AND. SZ7->Z7_NUM - cNum .AND. SZ7->Z7_FILIAL = cFilSZ7
            RecLock("SZ7", .F.)
                DbDelete()
            SZ7->(MsUnlock())
        SZ7->(DbSkip())
        ENDDO
    endif

    RestArea(aArea)
Return lRet
