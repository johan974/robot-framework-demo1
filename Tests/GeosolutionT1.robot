*** Settings ***
Documentation  This is some basic info about the whole suite

# Copy/paste the line below into Terminal to execute:
# pybot -d results tests/amazon.robot
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
# Info = http://rtomac.github.io/robotframework-selenium2library/doc/Selenium2Library.html#Introduction
User must sign in to check out
    [Documentation]  Functional test of Geosolution
    [Tags]  Smoke
    Open Browser  http://localhost:8080  chrome
    Wait Until Page Contains  Username
    Input Text  id=username  test
    Input Text  id=password  test
#    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
#    Click Button  class:submit-login
    Click Button  Submit
    Wait Until Page Contains  Search
    Click link  Edit
    Wait Until Page Contains  Oplosser
    Input Text  id=gcid  geocache1
    Input Text  id=naam  geocache-naam-1
    Input Text  id=location  N52 12.123 E6 6.123
    Click Button  Save
    Wait Until Page Contains  OK
    Click link  Search
    Wait Until Page Contains  Search
    Input Text  id=search  geocache
    Click Button  Search
    Wait Until Page Contains  geocache-naam-1
    # Click on first LI item in the list of Ul id=xxx
    #Click element | > li:nth-child(1)
    # Click Element | css=#game_list > li:nth-child(1)
    # Click on LI item in UL id=xxx list with Text
    # Click Element | xpath=id('solvedCacheList')/li[text()='geocache-naam-1']
    # Assign Id To Element   id='solvedCacheList'>li:nth-child(1)  one
    # Click Element  one
    Click element  id=list-0
    Wait Until Page Contains  Extra hint
    #ELEMENT TEXT SHOULD BE  id=gcid  geocache1
    Click link  Logout
    # xpath: select, RM ... copy xpath: /html/body/app-root/div/app-search/div[3]/div/ul/li[1]
    Close Browser

*** Keywords ***
