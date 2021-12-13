*** Settings ***
Documentation   A test suit with tests for invalid cases
...             
...             This test follow the example using keywords from 
...             the SeleniumLibrary.
Resource        resources.robot

*** Test Cases ***
Locked Out Login
    # open browser 
    # set window size
    # check if in login page
    Open Browser To Login Page
    # input username
    Input Username  ${LOCKED OUT USER}
    # input password
    Input Pass  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # error message is Epic sadface: ...
    Locked Out Prompt Should Show
    # close browser
    [Teardown]      Close Browser

Invalid Password Login
    # open browser 
    # set window size
    # check if in login page
    Open Browser To Login Page
    # input username
    Input Username  ${VALID USER}
    # input password
    Input Pass  ${INVALID PASSWORD}
    # click login button
    Submit Credentials
    # error message is Epic sadface: ...
    Invalid Password Prompt Should Show
    # close browser
    [Teardown]      Close Browser


Problem User Broken Inventory Page
    # Open browser, set window size, check if in login page
    Open Browser To Login Page
    # input username
    Input Username  ${PROBLEM USER}
    # input password
    Input Pass  ${VALID PASSWORD}
    # click login button
    Submit Credentials
    # should be in products page
    Product Page Should Be Open
    # img src should be doggo
    Page Should Contain Image   class:inventory_item_img    https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
    # close browser
    [Teardown]      Close Browser
