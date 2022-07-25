*** Settings ***
Library   RequestsLibrary
Library   JSONLibrary


*** Variables ***
${api.root.endpoint}      https://pokeapi.co/api/v2/pokemon/ditto

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