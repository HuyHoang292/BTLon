*** Settings ***
Documentation    Test suite 
Library           SeleniumLibrary
Library           Process
Library           OperatingSystem

*** Variables ***
${URL}              https://alonhadat.com.vn/
${Dia diem}         Hà Nội
${Loai giao dich}   cho-thue
${Loai BDS}         van-phong
${PythonFile}       LayDuLieuWebBatDongSan.py

*** Test Cases ***
Lay Du Lieu Web Bat Dong San
    [Documentation]    Kiểm tra lấy dữ liệu bất động sản
    Mo Trang Web Bat Dong San    ${URL}
    Input Location     ${Dia diem}
    Chon Loai Giao Dich    ${Loai giao dich}
    Sleep    5s
    Chon Loai Bat Dong San    ${Loai BDS}
    Sleep    5s
    Search Credentials
    ${current_url}=    Get Location
    Sleep    2s
    Chay file python    ${current_url}

*** Keywords ***
Mo Trang Web Bat Dong San
    [Documentation]    Mở trang web bất động sản
    [Arguments]    ${URL}
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    css:.location    timeout=10

Input Location
    [Documentation]    Nhập địa điểm cần tìm
    [Arguments]    ${Dia diem}
    Input Text    css=.location    ${Dia diem}

Chon Loai Giao Dich
    [Documentation]    Chọn loại giao dịch: bán, thuê, cần mua, cần thuê
    [Arguments]    ${loai}
    Select From List By Value    css=.demand    ${loai}

Chon Loai Bat Dong San
    [Documentation]    Chọn loại bất động sản
    [Arguments]    ${loaiBDS}
    Select From List By Value    css=.property-type    ${loaiBDS}

Search Credentials
    [Documentation]    Nhấn nút tìm kiếm
    Wait Until Element Is Visible    css=.btnsearch    timeout=15
    TRY
        Click Element    css=.btnsearch
    EXCEPT
        Log To Console    Không tìm thấy nút tìm kiếm
    END

Chay file python
    [Arguments]    ${url}
    Log To Console    URL sau khi tìm kiếm: ${url}
    Run Process    python3    ${PythonFile}    ${url}
