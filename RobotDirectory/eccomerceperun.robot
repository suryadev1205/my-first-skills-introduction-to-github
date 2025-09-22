*** Test Cases ***
*** Settings ***
Documentation    To verify if the login fails with invalid credentials
Library          SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_Message_Login}     css:.alert

*** Test Cases ***
Validate the login page
    Open the browser and enter the URL
    Enter the Username,Password and click on signin
    Wait until element is displayed
    Verify the error message

*** Keywords ***
Open the browser and enter the URL
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    Chrome
    Maximize Browser Window

Enter the Username,Password and click on signin
    Input Text       xpath://input[@id="username"]    contact@rahulshettyacademy.com
    Input Password   xpath://input[@id="password"]    123456
    Click Button     xpath://input[@id="signInBtn"]

Wait until element is displayed
    Wait Until Element Is Visible    ${Error_Message_Login}    10s

Verify the error message
    ${result}=    Get Text    ${Error_Message_Login}
    Log To Console    Error Message Found: ${result}
    Should Contain    ${result}    Incorrect username/password
