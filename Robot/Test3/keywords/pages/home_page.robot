***Settings***
Library           SeleniumLibrary
Variables           ${CURDIR}/../resources/testdata/testdata.yaml
Resource            ${CURDIR}/../common.robot

*** Variables ***




${Search lo}           id=gh-ac

${Search Botton}          id=gh-btn

*** Keywords ***


Open ebey 
    # log to console     ${CURDIR}
    SeleniumLibrary.Open Browser        ${browser['url']}       ${browser['type']} 
    # SeleniumLibrary.Wait until element is visible   ${Main Content}   30s

Search products by keyword
    [Arguments]      ${keyword}   #ขอพารามิตเตอร์
    # SeleniumLibrary.Input text     ${Search lo}      ${Search text}
    # SeleniumLibrary.click element     ${Search Botton} 
    common.Input text by locator  ${Search lo}    ${keyword} 
    common.Click element by locator   ${Search Botton}

