*** Settings ***
Library  DateTime
Library  OperatingSystem
Library  RequestsLibrary
Library  SeleniumLibrary
Library  String
Library  Collections

*** Variable ***
${INPUTEMAIL}                     id=email
${INPUTPWD}                       //input[@name='senha']
${BTNLOGIN}                       //button[contains(text(),'Entrar')]
${LOGINOKMESSAGE}                 //div[@role='alert' and contains(text(),'Bem vindo')]
${LOGINERRORMESSAGE}              //div[@role='alert' and contains(text(),'Problemas com o login do usuário')]

*** Keywords ***
SignIn
  [Arguments]       ${EMAIL}           ${PWD}
  Input Text        ${INPUTEMAIL}      ${EMAIL}
  Input Text        ${INPUTPWD}        ${PWD}
  Click Element     ${BTNLOGIN}

IsLogged
  Wait Until Element Is Visible       ${LOGINOKMESSAGE}		
	
IsWrongLoginData
  Wait Until Element Is Visible       ${LOGINERRORMESSAGE}        
