*** Settings ***
Resource          ../Pages/RegistrationForm/RegistrationForm.robot

Library           DataDriver            ../DataDriver/Data.xlsx            sheet_name=RegistrationForm

Test Setup          Open And Login  
Test Template       Register Student Form
Test Teardown       Log Out 

*** Test Cases ***
Register Student Form Successfully ${firstName}    ${lastName}     ${email}     ${gender}   ${mobile}  ${dateOfBirth}  ${subjects}     ${hobbies}  ${picture}  ${address}  ${state}      ${city}  

*** Keywords ***
Register Student Form
    [Arguments]     ${firstName}    ${lastName}     ${email}     ${gender}   ${mobile}  ${dateOfBirth}  ${subjects}     ${hobbies}  ${picture}  ${address}  ${state}    ${city}
    Go To RegistrationFrom
    Input First Name            ${firstName}   
    Input Last Name             ${lastName}  
    Input Email                 ${email}
    Check Gender                ${gender}  
    Input Mobile                ${mobile}
    Select DateTime             ${dateOfBirth}
    Select Element Subjects     ${subjects}  
    Check Hobbies               ${hobbies} 
    Input Picture Path          ${picture} 
    Input Address               ${address}
    Select State                ${state}  
    Select City                 ${city}
    Click Submit                
    Submit Success 
    Validate Registration Form Data Is Saved Correctly      ${firstName}    ${lastName}     ${email}     ${gender}   ${mobile}  ${dateOfBirth}  ${subjects}     ${hobbies}  ${picture}  ${address}  ${state}    ${city}
