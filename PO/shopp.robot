*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource        PO/generic.robot

*** Variables ***
${checkout_display}         css:.nav-link

*** Keywords ***

wait until element is located in the page
    [Arguments]    ${element_wait}
    wait until element passed is located on page    ${checkout_display}

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