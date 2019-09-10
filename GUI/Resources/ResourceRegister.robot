*** Settings ***
Library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  SeleniumLibrary
Library  String
Library  Collections

*** Variable ***
${BTNNEWUSER}                     //a[contains(text(),'Novo usuário?')]
${EMAILERRORMESSAGE}              //div[@role='alert' and contains(text(),'Endereço de email já utilizado')]
${REGISTEROKMESSAGE}              //div[@role='alert' and contains(text(),'Usuário inserido com sucesso')]
${INPUTNAME}                      id=nome
${INPUTEMAIL}                     id=email
${INPUTPWD}                       //input[@name='senha']
${BTNREGISTER}                    //input[@value='Cadastrar']

*** Keywords ***      
EnterRegisterForm
  Click Element                        ${BTNNEWUSER}
  Wait Until Element Is Visible        ${BTNREGISTER}

FillFormNewUser
  [Arguments]       ${EMAIL}           ${PWD}           ${NAME}
  Input Text        ${INPUTNAME}       ${NAME}
  Input Text        ${INPUTEMAIL}      ${EMAIL}
  Input Text        ${INPUTPWD}        ${PWD}
  Click Element     ${BTNREGISTER}

IsRepeatedEmail
  Wait Until Element Is Visible        ${EMAILERRORMESSAGE}

IsRegisteredOK
  Wait Until Element Is Visible        ${REGISTEROKMESSAGE}