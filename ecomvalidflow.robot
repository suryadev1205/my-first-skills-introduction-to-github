*** Settings ***
Documentation    To verify if the login is successful
Library          SeleniumLibrary
Test Setup       Open the browser and enter the URL
Library          SeleniumLibrary
Library          Collections
Test Teardown    close browser after execution
Resource         generic.robot

*** Test Cases ***
#Validate the login page with invalid password
#
#    Enter the Username,Password and click on signin    ${username}    ${invalid_password}
#    wait until element is located in the page        ${Error_Message_Login}
#    Verify the error message
#    close browser after execution

Validate the login page with valid password

    Enter the Username,Password and click on signin    ${username}    ${valid_password}
    wait until element is located in the page        ${checkout_display} 
    Grab the product titles
    Choose an item and add it to the cart        Blackberry

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
    [Arguments]    ${element_wait}
    Wait Until Element Is Visible    ${element_wait}    10s
    
Verify the error message
    ${result}=    Get Text    ${Error_Message_Login}
#Log to Console     Error Message Found: ${result}
#Should Contain     ${result}    Incorrect username/password
    Should Be Equal As Strings   ${result}      Incorrect username/password.
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Grab the product titles
    @{actual_list}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${element_list}=    Get Webelements    css:.card-title
    @{expected_list}=    Create List
    FOR    ${i}    IN    @{element_list}
        ${text}=    Get Text    ${i}
        Log    ${text}
        Append To List    ${expected_list}    ${text}
    END
    Lists Should Be Equal    ${expected_list}    ${actual_list}
#Choose an item and add it to the cart
#    [Arguments]    ${card_name}
#    ${element_list}=    Get Webelements    css:.card-title
#    ${index}=    Set Variable    1
#     FOR    ${i}    IN    ${element_list}
#        ${text}=    Get Text    ${i}
#        Log    Checking product: ${text}
#        Exit For Loop If    '${card_name}' == '${text}'
#        ${index}=  Evaluate    ${index}+1
#     END
#     Click Button    xpath:(//*[@class='card-footer'])${index}]/button}

Choose an item and add it to the cart
    [Arguments]    ${card_name}
    ${element_list}=    Get Webelements    css:.card-title
    ${index}=    Set Variable    1
    FOR    ${i}    IN    @{element_list}
        ${text}=    Get Text    ${i}
        Exit For Loop If    '${card_name}' == '${text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class="card-footer"])[${index}]/button