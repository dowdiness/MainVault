$basePath = Get-Location
$quartzContentPath = Join-Path $basePath "quartz\content"

# Get all markdown files in quartz/content
$quartzFiles = Get-ChildItem -Path $quartzContentPath -Filter "*.md" -Recurse -File

# Get all markdown files in root (excluding quartz and .obsidian)
$rootFiles = Get-ChildItem -Path $basePath -Filter "*.md" -Recurse -File |
    Where-Object {
        $_.FullName -notlike "*quartz*" -and
        $_.FullName -notlike "*.obsidian*" -and
        $_.FullName -ne (Join-Path $basePath "README.md") -and
        $_.FullName -ne (Join-Path $basePath "index.md")
    }

$duplicates = @()

foreach ($qf in $quartzFiles) {
    # Get relative path from quartz/content
    $relativePath = $qf.FullName.Replace($quartzContentPath + "\", "")

    # Find matching file in root
    foreach ($rf in $rootFiles) {
        $rootRelativePath = $rf.FullName.Replace($basePath + "\", "")
        if ($rootRelativePath -eq $relativePath) {
            $duplicates += $rf
            break
        }
    }
}

# Output duplicates
$duplicates | ForEach-Object { $_.FullName }
