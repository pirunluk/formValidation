*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${url}    https://form-validation-one-kohl.vercel.app/    
${browser}    gc
${firstname}    id=firstname
${lastname}    id=lastname
${email}    id=email
${password}    id=password
${mobile}    id=mobile
${gender}    name=gender
${javascript}    id=javascript
${python}    id=python
${java}    id=java
${ruby}    id=ruby
${experience}    id=experience

${errFirstname}    xpath=//*[@id="form"]/div[1]/div[1]/small
${errLastname}    xpath=//*[@id="form"]/div[1]/div[2]/small
${errEmail}    xpath=//*[@id="form"]/div[1]/div[3]/small
${errPassword}    xpath=//*[@id="form"]/div[1]/div[4]/small
${errMobile}    xpath=//*[@id="form"]/div[1]/div[5]/small

${registerBTN}    xpath=//*[@id="form"]/button

*** Keywords ***

Open Web Browser
    Set Selenium Speed    0.4s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Registration Form

Input Data Pass  
    Wait Until Element Is Visible    ${firstname}
    Wait Until Element Is Visible    ${lastname}
    Wait Until Element Is Visible    ${email}
    Wait Until Element Is Visible    ${password}
    Wait Until Element Is Visible    ${mobile}
    Wait Until Element Is Visible    ${gender}
    Wait Until Element Is Visible    ${python}
    Wait Until Element Is Visible    ${experience}
    Input Text    ${firstname}    Pirunluk
    Input Text    ${lastname}    Chadakit
    Input Text    ${email}    ppirunluck9@gmail.com 
    ${p}    Set Variable    1234567890
    Input Password    ${password}    ${p}
    Input Text    ${mobile}    0839284435
    Select Radio Button    gender    custom
    Select Checkbox Skill
    Select From List By Value    ${experience}    1 year
    Click Element    ${registerBTN}  

Input Firstname Fail
    [Arguments]    ${input}
    Wait Until Element Is Visible    ${firstname}
    Input Text    ${firstname}    ${input}
    Click Element    ${registerBTN} 

Input Lastname Fail
    [Arguments]    ${input}
    Wait Until Element Is Visible    ${lastname}
    Input Text    ${lastname}    ${input}
    Click Element    ${registerBTN} 

Input Email Fail
    [Arguments]    ${input}
    Wait Until Element Is Visible    ${email}
    Input Text   ${email}    ${input}   
    Click Element    ${registerBTN} 

Input Password Pass
    [Arguments]    ${input}
    Wait Until Element Is Visible    ${password}
    Input Password    ${password}    ${input}   
    Click Element    ${registerBTN} 

Input Password Fail
    [Arguments]    ${input}
    Wait Until Element Is Visible    ${password}
    Input Text   ${password}    ${input}    
    Click Element    ${registerBTN} 

Input Mobile Fail
    [Arguments]    ${input}
    Wait Until Element Is Visible    ${mobile}
    Input Text   ${mobile}    ${input}   
    Click Element    ${registerBTN} 

Select Checkbox Skill 
    Wait Until Element Is Visible    ${python}
    Wait Until Element Is Visible    ${java}
    Select Checkbox    ${python}
    Select Checkbox    ${java}

Verify Err Msg Firstname
    Wait Until Element Is Visible    ${errFirstname}
    ${txt}    Get Text    ${errFirstname}
    Should Be Equal As Strings    ${txt}    Firstname must be in English only

Verify Err Msg Lastname
    Wait Until Element Is Visible    ${errLastname}
    ${txt}    Get Text    ${errLastname}
    Should Be Equal As Strings    ${txt}    Lastname must be in English only

Verify Err Msg Email
    Wait Until Element Is Visible    ${errEmail}
    ${txt}    Get Text    ${errEmail}
    Should Be Equal As Strings    ${txt}    Must be a valid email

Verify Err Msg Password
    Wait Until Element Is Visible    ${errPassword}
    ${txt}    Get Text    ${errPassword}
    Should Be Equal As Strings    ${txt}    Password must be at least 8 characters

Verify Err Msg Mobile
    Wait Until Element Is Visible    ${errMobile}
    ${txt}    Get Text    ${errMobile}
    Should Be Equal As Strings    ${txt}    Must be a valid mobile number

Not Fill Data
    Wait Until Element Is Visible    ${registerBTN}
    Click Element    ${registerBTN}
    Wait Until Element Is Visible    ${errFirstname}
    ${t}    Get Text    ${errFirstname}
    Should Be Equal As Strings    ${t}    Firstname is required    
    Wait Until Element Is Visible    ${errLastname}  
    ${t}    Get Text    ${errLastname}
    Should Be Equal As Strings    ${t}    Lastname is required   
    Wait Until Element Is Visible    ${errEmail}     
    ${t}    Get Text    ${errEmail}
    Should Be Equal As Strings    ${t}    Email is required   
    Wait Until Element Is Visible    ${errPassword}
    ${t}    Get Text    ${errPassword}
    Should Be Equal As Strings    ${t}    Password is required  
    Wait Until Element Is Visible    ${errMobile} 
    ${t}    Get Text    ${errMobile}
    Should Be Equal As Strings    ${t}    Mobile number is required   

*** Test Cases ***

TC-1 Input Data Pass
    Open Web Browser
    Input Data Pass
    Close Browser

TC-2 Input Password Pass
    @{list}    Create List    รหัสผ่านน    password    /*-+!@#$
    FOR  ${i}  IN  @{list}
        Open Web Browser
        Input Password Pass    ${i}
        Close Browser
    END

TC-3 Input Firstname List Fail
    @{list}    Create List    พิรุฬห์ลักษณ์    12345    /*-+@#
    FOR  ${i}  IN  @{list}
        Open Web Browser
        Input Firstname Fail    ${i}
        Verify Err Msg Firstname 
        Close Browser
    END

TC-4 Input Lastname List Fail
    @{list}    Create List    ชฎากิจ    12345    /*-+@#
    FOR  ${i}  IN  @{list}
        Open Web Browser
        Input Lastname Fail    ${i}
        Verify Err Msg Lastname
        Close Browser
    END

TC-5 Input Email List Fail
    @{list}    Create List    ppirunluck9gmail.com    ไทย    @#$%+-@gmail.com
    FOR  ${i}  IN  @{list}
        Open Web Browser
        Input Email Fail    ${i}
        Verify Err Msg Email
        Close Browser
    END

TC-6 Input Password List Fail
    @{list}    Create List    1234567    aaa    /*-    ไทย
    FOR  ${i}  IN  @{list}
        Open Web Browser
        Input Password Fail    ${i}
        Verify Err Msg Password
        Close Browser
    END

TC-7 Input Mobile List Fail
    @{list}    Create List    0839284    เบอร์โทร    +82 10-4311-0596
    FOR  ${i}  IN  @{list}
        Open Web Browser
        Input Mobile Fail    ${i}
        Verify Err Msg Mobile
        Close Browser
    END

TC-8 Not Fill Data Faill
    Open Web Browser
    Not Fill Data
    Close Browser



    


