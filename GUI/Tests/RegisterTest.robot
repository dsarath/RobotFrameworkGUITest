*** Settings ***
Resource          ../Resources/BDDpt-br.robot
Resource          ../Resources/Resource.robot
Test Teardown     Fechar navegador

*** Variable ***
${NAME}                        Test User
${EMAIL}                       testrobotuser@mailinator.com
${PASSWORD}                    pwdtestuser

*** Test Cases ***
Cenário 01: Efetuar Cadastro com Sucesso
  Dado(a) a tela de cadastro de Usuário
  Quando preenchido formulário com dados corretos
  Então o usuário é cadastrado com sucesso

Cenário 02: Efetuar Login com Email Repetido
  Dado(a) a tela de cadastro de Usuário
  Quando preenchido formulário com dados corretos
  Então a mensagem de erro de email é exibida

*** Keywords ***
a tela de cadastro de Usuário
  Acessar a pagina de login
  EnterRegisterForm

preenchido formulário com dados corretos
  FillFormNewUser    ${EMAIL}   ${PASSWORD}    ${NAME}

o usuário é cadastrado com sucesso
  IsRegisteredOK

a mensagem de erro de email é exibida
  IsRepeatedEmail
  

