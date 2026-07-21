1 <# Load the forms assembly module into your current memory session
 #>
Add-Type -AssemblyName System.Windows.Forms

2 <# Query the assembly to list every public class type that handles UI controls
 #>
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms").GetTypes() | 
    Where-Object { $_.IsPublic -and $_.IsClass -and $_.Namespace -eq "System.Windows.Forms" } | 
    Select-Object Name, BaseType | 
    Out-GridView

3 <# End of script. <# End of script (EOS). Code added below EOS: 
 #>
Start-Job -ScriptBlock {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms").GetTypes() | 
        Where-Object { $_.IsPublic -and $_.IsClass -and $_.Namespace -eq "System.Windows.Forms" } | 
        Select-Object Name, BaseType | 
        Out-GridView
}

Write-Host "End of Script" -ForegroundColor Green
