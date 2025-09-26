Write-Output "Stopping containers..."
docker compose down -v
Write-Output "Starting fresh containers..."
docker compose up -d
Write-Output "Done. Database will be re-seeded from datasets/init.sql on first boot."