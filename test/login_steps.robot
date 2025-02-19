*** Settings ***
Library    SeleniumLibrary 
Resource    ../resources/keywords_login.resource
Test Setup    Open Browser    browser=edge

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROSER}    edge
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Successful login
    I navigate to the login page    ${URL}
    I input correct credentials    ${USERNAME}    ${PASSWORD}
    I click on the login button
    I am able view the home page
    
Unsuccessful Login - No credentials     
    I navigate to the login page    ${URL}
    I input no credentials 
    I click on the login button
    I am able to see the expected error message     Epic sadface: Username is required
    
Unsuccessful Login - No Username
    I navigate to the login page    ${URL}
    Wait Until Element Is Visible    id=user-name
    I input only the password    ${PASSWORD}
    I click on the login button
    I am able to see the expected error message     Epic sadface: Username is required
  


Unsuccessful Login - No password
    I navigate to the login page    ${URL}
    Wait Until Element Is Visible    id=user-name
    I input only the username    ${USERNAME}
    I click on the login button
    I am able to see the expected error message    Epic sadface: Password is required
  


Unsuccessful Login - Wrong credentials
    I navigate to the login page    ${URL}
    I input wrong credentials    TESTE    TESTE
    I click on the login button
    I am able to see the expected error message    Epic sadface: Username and password do not match any user in this service