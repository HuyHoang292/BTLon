*** Settings ***
Documentation    Test suite 
Library    SeleniumLibrary  
*** Variables ***
${URL}              https://alonhadat.com.vn/
${Dia diem}         

*** Test Cases ***

*** Keywords ***
Open Login Page
    [Documentation]    Mở trang login
    [Arguments]    ${URL}
    [Tags]    login    openpagex
    Open Browser    ${URL}    chrome
    Wait Until Element Is Visible    name=username    timeout=10
Input Username
    [Documentation]    Nhập username
    [Arguments]    ${username}
    [Tags]    login    input
    Input Text    name=username    ${username}
Input Password
    [Documentation]    Nhập password
    [Arguments]    ${password}
    [Tags]    login    input
    Input Text    name=password    ${password}
Submit Credentials
    [Documentation]    Nhấn nút login
    [Tags]    login    submit
    Wait Until Element Is Visible    css=button[type="submit"]    timeout=5
    TRY
        Click Element    css=button[type="submit"]
    EXCEPT
        Log To Console    Không tìm thấy nút submit
    END
Verify Login Success
    [Documentation]    Kiểm tra đăng nhập thành công
    [Tags]    login    verify
    Wait Until Page Contains    Cockpit    timeout=15
    Page Should Contain    Cockpit
    Log To Console    Successfully logged into application
Verify Login Failed
    [Documentation]    Kiểm tra đăng nhập thất bại
    [Tags]    login    verify
    Wait Until Page Contains    Invalid credentials    timeout=15
    Page Should Contain    Invalid credentials
    Log To Console    Login failed - Please check the information again
