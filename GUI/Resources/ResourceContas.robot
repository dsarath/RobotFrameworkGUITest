*** Settings ***
Library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  SeleniumLibrary
Library  String
Library  Collections

*** Variable ***
${BTNCONTAS}                      //a[@class='dropdown-toggle']
${BTNLISTAR}                      /../ul/li/*[contains(text(),'Listar')]
${BTNADICIONAR}                   /../ul/li/*[contains(text(),'Adicionar')]
${INPUTNAME}                      id=nome
${BTNSAVE}                        //button[contains(text(),'Salvar')]
${ADDCONTAFORM}                   //form[@action='/salvarConta']
${CONTASLIST}                     //table[@id='tabelaContas']
${CONTAITEM}                      //td[contains(text(),'\${NAME}')]
${CONTAROW}                       //tr//td[count(a)=2]
${BTNEDITAR}                      ${CONTAITEM}/../td[count(a)=2]/a[starts-with(@href, '/editarConta')]
${BTNREMOVER}                     ${CONTAITEM}/../td[count(a)=2]/a[starts-with(@href, '/removerConta')]
${REGISTERCONTAOKMESSAGE}         //div[@role='alert' and contains(text(),'Conta adicionada com sucesso!')]
${EDITCONTAOKMESSAGE}             //div[@role='alert' and contains(text(),'Conta alterada com sucesso!')]



*** Keywords ***      
EnterContasRegisterForm
  Click Element                        ${BTNCONTAS}
  Click Element                        ${BTNCONTAS}${BTNADICIONAR}
  Wait Until Element Is Visible        ${ADDCONTAFORM}

EnterContasList
  Click Element                        ${BTNCONTAS}
  Click Element                        ${BTNCONTAS}${BTNLISTAR}
  Wait Until Element Is Visible        ${CONTASLIST}

IsAccountRegisteredOK
  Wait Until Element Is Visible        ${REGISTERCONTAOKMESSAGE}

IsAccountEditedOK
  Wait Until Element Is Visible        ${EDITCONTAOKMESSAGE}

EditConta
  [Arguments]       ${NAME}
  ${Locator}=    Replace Variables     ${BTNEDITAR}
  Click Element                        ${Locator}
  Wait Until Element Is Visible        ${ADDCONTAFORM}

RemoveConta
  [Arguments]       ${NAME}
  ${Locator}=    Replace Variables     ${BTNREMOVER}
  Click Element                        ${Locator}
  Wait Until Element Is Not Visible    ${CONTAITEM}

ValidateListActions
  @{Elements}=                  Get WebElements          ${CONTAROW}
  :FOR    ${Element}            IN    @{Elements}
  \       Element Should Be Visible    ${Element}/a[starts-with(@href, '/removerConta')]
  \       Element Should Be Visible    ${Element}/a[starts-with(@href, '/editarConta')]

FillContaForm
  [Arguments]       ${NAME}
  Input Text        ${INPUTNAME}       ${NAME}
  Click Element     ${BTNSAVE}
  Wait Until Element Is Visible        ${CONTASLIST}
  ${Locator}=    Replace Variables     ${CONTAITEM}