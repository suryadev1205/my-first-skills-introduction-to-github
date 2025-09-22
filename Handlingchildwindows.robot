*** Settings ***
Documentation    To verify if the login is successful
Library          SeleniumLibrary
Test Setup       Open the browser and enter the URL
Library          SeleniumLibrary
Library          Collections
Library          String
Test Teardown    close browser after execution
Resource         resource.robot

*** Test Cases ***

Validate the switch window functionality
    Click on the new url in the screen
    Verify that is opened in a new window
    Grab the email id from the text
    Enter the emailid in the old window and login

*** Keywords ***
 Click on the new url in the screen
     Click Link    css:.blinkingText
     Sleep    5s

Verify that is opened in a new window
    Switch Window    NEW
    Element Should Be Visible    css:h1    Documents request

Grab the email id from the text
    ${text}=    Get Text    css:.red
    @{words}=   Split String    ${text}  at
    ${text_split}=    Get From List    ${words}    1   
    Log    ${text_split}
    @{words_2}=   Split String    ${text_split}
    ${text_split2}=    Get From List    ${words_2}    0
    Log    ${text_split2}
    Set Global Variable    ${text_split2}

Enter the emailid in the old window and login
    Switch Window    Main
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text       xpath://input[@id="username"]        ${text_split2}