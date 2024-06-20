*** Settings ***
Library    SeleniumLibrary
Variables    /home/evgenii/my_projects/resources/variables.json

*** Test Cases ***
Успешный вход в систему с валидными данными
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath=//span[contains(text(), 'Войти')]
    Sleep    3s
    Input Text    css=input[name='email']    ${VALID_EMAIL}
    Sleep    3s
    Input Text    css=input[name='password']    ${VALID_PASSWORD}
    Sleep    3s   # Задержка для ожидания выполнения действия
    Click Element    xpath=//button[@class='b-btn b-btn_primary' and @type='submit']//span[@class='b-btn-label' and text()='Войти']
    Sleep    3s   # Задержка для ожидания выполнения действия
    Page Should Contain Element    xpath=//a[@class='b-btn b-btn_icon b-btn_ghost b-btn_dark b-btn_headEssential']//span[@class='b-btn-label' and text()='Личный кабинет']
    Close Browser

Вход в систему с невалидными данными
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath=//span[contains(text(), 'Войти')]
    Sleep    3s
    Input Text    css=input[name='email']    ${INVALID_EMAIL}
    Sleep    3s
    Input Text    css=input[name='password']    ${INVALID_PASSWORD}
    Sleep    3s   # Задержка для ожидания выполнения действия
    Click Element    xpath=//button[@class='b-btn b-btn_primary' and @type='submit']//span[@class='b-btn-label' and text()='Войти']
    Sleep    3s   # Задержка для ожидания выполнения действия
    Page Should Contain    Неверный логин или пароль
    Close Browser

Тест на вход без заполнения полей
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Click Element    xpath=//span[contains(text(), 'Войти')]
    Sleep    3s
    Click Element    xpath=//button[@class='b-btn b-btn_primary' and @type='submit']//span[@class='b-btn-label' and text()='Войти']
    Sleep    1s   # Задержка для ожидания выполнения действия
    Element Attribute Value Should Be    css=input[name='email']    required    true
    Element Attribute Value Should Be    css=input[name='password']    required    true
    Close Browser




