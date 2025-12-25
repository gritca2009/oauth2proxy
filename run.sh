#!/bin/bash

# 1. Container im Hintergrund starten
docker compose up -d

# 2. Bestehende Log-Prozesse beenden (falls das Script erneut gestartet wird)
pkill -f "docker compose logs"

# 3. Logs in den gewünschten Ordner umleiten
# 'nohup' sorgt dafür, dass der Prozess weiterläuft, wenn du das Terminal schließt.
# '2>&1' leitet auch Fehlermeldungen in die Datei um.
nohup docker compose logs -f oauth2-proxy >> /var/log/oauth2proxy/oauth2-proxy.log 2>&1 &
nohup docker compose logs -f resource-app >> /var/log/oauth2proxy/resource-app.log 2>&1 &

echo "🚀 Container gestartet!"
echo "📂 Logs (OAUTH)werden geschrieben nach /var/log/oauth2proxy/oauth2-proxy.log"
echo "📂 Logs (APP)werden geschrieben nach /var/log/oauth2proxy/resource-app.log /"
