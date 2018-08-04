function Install-LocalModule() {
    param(
        # Specifies a path to one or more locations.
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = "Path to one or more locations.")]
        [ValidateNotNullOrEmpty()]
        [string]
        $Path
    )

    $userModulePath = ($env:PSModulePath -split ';')[0]
    $moduleName = (Get-Item -Path $Path).BaseName
    $modulePath = Join-Path -Path $userModulePath -ChildPath $moduleName
    Remove-Module -Name $moduleName -ErrorAction SilentlyContinue
    Remove-Item -Path $modulePath -Recurse -ErrorAction SilentlyContinue
    Copy-Item -Path $Path -Recurse "$userModulePath\"
}