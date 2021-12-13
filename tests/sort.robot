*** Settings ***
Documentation   A test suit with tests for valid cases
...             
...             This test follow the example using keywords from 
...             the SeleniumLibrary.
Resource        resources.robot

*** Test Cases ***
Sort Products Low To High
    Open Browser To Login Page
    # go to product page
    Go To Product Page
    # sort lo to high
    Sort By     lohi
    # close browser
    [Teardown]      Close Browser

Sort Products High To Low
    Open Browser To Login Page
    Go To Product Page 
    Sort By     hilo
    [Teardown]      Close Browser

Sort Product A To Z
    Open Browser To Login Page
    Go To Product Page 
    Sort By     az
    [Teardown]      Close Browser

Sort Product Z To A
    Open Browser To Login Page
    Go To Product Page 
    Sort By     za
    [Teardown]      Close Browser