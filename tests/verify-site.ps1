$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$indexPath = Join-Path $root "index.html"
$designPath = Join-Path $root "DESIGN.md"

function Assert-True {
  param(
    [bool]$Condition,
    [string]$Message
  )

  if (-not $Condition) {
    throw $Message
  }
}

function Text-FromCodepoints {
  param([int[]]$Codepoints)

  $builder = New-Object System.Text.StringBuilder
  foreach ($codepoint in $Codepoints) {
    [void]$builder.Append([char]$codepoint)
  }
  return $builder.ToString()
}

$parkName = Text-FromCodepoints @(0xBC15, 0xCC44, 0xACBD)
$makeupResearcher = Text-FromCodepoints @(0xBA54, 0xC774, 0xD06C, 0xC5C5, 0x0020, 0xB514, 0xC790, 0xC778, 0x0020, 0xC5F0, 0xAD6C, 0xC790)
$skunivDepartment = Text-FromCodepoints @(0xC11C, 0xACBD, 0xB300, 0xD559, 0xAD50, 0x0020, 0xAE00, 0xB85C, 0xBC8C, 0xBA54, 0xC774, 0xD06C, 0xC5C5, 0xB514, 0xC790, 0xC778, 0xD559, 0xACFC)
$virtualHuman = Text-FromCodepoints @(0xBC84, 0xCD94, 0xC5BC, 0x0020, 0xD734, 0xBA3C)
$unLace = Text-FromCodepoints @(0xC5B8, 0xB808, 0xC774, 0xC2A4)

Assert-True (Test-Path -LiteralPath $indexPath) "index.html should exist"
Assert-True (Test-Path -LiteralPath $designPath) "DESIGN.md should document the visual direction"

$html = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)
$design = [System.IO.File]::ReadAllText($designPath, [System.Text.Encoding]::UTF8)

Assert-True ($html -match "<title>[^<]*$parkName") "document title should identify Park Chaegyeong"
Assert-True ($html -match 'class="photo-stack"') "hero should include a layered photo stack"
Assert-True ($html -match "PARK CHAEGYEONG") "hero should include the romanized name"
Assert-True ($html -match $makeupResearcher) "hero should state the primary professional role"
Assert-True ($html -match $skunivDepartment) "page should include the current university role"
Assert-True ($html -match $virtualHuman) "page should include the virtual human makeup research area"
Assert-True ($html -match $unLace) "page should include selected exhibition work"
Assert-True ($html -match "corud10130@skuniv.ac.kr") "page should include the public contact email"
Assert-True ($html -match "aria-label") "interactive/navigation elements should have accessible labels"
Assert-True ($html -match "@media") "site should include responsive CSS"
Assert-True ($html -match "prefers-reduced-motion") "site should respect reduced motion"
Assert-True ($html -match "<main") "page should expose semantic main content"
Assert-True ($html -notmatch "(?:window\.)?(?:alert|confirm|prompt)\s*\(") "page should not use native dialogs"
Assert-True ($html -notmatch 'href="#"') "page should not include false href targets"

Assert-True ($design -match "Samuel Medvedowsky") "DESIGN.md should name the portfolio reference"
Assert-True ($design -match "photo stack") "DESIGN.md should record the signature photo stack"
Assert-True ($design -match $parkName) "DESIGN.md should record the actual profile subject"

Write-Output "Site verification passed."
