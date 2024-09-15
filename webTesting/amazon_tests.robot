*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br 
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 1 - Acesso ao menu "Eletronicos"
    [Documentation]  Esse teste verifica o menu eletronico do site da Amazon.com.br
    ...              E verifica a categoria "Computadores e Informática"
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletronicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar o titulo da pagina fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    
Caso de teste 2 - Busca de produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome do produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"




