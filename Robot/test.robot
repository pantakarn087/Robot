***Settings***
Library   OperatingSystem
Library     String

***Keywords***
Read CSV File
            ${CSV}      Get File            test.csv
            @{Read}     Create List         ${CSV}           
            @{lines}    Split to Lines      @{Read}
                         
            FOR   ${Line}  IN   @{lines}
                    
                    log to Console      \n${Line}
            END



***Variables

***Test Cases***
Get csv 
        Read CSV File
       