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

Assert-True (Test-Path -LiteralPath $indexPath) "index.html should exist"
Assert-True (Test-Path -LiteralPath $designPath) "DESIGN.md should document the visual direction"

$html = Get-Content -LiteralPath $indexPath -Raw
$design = Get-Content -LiteralPath $designPath -Raw

Assert-True ($html -match "<title>[^<]*Profile") "document title should identify the profile page"
Assert-True ($html -match 'class="photo-stack"') "hero should include a layered photo stack"
Assert-True ($html -match "Designer|Developer|Maker|Creator") "hero should state a large professional role"
Assert-True ($html -match "aria-label") "interactive/navigation elements should have accessible labels"
Assert-True ($html -match "@media") "site should include responsive CSS"
Assert-True ($html -match "prefers-reduced-motion") "site should respect reduced motion"
Assert-True ($html -match "<main") "page should expose semantic main content"
Assert-True ($html -notmatch "(?:window\.)?(?:alert|confirm|prompt)\s*\(") "page should not use native dialogs"
Assert-True ($html -notmatch 'href="#"') "page should not include false href targets"

Assert-True ($design -match "Samuel Medvedowsky") "DESIGN.md should name the portfolio reference"
Assert-True ($design -match "photo stack") "DESIGN.md should record the signature photo stack"

Write-Output "Site verification passed."
