*** Settings ***
Resource          ../Resources/BDDpt-br.robot
Resource          ../Resources/Resource.robot
Test Teardown     Fechar navegador

*** Variable ***
${NAME}                        Register this Account
${NAMEEDITED}                  This Account was edited
${EMAIL}                       robotqa@mailinator.com
${PASSWORD}                    pwdrobot

#E2E Tests - The tests are not independent
*** Test Cases ***
Cenário 01: Efetuar Cadastro de Conta com Sucesso
  Dado(a) a tela de cadastro de Conta
  Quando preenchido formulário com dados validos
  Então a Conta é cadastrada com sucesso

Cenário 02: Efetuar Edição de Conta
  Dado(a) a tela de Lista de Conta
  Quando acionado botão de editar Conta
  E preenchido o formulário editando
  Então a Conta é atualizada

Cenário 03: Efetuar Exclusão de Conta
  Dado(a) a tela de Lista de Conta
  Quando acionado botão de Excluir Conta
  Então a Conta é excluída com sucesso

*** Keywords ***
a tela de cadastro de Conta
  Acessar a pagina de login
  SignIn                        ${EMAIL}   ${PASSWORD}
  EnterContasRegisterForm

preenchido formulário com dados validos
  FillContaForm                 ${NAME}

a Conta é cadastrada com sucesso
  IsAccountRegisteredOK

a tela de Lista de Conta
  Acessar a pagina de login
  SignIn                        ${EMAIL}   ${PASSWORD}
  EnterContasList

acionado botão de Excluir Conta
  RemoveConta                   ${NAMEEDITED}

a Conta é excluída com sucesso
  No Operation

acionado botão de editar Conta
  EditConta                     ${NAME}

preenchido o formulário editando
  FillContaForm                 ${NAMEEDITED}

a Conta é atualizada
  IsAccountEditedOK
  

