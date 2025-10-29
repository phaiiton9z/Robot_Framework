*** Settings ***
Resource    ../Keywords/features/login/login_features.robot
Variables   ../Resources/test_data/login/test_data.yaml

Test Setup        Open Browser and go to website '${url.saucedemo}'
Test Teardown     Logout website

Test Tags         login

*** Test Cases ***
TC_001 login to website saucedemo with correct username and password
    [Documentation]    Test case to login to saucedemo with correct username and password

    Login with username '${login_tc001.username}' and password '${login_tc001.password}'
    Verify user products page is '${login_tc001.product}'


TC_002 login to website saucedemo with incorrect username and password
    [Documentation]    Test case to login to saucedemo with incorrect username and password
    [Teardown]      Close error message

    Login with username '${login_tc002.username}' and password '${login_tc002.password}'
    Verify error message '${login_tc002.error_message}'

TC_003 login to website saucedemo with problem user and password
    [Documentation]    Test case to login to saucedemo with problem user and password

    Login with username '${login_tc003.username}' and password '${login_tc003.password}'
    Verify user products page is '${login_tc003.product}'

TC_004 login to website saucedemo with performance glitch user user and password
    [Documentation]    Test case to login to saucedemo with performance glitch user and password

    Login with username '${login_tc004.username}' and password '${login_tc004.password}'
    Verify user products page is '${login_tc004.product}'

TC_005 login to website saucedemo with error user and password
    [Documentation]    Test case to login to saucedemo with error user and password

    Login with username '${login_tc005.username}' and password '${login_tc005.password}'
    Verify user products page is '${login_tc005.product}'

TC_006 login to website saucedemo with visual user and password
    [Documentation]    Test case to login to saucedemo with visual user and password

    Login with username '${login_tc006.username}' and password '${login_tc006.password}'
    Verify user products page is '${login_tc006.product}'

TC_007 login to website saucedemo with incorrect password
    [Documentation]    Test case to login to saucedemo with incorrect password
    [Teardown]      Close error message

    Login with username '${login_tc007.username}' and password '${login_tc007.password}'
    Verify error message '${login_tc007.error_message}'

TC_008 login to website saucedemo with empty username and password
    [Documentation]    Test case to login to saucedemo with empty username and password
    [Teardown]      Close error message

    Login with username '${login_tc008.username}' and password '${login_tc008.password}'
    Verify error message '${login_tc008.error_message}'