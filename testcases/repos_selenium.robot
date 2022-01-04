*** Settings ***
Resource          repos_selenium.resource
Suite Setup     Run Keywords
                 ...       Open browser then go to login screen

Test Setup      [test] setup
Test Teardown   Run Keywords
                ...     Delete all cookies
                ...     Reload page
Suite Teardown     close all browsers

*** Keywords ***
[test] setup
    Login to the system with new system user account
        ...     username=ngavt.apt@gmail.com
        ...     password=Hoangminhson1@

*** Test Cases ***
TC_001 - Retrieve information from this a github project
    [Tags]       github_project
    Repositories - Get total open issues are there across all repositories
    Repositories - Get repository has the most watchers






