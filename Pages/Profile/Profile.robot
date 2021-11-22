*** Settings ***
Resource          ../../Resources/Common.robot
#Resource          ../../Data/Profile/Data_Profile.robot
Resource          ../../Data/Profile/Locator_Profile.robot

*** keywords ***
    

Add Book To Delete
    [Arguments]                      ${bookName}
    Go To Profile                    
    Auto Add A Book                  ${search_Locator}   ${bookName}     ${deleteIconOnTop_Locator}

Delete One Book
    [Arguments]                     ${bookName} 
    Go To Profile                   
    Delete A Book                   ${deleteIconOnTop_Locator}  ${comfirmDelete_locator}


Clear Book To Add
    [Arguments]                     ${bookName} 
    Go To Profile                   
    Clear A Book                    ${search_Locator}   ${bookName}     ${deleteIconOnTop_Locator}  ${comfirmDelete_locator}

Validate A Book Not Exists
    [Arguments]                     ${bookName} 
    Go To Profile                  
    Book Bot Shown In Profile       ${search_Locator}   ${bookName}     ${deleteIconOnTop_Locator}

Validate A Book Exists
    [Arguments]                     ${bookName} 
    Go To Profile                 
    Book Is Shown In Profile        ${search_Locator}   ${bookName}

Delete A Book
    [Arguments]         ${locator}  ${locator_confirm}
    Wait Until Element Is Visible         ${locator} 
    Click Element       ${locator}
    Click Button        ${locator_confirm}
    Alert Should Be Present    text=Book deleted.    action=ACCEPT

Clear A Book
    [Arguments]         ${locator}    ${value}  ${locator_delete}   ${locator_confirm}
    Search book         ${value}
    ${count}=           Get Element Count    ${locator_delete}
    IF     '${count}' > '0' 
        Run keyword     Delete A Book  ${locator_delete}    ${locator_confirm}
        Log To Console  deleted
    END

Auto Add A Book
    [Arguments]         ${locator}    ${value}  ${locator_delete} 
    Search book         ${value}
    ${count}=           Get Element Count    ${locator_delete}
    IF  '${count}' == '0' 
        Run keyword     Add one book    ${value}
        Log To Console  add success
    END

Book Bot Shown In Profile
    [Arguments]           ${search_Locator}    ${value}     ${locator_delete}
    Wait Until Element Is Visible    ${search_Locator}
    Search book         ${value}
    ${count}=           Get Element Count    ${locator_delete}
    Should Be True      '${count}' == '0' 

Go To Profile
    Go To               ${UrlProfile} 

Book Is Shown In Profile
    [Arguments]           ${search_Locator}    ${value}
    Wait Until Element Is Visible    ${search_Locator}
    Click Link            ${value} 

