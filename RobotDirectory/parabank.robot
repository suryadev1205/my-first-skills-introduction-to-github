*** Settings ***
Documentation    To verify the successful login
Library          SeleniumLibrary

*** Test Cases ***
Validate Successful Login
    Open the browser with the URL
    Fill in the details
    Wait until the message is displayed
    Click On Open Account Link
    Click on open new account button
    verify the message

*** Keywords ***
Open the browser with the URL
    Open Browser        https://parabank.parasoft.com/parabank/index.htm;jsessionid=4DEDE19C6E6C06816B74AC213ED17530    chrome
    Maximize Browser Window

Fill in the details
    Input Text    xpath://input[@name="username"]    rrr
    Input Password    xpath://input[@name="password"]    testing
    Click Button    xpath://input[@type="submit"]

Wait until the message is displayed
    Wait Until Element Is Visible    css: .title

Click On Open Account Link
    Click Link    xpath://a[@href="openaccount.htm"]

Click on open new account button
    Wait Until Page Contains Element    xpath://input[@value="Open New Account"]    5s
    Click Link    xpath://a[@href="openaccount.htm"]
    Click Button    xpath://input[@value="Open New Account"]

verify the message
    Click Link    xpath://a[@id="newAccountId"]
    ${result}=    Get Text    xpath://b[text()="Your new account number:"]
    Should Be Equal As Strings    ${result}    Your new account number:




