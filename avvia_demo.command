#!/bin/bash
cd "$(dirname "$0")"
# Kill any existing server on port 8080
lsof -ti:8080 | xargs kill -9 2>/dev/null
# Start server
python3 -m http.server 8080 &
sleep 1
open "http://localhost:8080/demo_app.html"
echo "Server avviato su http://localhost:8080/demo_app.html"
echo "Premi CTRL+C per fermare il server"
wait
