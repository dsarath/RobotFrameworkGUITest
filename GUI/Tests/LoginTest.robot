*** Settings ***
Resource          ../Resources/BDDpt-br.robot
Resource          ../Resources/Resource.robot
Test Teardown     Fechar navegador

*** Variable ***
${EMAIL}                       robotqa@mailinator.com
${PASSWORD}                    pwdrobot

*** Test Cases ***
Cenário 01: Efetuar Login com Sucesso
  Dado(a) o portal de login
  Quando efetuada tentativa de login com dados válidos
  Então a pagina principal deve ser carregada

Cenário 02: Efetuar Login com Email Incorreto
  Dado(a) o portal de login
  Quando efetuada tentativa de login com A@A.A ${PASSWORD}
  Então a mensagem de erro de login é exibida

Cenário 03: Efetuar Login com Senha Incorreta
  Dado(a) o portal de login
  Quando efetuada tentativa de login com ${EMAIL} AAA
  Então a mensagem de erro de login é exibida

*** Keywords ***
o portal de login
  Acessar a pagina de login

efetuada tentativa de login com dados válidos
  SignIn    ${EMAIL}   ${PASSWORD}

a pagina principal deve ser carregada
  IsLogged

efetuada tentativa de login com ${USER} ${PWD}
  SignIn    ${USER}       ${PWD}

a mensagem de erro de login é exibida
  IsWrongLoginData
  

