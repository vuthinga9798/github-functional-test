*** Settings ***
Resource          ../0_resources/imports.robot


*** Keywords ***
[common] - Set default value for keyword in dictionary
    [Arguments]    ${dic}    ${key}    ${default_value}
    ${get_key_result}    Evaluate    $dic.get("${key}", ${default_value})
    Set to dictionary    ${dic}    ${key}    ${get_key_result}
    [Return]    ${dic}
