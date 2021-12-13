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
    # assert first item
    Element Text Should Be  xpath://*[@id="item_2_title_link"]/div  Sauce Labs Onesie
    # close browser
    [Teardown]      Close Browser

Sort Products High To Low
    Open Browser To Login Page
    Go To Product Page 
    Sort By     hilo
    Element Text Should Be  xpath://*[@id="item_5_title_link"]/div  Sauce Labs Fleece Jacket
    [Teardown]      Close Browser

Sort Product A To Z
    Open Browser To Login Page
    Go To Product Page 
    Sort By     az
    Element Text Should Be  xpath://*[@id="item_4_title_link"]/div  Sauce Labs Backpack
    [Teardown]      Close Browser

Sort Product Z To A
    Open Browser To Login Page
    Go To Product Page 
    Sort By     za
    Element Text Should Be  xpath://*[@id="item_3_title_link"]/div  Test.allTheThings() T-Shirt (Red)
    [Teardown]      Close Browser