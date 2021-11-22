*** Settings ***
Resource            ../Pages/Books/books.robot
Resource            ../Pages/Profile/Profile.robot


Test Setup          Open And Login  
Test Teardown       Log Out 

*** Test Cases ***
Search Book With Multiple Results Successfully
    Search Book With Multiple Results   ${searchKey}

*** keywords ***
Search Book With Multiple Results
    [Arguments]            ${searchKey}
    Go To Book Page
    Search book          ${searchKey}
    Validate Results     ${searchKey}