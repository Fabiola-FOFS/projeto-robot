*** Settings ***
Resource    ../resources/keywords_login.resource
Suite Setup    Open Browser    browser=edge


*** Test Cases ***
Successful login
    I navigate to the login page
    I input correct credentials
    I click on the login button
    I am able view the home page
    
Unsuccessful Login - No credentials
    I navigate to the login page
    I input no credentials
    I click on the login button
    I am able to see the expected error message for no credentials
    
Unsuccessful Login - No Username
    I navigate to the login page
    Wait Until Element Is Visible    id=user-name
    I input only the password
    I click on the login button
    I am able to see the expected error message for no username


Unsuccessful Login - No password
    I navigate to the login page
    Wait Until Element Is Visible    id=user-name
    I input only the username
    I click on the login button
    I am able to see the expected error message for no password



Unsuccessful Login - Wrong credentials
    I navigate to the login page
    I input wrong credentials
    I click on the login button
    I am able to see the expected error message for wrong Credentials