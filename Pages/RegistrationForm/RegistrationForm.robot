*** Settings ***
Resource          ../../Resources/Common.robot
#Resource          ../../Data/RegistrationForm/Data_RegistrationForm.robot
Resource          ../../Data/RegistrationForm/Locator_RegistrationForm.robot

*** keywords ***

Validate In Table Submit
    [Arguments]                             ${value}
    IF                                      "${value}" != "${EMPTY}"
        ${clickElementByText_Locator}=      Replace String          ${clickElementByText_Locator}          value          ${value}
        Element Text Should Be              ${clickElementByText_Locator}      ${value}
    END

Validate Date Of Birth In Table Submit
    [Arguments]                             ${value}
    IF                                      "${value}" != "${EMPTY}"
        ${dateFormat}=                      Convert Date     ${value}      datetime
        ${month}=                           Evaluate                        "${dateFormat.month}"
        IF                                  "${month}" == "1"
            ${month}=                       Evaluate                        "January"
        ELSE IF                             "${month}" == "2"
            ${month}=                       Evaluate                        "February"
        ELSE IF                             "${month}" == "3"
            ${month}=                       Evaluate                        "March"
        ELSE IF                             "${month}" == "4"
            ${month}=                       Evaluate                        "April"
        ELSE IF                             "${month}" == "5"
            ${month}=                       Evaluate                        "May"
        ELSE IF                             "${month}" == "6"
            ${month}=                       Evaluate                        "June"
        ELSE IF                             "${month}" == "7"
            ${month}=                       Evaluate                        "July"
        ELSE IF                             "${month}" == "8"
            ${month}=                       Evaluate                        "August"
        ELSE IF                             "${month}" == "9" 
            ${month}=                       Evaluate                        "September"
        ELSE IF                             "${month}" == "10"
            ${month}=                       Evaluate                        "October"
        ELSE IF                             "${month}" == "11"
            ${month}=                       Evaluate                        "November"
        ELSE IF                             "${month}" == "12"
            ${month}=                       Evaluate                        "December"
        END
        Validate In Table Submit            ${dateFormat.day} ${month},${dateFormat.year}
    END

Validate Picture In Table Submit
    [Arguments]                             ${value}
    IF                                      "${value}" != "${EMPTY}"
        ${index}                            Evaluate                            "1"
        FOR                                 ${index}        IN RANGE            9999999  
            ${index}=                       Evaluate                            "${value}".rfind('/')
            ${value}=                       Evaluate                            "${value}"[1:]
            Exit For Loop If	            ${index} == 0
        END
        Validate In Table Submit            ${value}
    END

Validate Registration Form Data Is Saved Correctly
    [Arguments]     ${firstName}    ${lastName}     ${email}     ${gender}   ${mobile}  ${dateOfBirth}  ${subjects}     ${hobbies}  ${picture}  ${address}  ${state}    ${city}
    Validate In Table Submit                        ${firstName} ${lastName}
    Validate In Table Submit                        ${email}
    Validate In Table Submit                        ${gender}
    Validate In Table Submit                        ${mobile}
    Validate Date Of Birth In Table Submit          ${dateOfBirth}
    Validate In Table Submit                        ${subjects}
    Validate In Table Submit                        ${hobbies}
    Validate Picture In Table Submit                ${picture}
    Validate In Table Submit                        ${address}
    Validate In Table Submit                        ${state}
    Validate In Table Submit                        ${city}

Go To RegistrationFrom
    Go To                       ${UrlRegistrationFrom} 

Submit Success
    Modal Is Shown              ${modalTitle_Locator}  

Input First Name
    [Arguments]         ${value}
    Input Text Field    ${firstName_Locator}    ${value}

Input Last Name
    [Arguments]         ${value}
    Input Text Field    ${lastName_Locator}    ${value}

Input Email
    [Arguments]             ${value}
    IF                      "${value}" != "${EMPTY}"
        Input Text Field    ${email_Locator}    ${value}
    END

Check Gender
    [Arguments]         ${value}
    Click By Value      ${value}
   
Input Mobile
    [Arguments]         ${value}
    Input Text Field    ${mobile_Locator}    ${value}

Check Hobbies
    [Arguments]             ${value}
    IF                      "${value}" != "${EMPTY}"
        Click By Value      ${value}
    END

Select State
    [Arguments]                         ${value}
    IF                                  "${value}" != "${EMPTY}"
        Select Dropdown By Text         ${state_Locator}    ${value}
    END

Select City
    [Arguments]                         ${value}
    IF                                  "${value}" != "${EMPTY}"
        Select Dropdown By Text         ${city_Locator}    ${value}
    END
  

Select DateTime
    [Arguments]                         ${value}
    IF                                  "${value}" != "${EMPTY}"
        ${dateFormat}=                  Convert Date     ${value}      datetime
        Click Element                   ${dataOfBirth_Locator}
        Select From List By Value       css:.react-datepicker__year-select     ${dateFormat.year}     #year
        ${month}=                       Evaluate                               ${dateFormat.month}-1
        Select From List By Value       css:.react-datepicker__month-select    ${month}     #${dateFormat.month}     #month
        Wait Until Element Is Visible   xpath=//*[@class="react-datepicker__week"]//div[contains(text(),'${dateFormat.day}')]
        Click Element                   xpath=//*[@class="react-datepicker__week"]//div[contains(text(),'${dateFormat.day}')]       #day
    END

Select Element Subjects
    [Arguments]                             ${value}
    IF                                      "${value}" != "${EMPTY}"
        Input Text Field                    ${subjects_Locator}         ${value}
        ${subjectsClickElement_Locator}     Replace String              ${subjectsClickElement_Locator}       'value'      '${value}'
        Wait Until Element Is Visible       ${subjectsClickElement_Locator}
        Click Element                       ${subjectsClickElement_Locator}
    END

Input Picture Path
    [Arguments]             ${value}
    IF                      "${value}" != "${EMPTY}"
        Input Text Field    ${picture_Locator}    ${value}
    END


Input Address
    [Arguments]         ${value}
    Input Text Field    ${address_Locator}    ${value}


Click Submit
    Wait Until Element Is Visible   ${submitBtn_locator}
    Click Element                   ${submitBtn_locator}

Modal Is Shown
    [Arguments]                     ${locator}   
    Wait Until Element Is Visible   ${locator}  
    Element Should Be Visible       ${locator}     