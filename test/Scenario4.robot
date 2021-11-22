*** Settings ***
Resource          ../Pages/Books/books.robot
Resource          ../Pages/Profile/Profile.robot


Test Setup          Open And Login  
Test Teardown       Log Out 


*** Test Cases ***      
Delete A Book With bookName Successfully
    Delete A Book From Collection   ${bookName}

*** Keywords ***

Delete A Book From Collection  
    [Arguments]                 ${bookName}
    Add Book To Delete          ${bookName}
    Delete One Book             ${bookName}
    Validate A Book Not Exists  ${bookName}
    
