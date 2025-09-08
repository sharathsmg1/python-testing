*** Settings ***
Documentation    To validate the login page
Library          SeleniumLibrary
Test Setup  Open The oncotwin web application
Test Teardown   Close browser session
Resource  resource.robot

*** Variables ***
#you can find the data in resource file

*** Test Cases ***
Validate Successful LoginWith valid Password
    Fill The Login Page     ${user_name}    ${valid_Password}
    Check we are in the home page
    check page name

Validate Unsuccessful Login With Invalid Password
    Fill The Login Page     ${User_name}    ${invalid_password}
    Check Invalid Login Message

*** Keywords ***

Fill The Login Page
    [arguments]     ${Username}        ${Password}
    Input Text      xpath://input[@id="email"]     ${username}
    Input Password  xpath://input[@id="pwd"]       ${Password}
    Click Button    xpath://button[normalize-space()="Log In"]
    #Sleep    5s

Check we are in the home page
    Wait Until Page Contains Element   ${Page_name}   20s
    Wait Until Element Is Visible      ${Onco_twin_button}   20s

check Page name
    ${Logo}=  Get Text  ${Page_name}
    Should Be Equal As Strings  ${Logo}  Patient List
    Element Text Should Be  ${Page_name}  Patient List

Check Invalid Login Message
    Wait Until Element Is Visible    ${error_message}    5s
    ${msg}=  Get Text  ${error_message}
    Should Contain  ${msg}  please enter correct password