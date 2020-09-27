*** Settings ***
Documentation  This is some basic info about the whole suite

# Copy/paste the line below into Terminal to execute:
# pybot -d results tests/amazon.robot
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  chrome
    Wait Until Page Contains  Hello, Sign in
    Input Text  id=twotabsearchtextbox  Ferrari 458
    #Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    click button  xpath=//*[@id="nav-search-submit-text"]/input
    Wait Until Page Contains  results for "Ferrari 458"
    Click Link  partial link:Ferrari 458 Italia
    # Click Link  css=#result_0 a.s-access-detail-page
    Wait Until Page Contains  Back to results
    Close Browser

*** Keywords ***
