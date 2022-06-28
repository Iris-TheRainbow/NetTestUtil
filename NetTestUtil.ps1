$ErrorActionPreference = 'SilentlyContinue'
$main = "
 _______________________________________________________
|                                                       |
|                  Network Test Util                    |
|                                                       |
|                                                       |
|                                                       |
|    [1] Internet Check      [2] Local Network Check    |
|                                                       |
|                                                       |
|    [3] DNS Check           [4] Full Test              |
|                                                       |
|                                                       |
|    [5] Help                [6] Info                   |
|                                                       |
|                                                       |
|    [7] Exit                                           |
|                                                       |
|                                                       |
|_______________________________________________________| "

$n = 1

function CheckLAN
{
    $RouterIP = (Get-NetRoute "0.0.0.0/0").NextHop
    $LAN = Test-Connection $RouterIP -Quiet
}

function CheckInternet
{
    $internet = Test-Connection www.google.com -Quiet
}
function PressEnter
{
    $null = read-host “Press ENTER to run test”
}

function PressCont
{
    $null = read-host "Press enter to continue..."
}

Function PressReturn
{
    $null = read-host "Press enter to return to main menu"
}

function PressEnter2
{
    $null = Read-Host "Error, select proper function"
}

while( $n -eq 1 )
{
    echo $main
    
    $input = Read-Host -Prompt 'Choose'

    Clear-Host

    if( $input -eq 1 )
    {
        Echo '
 _______________________________________________________
|                                                       |
|                                                       |
|           Check The Internet Connection               |
|                                                       |
|_______________________________________________________|'
        PressEnter
        CheckInternet
        if( $internet -ieq 'true' )
        {
            echo 'Internet Connected'
        }
        else
        {
            echo 'No Internet'
        }
        PressCont
    }
    elseif( $input -eq 2 )
    {
        echo '
 _______________________________________________________
|                                                       |
|                                                       |
|           Check The Local Area Connection             |
|                                                       |
|_______________________________________________________|'
        PressEnter
        CheckLAN
        if( $LAN -ieq 'true' )
        {
            echo 'LAN Connected'
        }
        else
        {
            echo 'No LAN Connection'
        }
        PressCont
    }
    elseif( $input -eq 3 )
    {
        echo 'Check conection to DNS server'
        PressEnter
    }
    elseif( $input -eq 4 )
    {
        echo 'sucess!4'
        PressEnter
    }
    elseif( $input -eq 6 )
    {
        echo '
 _______________________________________________________
|                                                       |
|                  Network Test Util                    |
|                                                       |
|                                                       |
|      Credit Iris Huggie, programming and design       |
|                                                       |
|                                                       |
|  Network Test Utilities V0.3, Alpha proof of concept  |
|                                                       |
|                                                       |
|_______________________________________________________|'
        PressReturn
    }
    elseif( $input -eq 5 )
    {
        $x = 1
        $MainHelp = '
 _______________________________________________________
|                                                       |
|                Network Test Util Help                 |
|                                                       |
|                                                       |
|                                                       |
|    [1] Internet Check      [2] Local Network Check    |
|                                                       |
|                                                       |
|    [3] DNS Check           [4] Full Test              |
|                                                       |
|                                                       |
|    [5] Help                [6] Info                   |
|                                                       |
|                                                       |
|    [7] Exit                [8] Exit Help              |
|                                                       |
|                                                       |
|_______________________________________________________|'
                
        while( $x -eq 1 )
        {
            echo $MainHelp

            $input = Read-Host -Prompt 'Choose'

            Clear-Host

            if( $input -eq 1 )
            {
                Echo '
 _______________________________________________________
|                                                       |
|                                                       |
|           Check The Internet Connection               |
|   Pings google.com and sees if a reply ping is heard  |
|                                                       |
|_______________________________________________________|'
        
                PressCont
            }
            elseif( $input -eq 2 )
            {
                echo '
 _______________________________________________________
|                                                       |
|                                                       |
|        Check The Local Network Connection             |
|  Pings your router and sees if a reply ping is heard  |
|                                                       |
|_______________________________________________________|'
                PressCont
            }
            elseif( $input -eq 3 )
            {
                echo '
 _______________________________________________________
|                                                       |
|                                                       |
|           Check The DNS Server Connection             |
|  Pings your DNS server and listens for a reply ping   |
|                                                       |
|_______________________________________________________|'
                PressCont
            }
            elseif( $input -eq 4 )
            {
                echo '
 _______________________________________________________
|                                                       |
|                                                       |
|                    Run all tests                      |
|   Runs Network, DNS Server, and Local Network tests   |
|                                                       |
|_______________________________________________________|'
                PressCont
            }
            elseif( $input -eq 6 )
            {
                echo '
 _______________________________________________________
|                                                       |
|                        Info                           |
|  Provides information on version, publication date,   |
|                    and author(s)                      |
|_______________________________________________________|'
                PressCont
            }
            elseif( $input -eq 5 )
            {
                echo '
 _______________________________________________________
|                                                       |
|                          Help                         |
|        Provides information about each function       |
|_______________________________________________________|'

                PressCont
            }
            elseif( $input -eq 7 )
            {
                echo '
 _______________________________________________________
|                                                       |
|                         Exit                          |
|                  Exits to powershell                  |
|_______________________________________________________|'
                PressCont
            }
             elseif( $input -eq 8)
            {
                $x = 0
                echo 'Leaving Help'
            }
            else
            {
                echo else
                PressEnter2
            }
    
        }
        PressCont
    }
    elseif( $input -eq 7 )
    {
        $n = 0
        echo bye
    }
    else
    {
        echo else
        PressEnter2
    }
    Clear-Host
}