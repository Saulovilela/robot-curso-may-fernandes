*** Settings ***
Library            SeleniumLibrary


*** Variables ***
${BROWSER}    chrome
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICO}    //*[@id="nav-xshop"]/a[7]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]



*** Keywords ***

Abrir o navegador
    Open Browser 	browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser
    

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Sleep    25
    Wait Until Element Is Visible    locator=${MENU_ELETRONICO}
Entrar no menu "Eletronicos"
    Click Element    locator=${MENU_ELETRONICO}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains   text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar o titulo da pagina fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']
    

Digitar o nome do produto "${PRODUTO_XBOX_SERIES_S}" no campo de pesquisa   
    Input Text    twotabsearchtextbox    ${PRODUTO_XBOX_SERIES_S}
Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible   locator=(//span[contains(.,'${PRODUTO}')])[3]
    
#Gherkin Steps
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletronicos"
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar o titulo da pagina fica "Eletrônicos e Tecnologia | Amazon.com.br"
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome do produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar o titulo da pagina fica "Amazon.com.br : Xbox Series S"
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"