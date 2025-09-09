*** Settings ***
Documentation    To validate the login page
Library          SeleniumLibrary
Test Setup  Open The oncotwin web application
Test Teardown   Close browser session
Resource  resource.robot
Library    Collections

*** Variables ***
#you can find the data in resource file

*** Test Cases ***
Validate Successful LoginWith valid Password
    Fill The Login Page     ${user_name}    ${valid_Password}
    Check onco twin button
    check page name
    Check the column names

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

Check onco twin button
    Wait Until Page Contains Element   ${Page_name}   20s
    Wait Until Element Is Visible      ${Onco_twin_button}   20s

check Page name
    ${Logo}=  Get Text  ${Page_name}
    Should Be Equal As Strings  ${Logo}  Patient List
    Element Text Should Be  ${Page_name}  Patient List

Check the column names
    # Expected Page Headers
    @{expected_page_headers}    Create List    Cancer Site    4bc Reg. Date    Age    Gender    Histopathologies    Survival Status
    ${actual_page_headers}    Get WebElements    css:.header-content
    @{actual_headers}=    Create List
    FOR    ${element}    IN    @{actual_page_headers}
        ${text}=    Get Text    ${element}
        Append To List    ${actual_headers}    ${text}
    END
    Lists Should Be Equal    ${expected_page_headers}    ${actual_headers}

    # Expected Page Titles
    @{expected_page_titles}    Create List    Patient ID    Patient Name
    ${actual_page_titles}    Get WebElements    ${page_titles}
    @{actual_titles}=    Create List
    FOR    ${element}    IN    @{actual_page_titles}
        ${text}=    Get Text    ${element}
        Append To List    ${actual_titles}    ${text}
    END
    Lists Should Be Equal    ${expected_page_titles}    ${actual_titles}

    # without for loop
    #@{expected_page_titles}    Create List    Patient ID    Patient Name
    #@{actual_page_titles}    Get Texts    css:.column-title
    #Lists Should Be Equal    ${expected_page_titles}    ${actual_page_titles}


Check Invalid Login Message
    Wait Until Element Is Visible    ${error_message}    5s
    ${msg}=  Get Text  ${error_message}
    Should Contain  ${msg}  please enter correct password