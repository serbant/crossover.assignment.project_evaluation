*** Settings ***
Documentation     A resource file to setup all variables.
Resource          profiles/${Profile}.txt
Library           SeleniumLibrary

*** Variables ***
${Profile}    Local
${browser}    jbrowser
${Selenium.Browser.Name}    ${browser}
${Selenium.Browser.Version}    17
${Selenium.Timeout}        30.0

${matchOnTxt}   Chief
${minMatches}   10



