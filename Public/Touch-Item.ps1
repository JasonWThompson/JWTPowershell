Function Touch-Item
{
    param(
        [Parameter(Mandatory = $true)]
        [String]
        $Path
    )
    
    if(Test-Path $Path)
    {
        (Get-ChildItem $Path).LastWriteTime = Get-Date
    }
    else
    {
        New-Item -Path $Path -ItemType File
    }
}