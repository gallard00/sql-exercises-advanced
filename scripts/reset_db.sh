#!/usr/bin/env bash
set -euo pipefail
echo "Stopping containers..."
docker compose down -v
echo "Starting fresh containers..."
docker compose up -d
echo "Done. Database will be re-seeded from datasets/init.sql on first boot."