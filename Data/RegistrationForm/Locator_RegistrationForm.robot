*** Variables ***

${firstName_Locator}                id=firstName
${lastName_Locator}                 id=lastName
${email_Locator}                    id=userEmail
${mobile_Locator}                   id=userNumber
${dataOfBirth_Locator}              id=dateOfBirthInput
${subjects_Locator}                 id=subjectsInput
${subjectsClickElement_Locator}     //*[@id="subjectsContainer"]/div[2]/div//div[contains(text(),'value')]
${hobbies_Locator}                  //*[@id="hobbiesWrapper"]/div[2]/div[1]/label
${picture_Locator}                  id=uploadPicture
${address_Locator}                  id=currentAddress
${state_Locator}                    xpath=//div[@id='state']//div
${city_Locator}                     xpath=//div[@id='city']//div

${submitBtn_locator}                id=submit
${modalTitle_Locator}               id=example-modal-sizes-title-lg