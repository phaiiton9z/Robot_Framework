*** Settings ***
Resource    ../Resources/import.robot

*** Keywords ***
Open Browser and go to website '${url}'
    New Browser    chromium    headless=${headless}    args=["--start-maximized"]
    New Context    ignoreHTTPSErrors=true     viewport=${None}
    New Page       ${url}

Input text when ready
    [Arguments]    ${locator}    ${text}
    Wait For Elements State      ${locator}    
    Fill Text      ${locator}    ${text}

Click element when ready
    [Arguments]    ${locator}
    Wait For Elements State      ${locator}
    Click    ${locator}

