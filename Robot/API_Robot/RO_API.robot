*** Settings ***
Library   RequestsLibrary
Library   JSONLibrary
Library         DebugLibrary

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
    ${jason_body_req}   Create dictionary    text=I LOVE API SUD SUD   #สร้าง dictionary เพื่อทำนำไปเพื่อค่าในรูปแบบของ Json
    ${resources}    RequestsLibrary.Post        url=https://api.funtranslations.com/translate/yoda.json         expected_status=200             json=${jason_body_req}  # RequestsLibrary.Post ไปที่ url และให้ expected_status=200?  ด้วย json ที่สร้างไว้ที่คำสั่งด้านบน คือ ${jason_body_req}
    ${status_text}           JSONLibrary.Get value from json     ${resources.json()}     $.contents[text]   #JSONLibrary.Get value from json ดึงข้อมูลจาก ${resources} ด้านบน .json เพื่อนำข้อมูลที่เป้น json มาใช้ โดยเรียกจาก $.contents[text] ไปใส่ไว้ที่ ${status_text}
    Log to console     ${resources.json()} 
    BuiltIn.Should be equal as strings      ${status_text}[0]         I LOVE API SUD SUD     #นำข้อมูลจาก ${status_text}[0]  ใส่ [0] เพราะต้องการแต่ค่าข้องในไม่งั้นระบบจะเห็นว่าเป็น [I LOVE API SUD SUD]  และเอามาเทียบกัน


TC04 Post assests ms
    [Tags]  04
    ${jason_body_req}   Create dictionary   id=1234   firstname=aaaa    lastname=charoensri     
    
    ${resources}    RequestsLibrary.Post        url=http://localhost:3000/create         expected_status=200             json=${jason_body_req}
    Debuglibrary.debug
   
    BuiltIn.Should be equal as strings      ${resources.status_code}        200            #ตรวจสอบ status code โดยใช้  ${resources.status_code}
    
    ${status_text}           JSONLibrary.Get value from json      ${resources.json()}     $..firstname
    BuiltIn.Should be equal as strings   ${status_text}[0]    aaaa

    ${status_text}           JSONLibrary.Get value from json      ${resources.json()}     $..id
    BuiltIn.Should be equal as strings   ${status_text}[0]    1234

     ${status_text}           JSONLibrary.Get value from json      ${resources.json()}     $..lastname
    BuiltIn.Should be equal as strings   ${status_text}[0]    charoensri

    # ${resources}=    RequestsLibrary.Get      url=http://localhost:3000/getData      expected_status=200
    # ${assets_data}    JSONLibrary.Get value from json     ${resources.json()}       $.abilities[0].ability.name
    
TC05