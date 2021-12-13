*** Settings ***
Documentation   A test suit with tests for valid cases
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
    Submit Credentials
    # should be open in products page
    Product Page Should Be Open
    # close browser
    [Teardown]      Close Browser



