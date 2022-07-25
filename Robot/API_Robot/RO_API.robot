*** Settings ***
Library   RequestsLibrary
Library   JSONLibrary


*** Variables ***
${api.root.endpoint}      https://pokeapi.co/api/v2/pokemon/ditto
${api.root.Test.post}     https://api.funtranslations.com/translate/yoda.json

*** Test Cases ***
TC01 Get all assets
    [Tags]   01
    ${resources}=    RequestsLibrary.Get      url=${api.root.endpoint}       expected_status=200
    Log to console       ${resources.json()}      
    BuiltIn.Should be equal as strings      ${resources.status_code}        200
    # Log to console     ${resources.abilities.ability.name}

TC02 GET 
    [Tags]  02
    ${resources}=    RequestsLibrary.Get      url=${api.root.endpoint}       expected_status=200
    ${assets_data}    JSONLibrary.Get value from json     ${resources.json()}       $.abilities[0].ability.name
    Log to console     ${EMPTY}
    Log to console     ${assets_data} 

TC03 Post assests
    [Tags]  03
    ${jason_body_req}   Create dictionary    text=I LOVE API SUD SUD   
    ${resources}    RequestsLibrary.Post        url=https://api.funtranslations.com/translate/yoda.json         expected_status=200             json=${jason_body_req}
    ${status_text}           JSONLibrary.Get value from json     ${resources.json()}     $.contents[text]
    Log to console     ${resources.json()} 
    BuiltIn.Should be equal as strings      ${status_text}         I LOVE API SUD SUD

