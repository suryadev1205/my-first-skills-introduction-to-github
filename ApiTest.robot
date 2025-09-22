*** Settings ***
Library    Collections
*** Test Cases ***
Play around with Dictionary
    ${data}=    create dictionary     name=surya    course=robot    website=rahulshettyacademy
    log    ${data}
    Dictionary Should Contain Key    ${data}    name
    log    ${data}[name]
    ${url}=    Get From Dictionary    ${data}    website
    Log    ${url}



