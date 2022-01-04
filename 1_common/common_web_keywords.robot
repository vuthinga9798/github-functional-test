*** Settings ***
Resource           ../0_resources/imports.robot
Library           ./lib/commonweb.py

*** Keywords ***
Open browser ${url} with ${browser} browser
    [Documentation]    chrome, headlesschrome
    Start Chrome Headless Browser    ${url}
    Run Keyword If    '${browser}' == 'chrome'        Start Chrome Browser    ${url}
    ...    ELSE IF    '${browser}' == 'headlesschrome'       Start Chrome Headless Browser    ${url}
    ...    ELSE    fail

Wait for element to appear on page
    [Arguments]    ${locator}    ${timeout}=30
    [Documentation]    Try to wait for element at ${locator} with the total timeout of ${timeout}
    wait until keyword succeeds    ${timeout}s    1s    element should be visible    ${locator}

Go to page
    ${admin_web_url}      Catenate    SEPARATOR=    ${github_host}    ${repositories_path}
    Open browser ${admin_web_url} with ${browser} browser

Open browser then go to login screen
    Go to page

Login to the system with new system user account
    [Arguments]    ${username}=${suite_admin_username}    ${password}=${suite_admin_password}
    wait for element to appear on page    //a[contains(text(),'Sign in')]       60
    click element       //a[contains(text(),'Sign in')]
    wait for element to appear on page    //input[@id='login_field']       60
    input text     //input[@id='login_field']     ${username}
    input text     //input[@id='password']     ${password}
    click element       //input[@value='Sign in']
    wait until page does not contain element    //a[contains(text(),'Sign in')]    15s    No notification message has popped up
