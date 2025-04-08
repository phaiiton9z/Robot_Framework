*** Settings ***
Resource    ../Resources/import.robot

*** Keywords ***
Open Browser and go to website
    New Browser    chromium    headless=${headless}    args=["--start-maximized"]
    New Context    ignoreHTTPSErrors=true     viewport=${None}
    New Page       ${url.google}

