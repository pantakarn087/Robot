***Settings***
Library           SeleniumLibrary
Library           DateTime
Library           Collections
Resource      ${curdir}   ..keywords\pages\home_page.robot      


***Keywords***
Get current second

        [Tags]  list4

        ${current} =  DateTime.Get current date     result_format=DateTime
         

        [Return]     ${current.second}     

*** Tasks ***

Demo if condition
    [Tags]    if1
      
    FOR   ${i}   IN RANGE   999999
            ${current.sec}      Get current second
                
        IF    ${current.sec} <= ${30} and ${current.sec} >= ${1} 
                log to Console    ${EMPTY}
                Log to console  Current second is ${current.sec} Low
        ELSE IF    ${current.sec} <= ${59} and ${current.sec} >= ${31} 
                log to Console    ${EMPTY}
                Log to console  Current second is ${current.sec} HIGH
        ELSE    
                log to Console    ${EMPTY}
                Log to console  Current second is ${current.sec} Jackpot
                Exit for loop if    ${current.sec} == ${0}
                
        END
            Sleep    1s
    END



# Demo loop
#     [Tags]    loop
#     ${heroes} =    Create list    Batman     Spiderman   Superman  ROckman     Anpaman
#     log to Console    ${EMPTY}
#     FOR  ${hero}    IN   @{heroes}
#         Log to console   ${hero}
#     END

# Demo loop2
#     [Tags]    loop2
#     log to Console    ${EMPTY}
#     FOR  ${index}    IN RANGE  0  10  1
#         Log to console   ${index}
#     END