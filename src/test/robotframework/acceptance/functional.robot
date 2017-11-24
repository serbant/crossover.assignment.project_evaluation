*** Settings ***
Documentation    Basic functional tests
Suite Teardown    Close All Browsers
Resource    ../settings/Settings.robot


*** Test Cases ***
Home Page Basic
    Open Browser    https://www.crossover.com    ${browser}
    Log Title
    Title Should Be    Crossover
    
Home Page Elements
    Page Should Contain Link    /for-candidates/
    Page Should Contain Link    /people/
    Page Should Contain Link    /playbooks/
    
    
For Candidates
    Go To    https://www.crossover.com/for-candidates
    Log Title
    Title Should Contain    For Candidates
    Title Should Contain    Crossover
    Page Should Contain Link    https://app.crossover.com/x/marketplace/available-jobs
    
Jobs Page
    Go to        https://app.crossover.com/x/marketplace/available-jobs
    Title Should Contain    Crossover
    Execute Javascript    window.document.key_text = window.document.querySelector('[ng-model="data.searchTxt"]');
    Execute Javascript    window.document.key_text.setAttribute("id", "key_text_id");
    ${key_text_id}=    Execute Javascript    return window.document.key_text.id;
    Page Should Contain Textfield    id=${key_text_id}
    
Search Jobs By Keyword Using Enter Key All Matches
    Go to        https://app.crossover.com/x/marketplace/available-jobs
    Execute Javascript    window.document.key_text = window.document.querySelector('[ng-model="data.searchTxt"]');
    Execute Javascript    window.document.key_text.setAttribute("id", "key_text_id");
    ${key_text_id}=    Execute Javascript    return window.document.key_text.id;
    Wait Until Element Is Visible    ${key_text_id}
    Press Key    ${key_text_id}    Chief
    Press Key    ${key_text_id}    \\13
    Wait Until Element is Visible    xpath=//button[@class='btn btn-primary btn-xs']
    Wait Until ELement Is Visible    xpath=//div[@class='cell title ng-binding']
    ${count}=    Get Matching Xpath Count    xpath=//div[@class='cell title ng-binding']
    Execute Javascript    window.document.results = window.document.getElementsByClassName("cell title ng-binding")
    :FOR    ${i}    IN RANGE    0    ${count}
    \    Execute Javascript    window.document.results[${i}].setAttribute("id","aaa${i}")
    \    ${result}=    Get Text     id=aaa${i}
    \    Log    ${result}
    \    Element Should Contain    id=aaa${i}    text=${matchOnTxt}
    
Search Jobs By Keyword Using Enter Key Min Match
    Go to        https://app.crossover.com/x/marketplace/available-jobs
    Execute Javascript    window.document.key_text = window.document.querySelector('[ng-model="data.searchTxt"]');
    Execute Javascript    window.document.key_text.setAttribute("id", "key_text_id");
    ${key_text_id}=    Execute Javascript    return window.document.key_text.id;
    Wait Until Element Is Visible    ${key_text_id}
    Press Key    ${key_text_id}    Chief
    Press Key    ${key_text_id}    \\13
    Wait Until Element is Visible    xpath=//button[@class='btn btn-primary btn-xs']
    Wait Until ELement Is Visible    xpath=//div[@class='cell title ng-binding']
    ${count}=    Get Matching Xpath Count    xpath=//div[@class='cell title ng-binding']
    Execute Javascript    window.document.results = window.document.getElementsByClassName("cell title ng-binding")
    :FOR    ${i}    IN RANGE    0    ${minMatches}
    \    Execute Javascript    window.document.results[${i}].setAttribute("id","aaa${i}")
    \    ${result}=    Get Text     id=aaa${i}
    \    Log    ${result}
    \    Element Should Contain    id=aaa${i}    text=${matchOnTxt}
    
    Click Element    xpath=//button[@class='btn btn-primary btn-xs']
    Execute Javascript    window.document.key_text = window.document.querySelector('[ng-model="data.searchTxt"]');
    Execute Javascript    window.document.key_text.setAttribute("id", "key_text_id");
    ${key_text_id}=    Execute Javascript    return window.document.key_text.id;
    Element Text Should Be    id=${key_text_id}    text=
    Page Should Not Contain Button    xpath=//button[@class='btn btn-primary btn-xs']