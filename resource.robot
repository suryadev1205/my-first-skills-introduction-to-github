*** Settings ***
Documentation    To verify if the login is successful
Library          SeleniumLibrary


*** Variables ***
${Error_Message_Login}      css:.alert
${checkout_display}         css:.nav-link
${username}                 rahulshettyacademy
${invalid_password}         123456
${valid_password}           learning
${url}                      https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open the browser and enter the URL
    Open Browser    ${url}     Chrome
    Maximize Browser Window

close browser after execution
    Close Browser