*** Settings ***
Documentation    To verify if the login is successful
Library          SeleniumLibrary
Test Setup       Open the browser and enter the URL
Library          SeleniumLibrary
Library          Collections
Library          DataDriver     file=Resources/data.csv   encoding=utf_8    dialect=unix
Test Teardown    close browser after execution
Resource         resource.robot
Test Template    Validate the login page with invalid password


*** Test Cases ***       

Login with user ${username} and password ${password}    xts    tyr


*** Keywords ***
Validate the login page with invalid password
    [Arguments]    ${username}        ${password}
    Enter the Username,Password and click on signin    ${username}     ${password}
#    wait until element is located in the page
#    Verify the error message

Enter the Username,Password and click on signin
    [Arguments]      ${username}        ${password}
    Input Text       xpath://input[@id="username"]        ${username}
    Input Password   xpath://input[@id="password"]        ${password}
    Click Button     xpath://input[@id="signInBtn"]

wait until element is located in the page
    [Arguments]    ${element_wait}
    Wait Until Element Is Visible    ${element_wait}    10s
    
Verify the error message
    ${result}=    Get Text    ${Error_Message_Login}
#Log to Console     Error Message Found: ${result}
#Should Contain     ${result}    Incorrect username/password
    Should Be Equal As Strings   ${result}      Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

