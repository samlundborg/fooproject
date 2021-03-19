*** Keywords ***
Begin Web Test
    Open browser                    about:blank  ${BROWSER}
    Maximize Browser Window


Go to Web Page
    Load Page
    Verify Page Loaded

Load Page
    Go to                           ${URL}

Verify Page Loaded
    ${title_text}                    Get Title
    Should Be Equal                 ${title_text}        Infotiv Car Rental


Book starting today - for one month
    ${mm}  ${dd} =	                Get Time            month,day
    ${xm}                           Evaluate            ${mm}[1:]+1
    Input Text                      id:end              "0${xm}-${dd}"
    Verify Text exists              What would you like to drive?

Book starting today - for one month and a day
    ${mm}  ${dd} =	                Get Time            month,day
    ${xm}                           Evaluate            ${mm}[1:]+1
    ${xd}                           Evaluate            ${dd}+1
    Input Text                      id:end              "0${xm}-${xd}"
    Verify Text exists              When do you want to make your trip?

Book starting yesterday - for 3 days
    ${mm}  ${dd} =	                Get Time            month,day
    ${xd}                           Evaluate            ${dd}-1
    Input Text                      id:start            "${mm}-${xd}"
    ${xd}                           Evaluate            ${dd}+2
    Input Text                      id:end              "${mm}-${xd}"
    Verify Text exists              When do you want to make your trip?

Book starting in a month - for 3 days
    ${mm}  ${dd} =	                Get Time            month,day
    ${xm}                           Evaluate            ${mm}[1:]+1
    ${xd}                           Evaluate            ${dd}+1
    Input Text                      id:start            "0${xm}-${xd}"
    ${xd}                           Evaluate            ${dd}+2
    Input Text                      id:end              "0${xm}-${xd}"
    Verify Text exists              When do you want to make your trip?

Verify Text exists
    [Arguments]                     ${wanted_text}
    Click Element                   id:continue
    Wait until Page Contains Element                    id:questionText
    ${actual_text}                  Get Text            id:questionText
    Should Be Equal                 ${actual_text}      ${wanted_text}

See history
#    Create User
    Log in
    Select day
    Book Car
    Confirmed Booking with Card
    Verify Booked Car in My Page
    ${id_number}=                   Get Text            id:order1
    ${booking_number}=              Convert To Integer  ${id_number}
    Click Element                   id:unBook1
    ${alert_message}=               Handle Alert
    Should Be Equal                 ${alert_message}    are you sure you want cancel Order No: ${booking_number}??
    Click Element                   id:mypage
    Click Element                   id:show
    Sleep                           2s
    ${history_title}                Get Text            xpath://html/body/div/div[2]/div[3]/div/h1
    Should Be Equal                 ${history_title}    My order history

Create User
    Click Element                   id:createUser
    Wait Until Page Contains        Create a new user
    Input Text                      id:name             SamWise
    Input Text                      id:last             Gangee
    Input Text                      id:phone            0706042980
    ${email}=                       Set Variable        samG@midearth.org
    Input Text                      id:emailCreate      ${email}
    Input Text                      id:confirmEmail     ${email}
    ${password}=                    Set Variable        superSafePassword
    Input Text                      id:passwordCreate   ${password}
    Input Text                      id:confirmPassword  ${password}
    Click Element                   id:create
    Wait Until Page Contains Element                    id:welcomePhrase
    ${actual_phrase}                Get Text            id:welcomePhrase
    Should Be Equal                 ${actual_phrase}    You are signed in as SamWise

Log in
    Input Text                      id:email            samG@midearth.org
    Input Password                  id:password         superSafePassword
    Click Element                   id:login
    Wait Until Page Contains Element                    id:logout
    ${actual_phrase}                Get Text            id:welcomePhrase
    Should Be Equal                 ${actual_phrase}    You are signed in as SamWise

Select day
    Verify Text exists              What would you like to drive?

Book Car
    Click Element                   id:filterMakeHolder
    Select Checkbox                 id:ms-opt-1
    Click Element                   id:filterPassHolder
    Select Checkbox                 id:ms-opt-6
    Wait Until Page Contains Element                    id:carSelect1
    Click Element                   id:carSelect1
    Page Should Contain             Confirm booking of

Confirmed Booking with Card
    Input Text                      id:cardNum          1234567890123456
    Input Text                      id:fullName         Samuel Gangee
    Input Text                      id:cvc              123
    Click Element                   id:confirm
    ${confirmation}                 Get Text            class:mediumText
    Should Be Equal                 ${confirmation}     You can view your booking on your page

Verify Booked Car in My Page
    Click Element                   id:mypage
    Page Should Contain Element     class:orderTDg


Cancel car
    Log in
    Verify Booked Car in My Page
    ${id_number}=                   Get Text            id:order1
    ${booking_number}=              Convert To Integer  ${id_number}
    Click Element                   id:unBook1
    ${alert_message}=               Handle Alert
    Should Be Equal                 ${alert_message}    are you sure you want cancel Order No: ${booking_number}??
    Click Element                   id:title

End Web Test
    Close All Browsers
