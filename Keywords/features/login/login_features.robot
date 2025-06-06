*** Settings ***
Resource    ../../common_keywords.robot

*** Keywords ***
Login with username '${username}' and password '${password}'
    Input text when ready    id=user-name   ${username}
    Input text when ready    id=password    ${password}
    Click element when ready    id=login-button

Verify error message '${message}'
    Get Text    //h3[@data-test="error"]    Should be   ${message}

Verify user products page is '${products}'
    Get Text    //div[@class="app_logo"]    Should be   ${products}

Logout website
    Click element when ready    id=react-burger-menu-btn
    Click element when ready    id=logout_sidebar_link
    Wait For Elements State     id=login-button

Close error message
    Click element when ready    //button[@data-test="error-button"]