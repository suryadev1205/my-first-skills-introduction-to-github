*** Settings ***
Documentation    To verify if the successful login
Library          SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_Message_Login}     css:.alert
*** Test Cases ***
Validate the login page
    Open the browser and enter the URL
    Enter the Username,Password and click on signin
    wait until element is displayed
    Verify the error message

*** Keywords ***
Open the browser and enter the URL
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/     Chrome
    Maximize Browser Window
    
Enter the Username,Password and click on signin
    Input Text       xpath://input[@id="username"]   contact@rahulshettyacademy.com
    Input Password   xpath://input[@id="password"]    123456
    Click Button     xpath://input[@id="signInBtn"]
    
wait until element is displayed
    Wait Until Element Is Visible    ${Error_Message_Login}     10s
    
Verify the error message
    ${result}=    Get Text    ${Error_Message_Login}
#Log to Console     Error Message Found: ${result}
#Should Contain     ${result}    Incorrect username/password
    Should Be Equal As Strings   ${result}      Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.