*** Settings ***
Documentation    To validate the login page
Library          SeleniumLibrary

*** Variables ***
${Onco_twin_button}    xpath://span[normalize-space()='OncoTwin']
${Page_name}    xpath://h5[normalize-space()="Patient List"]
${URL}  http://52.66.98.251:9507/login
${User_name}    demo-user@oncotwin
${valid_Password}     Oncotwin@123
${invalid_password}     Oncotwin@456
${error_message}    css:div[role='alertdialog']
${page_headers}     css:.header-content
${page_titles}      css:.column-title

*** Keywords ***
Open The oncotwin web application
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Sleep    5s

Close browser session
    Close Browser


