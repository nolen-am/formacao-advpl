#include "protheus.ch"
#include "FWMVCDEF.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} MVCSZ7
Fun��o principal para a constru��o da tela de solicita��o de compras 
desenvolvido no Modelo 2 do MVC.
@author  Lenon
@since   18/01/2022
@see     https://tdn.totvs.com/display/framework/FWFormModelStruct
@see     https://tdn.totvs.com/display/framework/FWFormStruct
@see     https://tdn.totvs.com/display/framework/MPFormModel
@see     https://tdn.totvs.com/display/framework/FWBuildFeature
@see     https://tdn.totvs.com/display/framework/FWFormGridModel
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

// Static Function MenuDef()
    // to-do
// Return oMenu

Static Function ModelDef()
    // Objeto respons�vel pela cria��o da estrutura tempor�ria do cabe�alho
    Local oStCabec      := FWFormModelStruct():New()

    // Objeto respons�vel pela estrutura dos itens
    Local oStItens      := FWFormStruct(1,"SZ7")

    // Objeto principal do MVC, ele tr�s as caracter�sticas do dicion�rio de dados
    // e � o respons�vel pela estrutura de tabelas, campos e registros.
    Local oModel        := MPFormModel("MVCSZ7m")

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


    // Nesta etapa vamos tratar a estrutura dos Itens, que ser�o utilizados e exibidos no Grid da aplica��o

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

// Static Function ViewDef()
    // to-do
// Return oView
