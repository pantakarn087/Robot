***Settings***

Library   SeleniumLibrary

*** Variables ***

${Main Content}     id=mainContent

***Keywords***

openEbay
        SeleniumLibrary.Open Browser        ${browser['url']}       ${browser['type']} 
        common.Wait until element is visible by locator   ${Main Content}   30

Wait until element is visible by locator   
        [Arguments]      ${locator}     ${timeout}=10   
        SeleniumLibrary.Wait until element is visible   ${locator}   30s
                                                        #   ถ้าไม่ใส่ timeout มันเป็น 5 วิ

Input text by locator
    [Arguments]     ${locator}      ${keyword}
    SeleniumLibrary.Input text  ${locator}      ${keyword}

Click element by locator
    [Arguments]     ${locator}         
    SeleniumLibrary.Click element                   ${locator}

Get text by locator
    [Arguments]     ${locator}
    [Return]        SeleniumLibrary.Get text     ${locator}

Close browser
    SeleniumLibrary.Close browser

        
