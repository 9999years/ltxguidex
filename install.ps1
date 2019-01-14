[CmdletBinding()]
Param(
	[String] $TexMFRoot = "~/texmf"
)

$className = "ltxguidex"
$class = "$className.cls"
$dest = (Join-Path $TexMFRoot "tex/latex/$className")
If(!(Test-Path $class)) {
    Write-Error "$class should exist but doesn't"
}
If(!(Test-Path $dest)) {
	mkdir $dest
}

cp "$class" $dest
pushd
cd ~
kpsewhich "$class"
popd
