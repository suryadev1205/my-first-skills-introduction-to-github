*** Settings ***
Documentation    To verify if the login is successful
Test Setup       Open the browser and enter the URL
Library          SeleniumLibrary
Library          Collections
Library          SeleniumLibrary
Library          customLibraries/Shop.py
Test Teardown     close browser after execution
Resource         PO/generic.robot
Resource         PO/LandingPage.robot
Resource         PO/shopp.robot
Resource        PO/checkout_page.robot
Resource        PO/confirmation_page.robot


*** Variables ***
@{list_ofProducts}    Blackberry    Nokia Edge
${country name}       India

*** Test Cases ***
Validate the login page with invalid password

     landingPage.Enter the Username,Password and click on signin    ${username}    ${invalid_password}
     landingPage.wait until element is located in the page
     landingPage.Verify the error message
     close browser after execution

Validate the login page with valid password

    landingPage.Enter the Username,Password and click on signin    ${username}    ${valid_password}
    shopp.wait until element is located in the page       ${checkout_display}
    shopp.Grab the product titles
    add items to cart and checkout          ${list_ofProducts}
    checkout_page.verify the items in teh check out page and proceed
    confirmation_page.Enter the country and select the terms   ${country_name}
    confirmation_page.purchase the product and confirm the purchase

#    Choose an item and add it to the cart        Blackberry




    





