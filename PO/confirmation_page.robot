*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource        PO/generic.robot

*** Variables ***
${checkout_display}         css:.nav-link
${country_location}           India

*** Keywords ***
Enter the country and select the terms
    [Arguments]    ${country_name}
    Input Text     country    ${country_name}
    wait until element passed is located on page    //a[text()='${country_name}']
    Click Element    //a[text()='${country_name}']
    sleep     10s
    Click Element    css:.checkbox label

purchase the product and confirm the purchase
    Click Button    css:.btn-success
    Page Should Contain    Success!
