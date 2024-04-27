Import-Module -Name .\InvokeCutRoH\InvokeCutRoH.psm1 -Scope Local -Force -Verbose

Describe  'InvokeCutRoH tests' {
    # Check if module exists, if not import it.
    BeforeAll {

        $ModInvokeCutRoH = Get-Module -Name InvokeCutRoH -All
        If ($ModInvokeCutRoH -eq $null) {
            Import-Module -Name ("..\" + "InvokeCutRoH" + "\" + "InvokeCutRoH.psm1")
        }
        else {
            Write-Verbose -Message "Module already installed/ imported." -Verbose
        }
    }

    # Check function Invoke-Cut.
    Context 'Check function Invoke-Cut' {
        $DemoString = "This is a demonstration string."

        It 'Check CutCharacterPos parameter' {
            Invoke-Cut -InputContent $DemoString -CutCharacterPos 0 | Should Be 'T'
        }

        It 'Check CutCharactersBetweenPos parameter' {
            Invoke-Cut -InputContent $DemoString -CutCharactersBetweenPos 0,5 | Should Be 'This '
        }

        It 'Check CutCharactersBetweenPos parameter' {
            Invoke-Cut -InputContent $DemoString -CutCharactersFromsign 'a' | Should Be ' demonstration string.'
        }

        It 'Check -CutCharactersBeforeSign parameter' {
            Invoke-Cut -InputContent $DemoString -CutCharactersBeforeSign '.' | Should Be "This is a demonstration string"
            Invoke-Cut -InputContent $DemoString -CutCharactersBeforeSign ' ' | Should Be 'This'
        }

        It 'Check CutCharactersBetweenSigns parameter' {
            Invoke-Cut -InputContent $DemoString -CutCharactersBetweenSigns "5","z" | Should Be $null
            Invoke-Cut -InputContent $DemoString -CutCharactersBetweenSigns " ","d" | Should Be 'is a '
            Invoke-Cut -InputContent $DemoString -CutCharactersBetweenSigns "d","." | Should Be 'emonstration string'
        }

        It 'Check CutCharactersMatchingPattern parameter' {
            Invoke-Cut -InputContent $DemoString -CutCharactersMatchingPattern "\d{2}\.\d{2}\.\d{4}" | Should Be $null
            Invoke-Cut -InputContent $DemoString -CutCharactersMatchingPattern "demonstration" | Should Be $DemoString
        }

        It 'Check CutCharactersMatchingPattern with CutOutPattern parameter' {
            Invoke-Cut -InputContent $DemoString -CutCharactersMatchingPattern "demo" -CutOutPattern | Should Be 'demo'
            Invoke-Cut -InputContent $DemoString -CutCharactersMatchingPattern "This" -CutOutPattern | Should Be 'This'
        }

        It 'Check StringDelimiter with Field parameter' {
            Invoke-Cut -InputContent $DemoString -StringDelimiter " " -Field 1,3 | Should Be 'This a'
            Invoke-Cut -InputContent $DemoString -StringDelimiter " " -Field 1,4 | Should Be 'This demonstration'
            Invoke-Cut -InputContent $DemoString -StringDelimiter ";" -Field 1,4 | Should Be $DemoString
        }

        It 'Check StringDelimiter with Field, OnlyDelimited and ResultDelimiter parameter ' {
            Invoke-Cut -InputContent $DemoString -StringDelimiter " " -Field 1,4 -OnlyDelimited -ResultDelimiter "|" | Should Be 'This|demonstration'
        }
    }
}