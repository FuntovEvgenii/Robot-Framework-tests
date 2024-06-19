*** Settings ***
Library    SeleniumLibrary
Variables    /home/evgenii/my_projects/resources/variables.json

*** Test Cases ***
Регистрация на сайте(главный кейс)
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath=//span[contains(text(), 'Войти')]
    Sleep    3s
    Click Element    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Sleep    3s
    Input Text    css=input[name='taxpayer-id']    ${VALID_INN}
    Sleep    3s
    Click Element    xpath=//span[contains(text(), 'ОК')]
    Sleep    3s
    Input Text    css=input[name='fio']    ${VALID_NAME}
    Sleep    3s
    Input Text    css=input[name='email']    ${VALID_EMAIL}
    Sleep    3s
    Input Text    css=input[name='tel']    ${VALID_PHONE}
    Sleep    3s
    Wait Until Element Is Visible    xpath=//span[@class='b-control-indicator']
    Scroll Element Into View    xpath=//span[@class='b-control-indicator']
    Click Element    xpath=//span[@class='b-control-indicator']
    Sleep    3s
    Scroll Element Into View    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Click Element    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Sleep    3s
    Wait Until Page Contains    Спасибо за регистрацию
    Close Browser

Проверка работы кнопки ОК в блоке ввода ИНН(ИНН уже есть в базе)
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath=//span[contains(text(), 'Войти')]
    Sleep    3s
    Click Element    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Sleep    3s
    Input Text    css=input[name='taxpayer-id']    ${VALID_INN}
    Sleep    3s
    Click Element    xpath=//span[contains(text(), 'ОК')]
    Wait Until Page Contains    Пользователь с таким ИНН уже зарегистрирован
    Close Browser


Регистрация на сайте с ИНН который есть в базе
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath=//span[contains(text(), 'Войти')]
    Sleep    3s
    Click Element    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Sleep    3s
    Input Text    css=input[name='taxpayer-id']    ${VALID_INN}
    Sleep    3s
    Input Text    css=input[name='fio']    Фанерный Александр Николаевич
    Sleep    3s
    Input Text    css=input[name='email']    ${VALID_EMAIL}
    Sleep    3s
    Input Text    css=input[name='tel']    ${VALID_PHONE}
    Sleep    3s
    Wait Until Element Is Visible    xpath=//span[@class='b-control-indicator']
    Scroll Element Into View    xpath=//span[@class='b-control-indicator']
    Click Element    xpath=//span[@class='b-control-indicator']
    Sleep    3s
    Scroll Element Into View    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Click Element    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Sleep    3s
    Wait Until Page Contains    Пользователь с таким ИНН уже зарегистрирован
    Close Browser

Регистрация на сайте без согласия с политикой
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath=//span[contains(text(), 'Войти')]
    Sleep    3s
    Click Element    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Sleep    3s
    Input Text    css=input[name='taxpayer-id']    ${INVALID_INN}
    Sleep    3s
    Input Text    css=input[name='fio']    Фанерный Александр Николаевич
    Sleep    3s
    Input Text    css=input[name='email']    ${VALID_EMAIL}
    Sleep    3s
    Input Text    css=input[name='tel']    ${VALID_PHONE}
    Sleep    3s
    Scroll Element Into View    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Click Element    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Sleep    3s
    Page Should Contain Element    xpath=//div[@class='b-errorMessage']
    Close Browser

Регистрация на сайте без заполнения полей
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath=//span[contains(text(), 'Войти')]
    Sleep    3s
    Click Element    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Sleep    3s
    Scroll Element Into View    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Click Element    xpath=//span[contains(text(), 'Зарегистрироваться')]
    Sleep    3s
    Page Should Contain Element    xpath=//div[@class='b-errorMessage']
    Close Browser
