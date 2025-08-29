# Create Astro project directory structure
Write-Host "Creating Astro project directory structure..." -ForegroundColor Green

# Create directories
$directories = @(
    "src\pages\blog",
    "src\components", 
    "src\content\blog",
    "src\content\projects",
    "src\layouts",
    "src\styles"
)

foreach ($dir in $directories) {
    New-Item -ItemType Directory -Path $dir -Force | Out-Null
}

# Create files
$files = @(
    "src\pages\index.astro",
    "src\pages\projects.astro", 
    "src\pages\timeline.astro",
    "src\pages\hobbies.astro",
    "src\pages\blog\index.astro",
    "src\pages\blog\[slug].astro",
    "src\components\Hero.astro",
    "src\components\Navigation.astro",
    "src\components\ProjectCard.astro", 
    "src\components\TimelineItem.astro",
    "src\components\SocialFeed.tsx",
    "src\components\Footer.astro",
    "src\layouts\Layout.astro",
    "src\styles\global.css"
)

foreach ($file in $files) {
    New-Item -ItemType File -Path $file -Force | Out-Null
}

Write-Host "✅ Directory structure created successfully!" -ForegroundColor Green

# Simple structure display without if-else in pipeline
Write-Host "`n📁 Created structure:" -ForegroundColor Cyan

# Get all items and separate directories and files
$allItems = Get-ChildItem -Path "src" -Recurse
$directories = $allItems | Where-Object { $_.PSIsContainer }
$files = $allItems | Where-Object { -not $_.PSIsContainer }

# Display directories first
$directories | ForEach-Object {
    $relativePath = $_.FullName.Replace($PWD.Path + "\", "")
    Write-Host "📁 $relativePath\" -ForegroundColor Yellow
}

# Display files
$files | ForEach-Object {
    $relativePath = $_.FullName.Replace($PWD.Path + "\", "")
    Write-Host "📄 $relativePath" -ForegroundColor White
}
