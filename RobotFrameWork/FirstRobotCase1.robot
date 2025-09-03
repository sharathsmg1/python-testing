*** Settings ***
Documentation    To validate the login page
Library          SeleniumLibrary
Test Setup  Open The oncotwin web application
Test Teardown   Close browser session
Resource  resource.robot

*** Variables ***
#you can find the data in resource file

*** Test Cases ***
Validate Successful Login
    Fill The Login Page     ${User_name}   ${valid_Password}
    Check we are in the home page
    check oncotwin word

*** Keywords ***

Fill The Login Page
    [arguments]     ${username}     ${password}
    Input Text      xpath://input[@id="email"]     ${username}
    Input Password  xpath://input[@id="pwd"]       ${password}
    Click Button    xpath://button[normalize-space()="Log In"]
    #Sleep    5s

Check we are in the home page
    Wait Until Element Is Visible   ${search_twin_button}

check oncotwin word
    ${Logo}=  Get Text  ${Page_name}
    Should Be Equal As Strings  ${Logo}  Patient List
    Element Text Should Be  ${Page_name}  Patient List