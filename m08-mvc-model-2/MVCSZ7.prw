#include "protheus.ch"
#include "FWMVCDEF.ch"

//-------------------------------------------------------------------
/*/{Protheus.doc} MVCSZ7
Função principal para a construção da tela de solicitação de compras 
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
    oBrowse:SetDescription("Solicitação de Compras")
    
    oBrowse:Activate()

    RestArea(aArea)

Return

// Static Function MenuDef()
    // to-do
// Return oMenu

Static Function ModelDef()
    // Objeto responsável pela criação da estrutura temporária do cabeçalho
    Local oStCabec      := FWFormModelStruct():New()

    // Objeto responsável pela estrutura dos itens
    Local oStItens      := FWFormStruct(1,"SZ7")

    // Objeto principal do MVC, ele trás as características do dicionário de dados
    // e é o responsável pela estrutura de tabelas, campos e registros.
    Local oModel        := MPFormModel("MVCSZ7m")

    // Criação da tabela temporária que será utilizada para representar o cabeçalho:
    //                Alias -  Array com os campos que são PK  -   Descrição
    oStCabec:AddTable("SZ7", {"Z7_FILIAL","Z7_NUM","Z7_ITEM"},"Cabeçalho SZ7")

    // Criação dos campos da tabela temporária
    oStCabec:AddField(;
    "Filial",;                                                                                  // [01]  C   Titulo do campo
    "Filial",;                                                                                  // [02]  C   ToolTip do campo
    "Z7_FILIAL",;                                                                               // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_FILIAL")[1],;                                                                    // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de validação do campo
    Nil,;                                                                                       // [08]  B   Code-block de validação When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .F.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigatório
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FILIAL,FWxFilial('SZ7'))" ),;   // [11]  B   Code-block de inicializacao do campo
    .T.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma operação de update.
    .F.)                                                                                        // [14]  L   Indica se o campo é virtual

oStCabec:AddField(;
    "Pedido",;                                                                                  // [01]  C   Titulo do campo
    "Pedido",;                                                                                  // [02]  C   ToolTip do campo
    "Z7_NUM",;                                                                                  // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_NUM")[1],;                                                                       // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de validação do campo
    Nil,;                                                                                       // [08]  B   Code-block de validação When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .F.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigatório
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_NUM,'')" ),;                    // [11]  B   Code-block de inicializacao do campo
    .T.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma operação de update.
    .F.)                                                                                        // [14]  L   Indica se o campo é virtual

oStCabec:AddField(;
    "Emissao",;                                                                                 // [01]  C   Titulo do campo
    "Emissao",;                                                                                 // [02]  C   ToolTip do campo
    "Z7_EMISSAO",;                                                                              // [03]  C   Id do Field
    "D",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_EMISSAO")[1],;                                                                   // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de validação do campo
    Nil,;                                                                                       // [08]  B   Code-block de validação When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigatório
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_EMISSAO,dDataBase)" ),;         // [11]  B   Code-block de inicializacao do campo
    .T.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma operação de update.
    .F.)                                                                                        // [14]  L   Indica se o campo é virtual


oStCabec:AddField(;
    "Fornecedor",;                                                                              // [01]  C   Titulo do campo
    "Fornecedor",;                                                                              // [02]  C   ToolTip do campo
    "Z7_FORNECE",;                                                                              // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_FORNECE")[1],;                                                                   // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de validação do campo
    Nil,;                                                                                       // [08]  B   Code-block de validação When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigatório
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_FORNECE,'')" ),;                // [11]  B   Code-block de inicializacao do campo
    .F.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma operação de update.
    .F.)                                                                                        // [14]  L   Indica se o campo é virtual

oStCabec:AddField(;
    "Loja",;                                                                                    // [01]  C   Titulo do campo
    "Loja",;                                                                                    // [02]  C   ToolTip do campo
    "Z7_LOJA",;                                                                                 // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_LOJA")[1],;                                                                      // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de validação do campo
    Nil,;                                                                                       // [08]  B   Code-block de validação When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigatório
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_LOJA,'')" ),;                   // [11]  B   Code-block de inicializacao do campo
    .F.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma operação de update.
    .F.)                                                                                        // [14]  L   Indica se o campo é virtual

oStCabec:AddField(;
    "Usuario",;                                                                                 // [01]  C   Titulo do campo
    "Usuario",;                                                                                 // [02]  C   ToolTip do campo
    "Z7_USER",;                                                                                 // [03]  C   Id do Field
    "C",;                                                                                       // [04]  C   Tipo do campo
    TamSX3("Z7_USER")[1],;                                                                      // [05]  N   Tamanho do campo
    0,;                                                                                         // [06]  N   Decimal do campo
    Nil,;                                                                                       // [07]  B   Code-block de validação do campo
    Nil,;                                                                                       // [08]  B   Code-block de validação When do campo
    {},;                                                                                        // [09]  A   Lista de valores permitido do campo
    .T.,;                                                                                       // [10]  L   Indica se o campo tem preenchimento obrigatório
    FwBuildFeature( STRUCT_FEATURE_INIPAD, "Iif(!INCLUI,SZ7->Z7_USER,__cuserid)" ),;            // [11]  B   Code-block de inicializacao do campo
    .F.,;                                                                                       // [12]  L   Indica se trata-se de um campo chave
    .F.,;                                                                                       // [13]  L   Indica se o campo pode receber valor em uma operação de update.
    .F.)                                                                                        // [14]  L   Indica se o campo é virtual


    // Nesta etapa vamos tratar a estrutura dos Itens, que serão utilizados e exibidos no Grid da aplicação

    // Modificando Inicializadores Padrão (MODEL_FIELD_INIT), para não dar mensagem de colunas vazias
    oStItens:SetProperty("Z7_NUM",      MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '"*"'))
    oStItens:SetProperty("Z7_USER",     MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '__cUserId')) // Trazer o usuário automático
    oStItens:SetProperty("Z7_EMISSAO",  MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'dDatabase')) // Trazer a data automática
    oStItens:SetProperty("Z7_FORNECE",  MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '"*"'))
    oStItens:SetProperty("Z7_LOJA",     MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, '"*"'))


    // A partir de agora, faremos a união das estruturas, vinculando o cabeçalho temporário acima com os itens.
    // Também faremos o vínculo da estrutura de dados dos itens com o modelo
    oModel:AddFields("SZ7MASTER",,oStCabec) // Fazendo o vínculo com o oStCabec (cabeçalho com itens temporários)
    oModel:AddGrid("SZ7DETAIL","SZ7MASTER",oStItens,,,,,)

    // Setando a relação entre cabeçalho e item, neste ponto, dizemos através de qual/quais campo(s) o grid está vinculado com o cabeçalho
    // Primeira forma de fazer:
    aRelations := {}
    aAdd(aRelations,{"Z7_FILIAL",'Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial("SZ7"))'})
    aAdd(aRelations,{"Z7_NUM","SZ7->Z7_NUM"})
    oModel:SetRelation("SZ7DETAIL",aRelations,SZ7->(IndexKey(1)))

    // Segunda forma de fazer:
    // oModel:SetRelation('SZ7DETAIL',{{'Z7_FILIAL','Iif(!INCLUI, SZ7->Z7_FILIAL, FWxFilial("SZ7"))'},{'Z7_NUM','SZ7->Z7_NUM'}},SZ7->(IndexKey(1)))

    // Setando a chave primária, lembrando que, se ela estiver definida no X2_UNICO, faz valer o que está no X2_UNICO
    oModel:SetPrimaryKey({})

    // É como se fosse a "chave primária do GRID"
    oModel:GetModel("SZ7DETAIL"):SetUniqueline({"Z7_ITEM"}) // o intuito é que este campo não se repita

    // Setando a descrição/título que será exibida no cabeçalho 
    oModel:GetModel("SZ7MASTER"):SetDescription("Cabeçalho da solicitação de compras.")

    // Setando a descrição/título que será exibida no grid de itens
    oModel:GetModel("SZ7DETAIL"):SetDescription("Itens da solicitação de compras.")

    // Finalizando a função ModelDef
    oModel:GetModel("SZ7DETAIL"):SetUseOldGrid(.T.) // Setando o modelo antigo de Grid que permite pegar aHeader e aCols

Return oModel

// Static Function ViewDef()
    // to-do
// Return oView
