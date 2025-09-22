*** Settings ***
Documentation    To validate the unsuccessful login functionalityy
Library          SeleniumLibrary

*** Variables ***
${URL}           https://rahulshettyacademy.com/
${EMAIL}         suryasubramanian
${PASSWORD}      testing
${CHROMEDRIVER}  /Users/perundev/.cache/selenium/chromedriver/mac-x64/128.0.6613.137/chromedriver
${ERROR_MSG}     Invalid email or password.

*** Test Cases ***
Validate Unsuccessful Login
    [Documentation]    Test invalid login scenario
    Open Browser To URL
    Fill In Login Details
    Wait Until Page Contains Element    xpath=//div[@class='error']    timeout=5s
    Verify Error Message

*** Keywords ***
Open Browser To URL
    #Create Webdriver    chrome    executable_path=${CHROMEDRIVER}
    ${service}=    Evaluate    selenium.webdriver.chrome.service.Service('/Users/perundev/.cache/selenium/chromedriver/mac-x64/128.0.6613.137/chromedriver')    modules=selenium.webdriver.chrome.service
    Create Webdriver    Chrome    chrome_options=${EMPTY}    service=${service}
    Go To               ${URL}

Fill In Login Details
    Input Text    id:email       ${EMAIL}
    Input Text    id:password    ${PASSWORD}
    Click Button  xpath=//input[@type='submit']

Verify Error Message
    ${msg}=    Get Text    xpath=//div[@class='error']
    Should Be Equal    ${msg}    ${ERROR_MSG}
    [Teardown]    Close Browser

