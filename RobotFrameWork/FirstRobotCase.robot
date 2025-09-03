*** Settings ***
Documentation    To validate the login page
Library          SeleniumLibrary
Test Teardown   Close Browser

*** Variables ***
${search_twin_button}   xpath://tbody/tr[5]/td[8]/a[1]/span[1]
${Page_name}    xpath://h5[normalize-space()="Patient List"]

*** Test Cases ***
Validate Successful Login
    Open The oncotwin web application
    Fill The Login Page
    Check we are in the home page
    check oncotwin word

*** Keywords ***
Open The oncotwin web application
    Open Browser    http://52.66.98.251:9507/login    chrome
    Maximize Browser Window
    Sleep    5s

Fill The Login Page
    Input Text      xpath://input[@id="email"]     demo-user@oncotwin
    Input Password  xpath://input[@id="pwd"]       Oncotwin@123
    Click Button    xpath://button[normalize-space()="Log In"]
    Sleep    5s

Check we are in the home page
    Wait Until Element Is Visible   ${search_twin_button}

check oncotwin word
    ${Logo}=  Get Text  ${Page_name}
    Should Be Equal As Strings  ${Logo}  Patient List
    Element Text Should Be  ${Page_name}  Patient List