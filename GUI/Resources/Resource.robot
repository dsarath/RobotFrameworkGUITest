*** Settings ***
Library    DateTime
Library    OperatingSystem
Library    RequestsLibrary
Library    SeleniumLibrary
Library    String
Library    Collections
Resource   ResourceLogin.robot
Resource   ResourceRegister.robot
Resource   ResourceContas.robot
#Resource   ../../API/Resources/ResourceRequests.robot

*** Variable ***
${BROWSER}                        chrome
${BASEURL}                        https://seubarriga.wcaquino.me/login
${REMOTE_URL}                     True
${MAXIMIZAR_BROWSER}              True

*** Keywords ***
Acessar a pagina de login
  Open Browser          ${BASEURL}   ${BROWSER}        
  Run Keyword If       '${MAXIMIZAR_BROWSER}'=='True'  Maximizar o browser

Fechar navegador
  Close Browser

Maximizar o browser
  Maximize Browser Window

#Tips
#  Scroll Element Into View     ${Element}
#
#  ${IconeInformacao}                ${TipoDoErro}//h2/following-sibling::*
#
#  :FOR    ${i}    IN RANGE    1000
#
#  #  ${json_string}=    evaluate    json.dumps(${CatJson})    json

#
#  ${WidthCardFilho}  ${HeightCardFilho} =  Get Element Size  ${CardFilho}
#  ${WidthCardPai}    ${HeightCardPai} =    Get Element Size  ${CardPai}
#  ${Dif}=            Evaluate  ${HeightCardPai} - ${HeightCardFilho}
#  Evaluate           ${Dif} > 0
#  
#  \       Run Keyword If         '${Variavel}'!='None'                                 Should Contain    ${CardText}     ${MensagemCarencia}
#  \       ...	ELSE IF           '${DataText}'=='Prazo de carência não informado'      Should Contain    ${CardText}     ${MensagemCarenciaNaoInformada}

#Get Historico Asc
#  [Arguments]     ${Elements}
#  ${L1}=    Create List
#  ${L2}=    Create List
#  :FOR    ${Element}    IN    @{Elements}
#  \  ${Val}=   Get Text    ${Element}
#  \   Run Keyword If  '${Val}'!='None'  Append To List  ${L1}  ${Val}
#  \   Run Keyword If  '${Val}'!='None'  Append To List  ${L2}  ${Val}
#  Sort List   ${L2}
#  Lists Should Be Equal   ${L1}  ${L2}
#
#Get Historico Desc
#  [Arguments]     ${Elements}
#  ${L1}=    Create List
#  ${L2}=    Create List
#  :FOR    ${Element}    IN    @{Elements}
#  \  ${Val}=   Get Text    ${Element}
#  \   Run Keyword If  '${Val}'!='None'  Append To List  ${L1}  ${Val}
#  \   Run Keyword If  '${Val}'!='None'  Append To List  ${L2}  ${Val}
#  Sort List     ${L2}
#  Reverse List  ${L2}
#  Lists Should Be Equal   ${L1}  ${L2}
#
#
#*** Variables ***
#${DBHost}         ${IP}
#${DBName}         Base
#${DBUser}         user
#${DBPass}         password
#${DBPort}         5432
#
#*** Keywords ***
#Conectar ao banco
#  Connect To Database    psycopg2    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
#  Disconnect From Database
#
#Valida status inconsistencia
#  [Arguments]  ${Id}   ${Status}
#  Conectar ao banco
#  Check If Exists In Database    SELECT * FROM xxx inc INNER JOIN zzz ato ON inc.aaa = ato.aaa WHERE ato.bbb = '${Id}' AND inc.ccc = ${Status};
#
#Consultar tabela cdinconsistenciatipo
#  ${Resultado}=  Query    SELECT * FROM public.xxx order by bbb;
#  [Return]  ${Resultado}
#
#Verifica mensagem da inconsistência do atos
#  [Arguments]  ${Codigo}  ${ErroMensagem}
#  ${Resultado}=         Query  select aaa from xxx where bbb = '${Codigo}';
#  Check If Exists In Database  select * from zzz where ccc = '${Resultado}[0][0]' and mensagem = '${ErroMensagem}';
#