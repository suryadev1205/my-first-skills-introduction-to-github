*** Settings ***
Documentation    All the page objects and keywords of landing page
Library          SeleniumLibrary
Resource        PO/generic.robot

*** Variables ***
${checkout_display}         css:.nav-link

*** Keywords ***

verify the items in teh check out page and proceed
    Click Element    xpath://button[@class='btn btn-success']