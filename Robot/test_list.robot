***Settings***
Library           SeleniumLibrary
Library           DateTime
Library           Collections

Variables


***Test Cases***
list 4
    [Tags]      list4
    ${month}   ${year} =   Get current time
    log to Console    ${EMPTY}
    log to Console    month = ${month}
    log to Console   year = ${year}

    @{current_date} =   Get current time
    log to Console    ${EMPTY}
    log to Console    month = ${current_date}[0]
    log to Console   year = ${current_date}[1]

    Should be equal     ${month}   ${current_date}[0]
    Should be equal      ${year}    ${current_date}[1]
list5   
    [Tags]      list5
    ${eq} =   Create list     hello    hello 
    ${nq} =   Create list     not    equal 

    Should be equal   @{eq}
    Should be equal   ${eq}[0]     ${eq}[1]
    Should be equal   hello     hello   

    Collections.append to list     ${eq}     ${nq}
    log to Console    ${EMPTY}
    log to Console    ${eq}


test dict
    [Tags]      list5
    &{capital_city}  Create dictionary       thailand=bangkok      japan=tokyo      china=beijing
    #df
    log to Console    ${EMPTY}
    log to console   ${capital_city.thailand} 
    #us
    log to console         

***Keywords***
Get current time

        [Tags]  list4

        ${current} =  DateTime.Get current date     result_format=DateTime
        

        [Return]     ${current.month}     ${current.year}
