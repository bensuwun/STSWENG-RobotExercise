*** Settings ***
Documentation   A resource file with reusable variables and keywords
...
...             Creating system-specific keywords from default keywords
...             from SeleniumLibrary
Library         SeleniumLibrary

*** Variables ***
${SERVER}               www.saucedemo.com
${BROWSER}              edge
${DELAY}                0
${VALID USER}           standard_user
${LOCKED OUT USER}      locked_out_user
${PROBLEM USER}         problem_user
${VALID PASSWORD}       secret_sauce
${INVALID PASSWORD}     oops
${LOGIN URL}    https://${SERVER}/
${HOME URL}     https://${SERVER}/inventory.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element     login-button

Product Page Should Be Open
    Element Text Should Be      class:title     PRODUCTS

Go To Product Page 
    Input Username  ${VALID USER}
    Input Pass      ${VALID PASSWORD}
    Submit Credentials
    Product Page Should Be Open

Input Username
    [Arguments]     ${username}
    Input Text  user-name   ${username}

Input Pass
    [Arguments]     ${password}
    Input Password  password    ${password}

Submit Credentials
    Click Button    login-button

Sort By
    [Arguments]     ${method}
    Select From List By Value   class:product_sort_container    ${method}

# Invalid cases
Locked Out Prompt Should Show
    Element Text Should Be      xpath://*[@id="login_button_container"]/div/form/div[3]/h3     Epic sadface: Sorry, this user has been locked out.

Invalid Password Prompt Should Show
    Element Text Should Be      xpath://*[@id="login_button_container"]/div/form/div[3]/h3     Epic sadface: Username and password do not match any user in this service