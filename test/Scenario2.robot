*** Settings ***
Resource          ../Pages/Books/books.robot
Resource          ../Pages/Profile/Profile.robot


Test Setup          Open And Login  
Test Teardown       Log Out 


*** Test Cases ***  
Add A Book With bookName Successfully
    Add A Book From Collection  ${bookName}        

*** Keywords ***
Add A Book From Collection
    [Arguments]             ${bookName}
    Clear Book To Add       ${bookName}
    Add One Book            ${bookName}
    Validate A Book Exists  ${bookName}



