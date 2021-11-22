*** Settings ***
Resource          ../../Resources/Common.robot
#Resource          ../../Data/Books/Data_Books.robot
Resource          ../../Data/Books/Locator_Books.robot

*** keywords ***
Validate Results
    [Arguments]             ${value}
    ${countRow}=            Get Element Count           ${rowInTable_Locator} 
    ${countRow}=            Set Variable                ${countRow}+1
    FOR     ${index}    IN RANGE    1    ${countRow}
        ${getName_Locator}=     Replace String          ${getName_Locator}          value          '${index}'    
        ${name}=                Get Text                ${getName_Locator}
        ${result}=              Evaluate                "${name}".lower().rfind("${value}".lower())+1
        Should Be True          ${result} > 0           Data in table is not match
    END

Add One Book
    [Arguments]             ${bookName}
    Go To Book Page        
    Click One Book          ${linkBook}     ${bookName}
    Click Btn Add           ${btnAddBook_Locator}
    Validate Popup          

Go To Book Page
    Go To             ${UrlBooks}

Click One Book
    [Arguments]                         ${locator}       ${value} 
    ${locator}                          Replace String      ${locator}        value      ${value}
    Wait Until Element Is Visible       ${locator} 
    #${locator}         Set Variable       //*[@id="see-book-${value}"]/a
    Click Link                           ${locator}    

Click Btn Add
    [Arguments]      ${locator}     
    Wait Until Element Is Visible    ${locator}   
    Click Button     ${locator}  

Validate Popup
    Alert Should Be Present    text=Book added to your collection.    action=ACCEPT
