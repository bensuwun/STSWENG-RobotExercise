*** Settings ***
Documentation   A test suit with a single test for valid login
...             
...             This test follow the example using keywords from 
...             the SeleniumLibrary.
Resource        resources.robot

*** Test Cases ***
Valid Login
    # open browser 
    # set window size
    # check if in login page
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input password
    Input Pass  ${VALID PASSWORD}
    # click login button
    Click Button    login-button
    # should be open in products page
    Element Text Should Be      class:title     PRODUCTS
    # close browser
    [Teardown]      Close Browser

Locked Out Login
    # open browser 
    Open Browser    https://www.saucedemo.com/    edge
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element    login-button
    # input username
    Input Text    user-name    locked_out_user
    # input password
    Input Password    password      secret_sauce
    # click login button
    Click Button    login-button
    # error message is Epic sadface: ...
    Element Text Should Be      xpath://*[@id="login_button_container"]/div/form/div[3]/h3     Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]      Close Browser