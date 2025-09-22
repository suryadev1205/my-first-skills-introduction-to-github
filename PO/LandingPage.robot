*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource        PO/generic.robot

*** Variables ***
${Error_Message_Login}      css:.alert

*** Keywords ***

Enter the Username,Password and click on signin
    [Arguments]      ${username}        ${password}
    Input Text       xpath://input[@id="username"]        ${username}
    Input Password   xpath://input[@id="password"]        ${password}
    Click Element    css:input[value='user']
    Wait Until Element Is Visible    css:.modal-body
    Click Element    okayBtn
    Click Element    okayBtn
    Wait Until Element Is Not Visible    css:.modal-body
    Select From List By Value    css:select.form-control    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
    Click Button     xpath://input[@id="signInBtn"]

wait until element is located in the page
    wait until element passed is located on page    ${Error_Message_Login}

Verify the error message
    ${result}=    Get Text    ${Error_Message_Login}
#Log to Console     Error Message Found: ${result}
#Should Contain     ${result}    Incorrect username/password
    Should Be Equal As Strings   ${result}      Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.