*** Settings ***
Resource           ../1_common/imports.robot

*** Keywords ***
Repositories - Get total open issues are there across all repositories
    wait until keyword succeeds    30s    1s    Element should be visible      ${lst_repositories}
    ${calculated_total_issuses} =    set variable    0
    ${issue_opened_elements}    Get WebElements     ${lst_repositories}//*[contains(@class, 'octicon-issue-opened')]/parent::a
    ${length}    get length    ${issue_opened_elements}
    FOR    ${i}    IN RANGE    0    ${length}
        ${issue_text}    get text    ${issue_opened_elements[${i}]}
        ${calculated_total_issuses} =    Evaluate    ${calculated_total_issuses}+${issue_text}
    END

    ${description}=  Evaluate  "${GREEN}A: Total open issues are there across all repositories ="
    ${total_issuse}=  Evaluate  "${ORANGE}${calculated_total_issuses}"
    log to console  \n${description} ${total_issuse}

Repositories - Get repository has the most watchers
    wait until keyword succeeds    30s    1s    Element should be visible      ${lst_repositories}
    ${repositorie_elements}    Get WebElements     //div[@id='org-repositories']//h3//a
    ${length}    get length    ${repositorie_elements}

    ${url_list}    Create list
    FOR    ${i}    IN RANGE    0    ${length}
        ${href} =    Get Element Attribute    ${repositorie_elements[${i}]}    href
        append to list    ${url_list}    ${href}
    END

    ${arg_dic}     create dictionary
    FOR    ${i}    IN RANGE    0    ${length}
        Go To      ${url_list}[${i}]
        wait until keyword succeeds    30s    1s    Element should be visible      //span[@id='repo-notifications-counter']
        ${cell_text}    get text    //span[@id='repo-notifications-counter']
        ${value}     convert str to number      ${cell_text}
        [common] - Set default value for keyword in dictionary   ${arg_dic}    ${url_list}[${i}]         ${value}
    END
    ${sort_dict}    sort_dict   ${arg_dic}
    ${description}=  Evaluate  "${GREEN}C: Repository has the most watchers="
    ${most_watcher}=  Evaluate  "${ORANGE}${sort_dict}\\033[0m"

    log to console       ${description} ${most_watcher}

*** Variables ***
${GREEN}    \\033[32m
${ORANGE}   \\033[34m
${lst_repositories}     //div[@id='org-repositories']
