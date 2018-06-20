Function Get-UniquePSWindow {

<#
.SYNOPSIS
    Change colour and title of Powershell Window
.DESCRIPTION
    This function is a good cmdlet to have loded in the profile if you need to distinctive a important PS console with a custom title
.PARAMETER CustomMessage
    The Message showed in the PS Title Window
.EXAMPLE
    Get-UniquePSWindow -CustomMessage "Connected to important customer"
.NOTES
    Author: eastrom
    Version: 1
#>

    [cmdletbinding()]

    Param(
        [parameter(Mandatory=$True)]
        [String]
        $CustomMessage
        )





#$AvalibleColours = [enum]::getnames([consolecolor]) | where{$_ -ne "White"}

    $AvailableColors = "Black","DarkBlue","DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkGray"
    $Color = Get-Random -InputObject $AvailableColors 


    $PSTitle = ("Windows PowerShell - "+$CustomMessage+" "+(Get-Date -format HH:mm))

#Set BG Colour
    $host.UI.RawUI.BackgroundColor = ($bckgrnd = $Color)
    $Host.PrivateData.ErrorBackgroundColor = $bckgrnd
    $Host.PrivateData.WarningBackgroundColor = $bckgrnd
    $Host.PrivateData.DebugBackgroundColor = $bckgrnd
    $Host.PrivateData.VerboseBackgroundColor = $bckgrnd
    $Host.PrivateData.ProgressBackgroundColor = $bckgrnd

#Set Window title
    if ($host.UI.RawUI.WindowTitle -match "Administrator") {
        $host.ui.RawUI.WindowTitle = ("Administrator: "+$PSTitle)
    }ELSE{
        $host.ui.RawUI.WindowTitle = $PSTitle
    }



Clear-Host

}