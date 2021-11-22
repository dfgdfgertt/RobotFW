*** Settings ***
Resource          ../../Resources/Common.robot
Resource          ../../Data/Login/Locator_Login.robot


*** keywords ***   


Login
    [Arguments]         ${username}            ${password}
    Enter UserName      ${username_Locator}    ${username}
    Enter Password      ${password_Locator}    ${password}
    Click Login         ${btnLogin_Locator}
    Check Login         ${validateUser_Locator}    #${username}

Open Link Page
    [Arguments]      ${locator}      ${value} 
    Open Browser        ${locator}      ${value}
    Maximize Browser Window
Enter UserName
    [Arguments]      ${locator}      ${value}
    Input Text         ${locator}       ${value}

Enter Password
    [Arguments]      ${locator}      ${value}
    Input Password      ${locator}      ${value}
    
Click Login
    [Arguments]      ${locator}      
    Click Button       ${locator} 

Check Login 
    [Arguments]      ${locator}     # ${value}
    Wait Until Element Is Visible    ${locator}  
    #Element Text Should Be  ${locator}      ${value}
