*** Settings ***
Documentation           This is a test suite for testing Car Rental website.
Resource                ../Resources/keywords.robot
Library                 SeleniumLibrary
Test Setup              Begin Web Test
Test Teardown           End Web Test

*** Variables ***
${BROWSER}              chrome
${URL}                  http://rental27.infotiv.net/

*** Test Cases ***
User can book for one month
    [Documentation]     Test #1, testing selecting correct date
    [Tags]              Date_Select
    Go to Web Page
    Book starting today - for one month

User can not book for one day over one month
    [Documentation]     Test #2, testing selecting incorrect end-date
    [Tags]              Date_Select
    Go to Web Page
    Book starting today - for one month and a day

User can not book from yesterday
    [Documentation]     Test #3, testing selecting incorrect start-date
    [Tags]              Date_Select
    Go to Web Page
    Book starting yesterday - for 3 days

User can not book a month prior
    [Documentation]     Test #4, testing selecting incorrect start-date
    [Tags]              Date_Select
    Go to Web Page
    Book starting in a month - for 3 days

