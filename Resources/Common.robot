*** Settings ***
Library           Selenium2Library
Library           DateTime
Library           String

Resource          ../Pages/Login/Login.robot

*** Variables ***
${browser}                          chrome
${username}                         long2k3
${password}                         Long2k3#
${search_Locator}                   id=searchBox
${clickElementByText_Locator}       xpath=//*[contains(text(),'value')]
${UrlRegistrationFrom}              https://demoqa.com/automation-practice-form
${UrlBooks}                         https://demoqa.com/books
${UrlLogin}                         https://demoqa.com/login
${UrlProfile}                       https://demoqa.com/profile
${bookName}                         Speaking JavaScript
${searchKey}                        design

*** keywords ***
Open And Login
    Open Link Page   ${UrlLogin}    ${browser}
    Login            ${username}    ${password} 

Input Text Field
    [Arguments]         ${locator}      ${value}
    Input Text          ${locator}      ${value}

Search book
    [Arguments]                         ${value}
    Wait Until Element Is Visible       ${search_Locator} 
    Input Text                          ${search_Locator}    ${value}    


Click By Value
    [Arguments]                     ${value}
    ${clickElementByText_Locator}   Replace String     ${clickElementByText_Locator}        value      ${value}
    Click Element                   ${clickElementByText_Locator} 

Select Dropdown By Text
    [Arguments]                     ${locator}          ${value}
    Click Element                   ${locator}
    ${clickElementByText_Locator}   Replace String     ${clickElementByText_Locator}        value      ${value}
    Click Element                   ${clickElementByText_Locator} 

Log Out 
    Go To                              ${UrlProfile} 
    Wait Until Element Is Visible      ${btnLogout_Locator} 
    Click Element                      ${btnLogout_Locator} 
    Close Browser
