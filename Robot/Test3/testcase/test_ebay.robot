***Settings***
# Library           SeleniumLibrary

# Resource           ${CURDIR}/../keywords/pages/home_page.robot
# Variables          ${CURDIR}/../keywords/resources/testdata/testdata.yaml
# Resource            ${CURDIR}/../keywords/common.robot


Resource            ${CURDIR}/../keywords/imports.robot
***Test Cases***

test1 
    [Tags]   no_structures
    # SeleniumLibrary.Wait until element is visible   id=mainContent  30s
    # SeleniumLibrary.Input text    id=gh-ac    Speaker
    # SeleniumLibrary.click element    id=gh-btn
    common.openEbay 
    home_page.Search products by keyword   ${tc_01['search_keyword']}
    
    
    SeleniumLibrary.Wait until element is visible     xpath=//div[@id='mainContent']//li[contains(@class,'s-item')]

    ${result}=   Get text     //h1[@class='srp-controls__count-heading']//span[2]
    Should be equal     speaker    ${result}
    ${all_product}      Get webelements     //div[@id='srp-river-results']//h3[@class='s-item__title']

    FOR  ${products}    IN     @{all_product}
        ${products_name}    Get text    ${products}
        Log to console          ${EMPTY}
        Log to console      PRODUCT IS ${products_name}
    END

    Close All Browsers

    #สามารถหา keyword ของ SeleniumLibrary หรืออื่นๆได้ที่ docutment