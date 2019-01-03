# Restart Supervisor
echo "[DJANGOGO] RESTARTING SUPERVISOR..."
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl status $project_name
sudo supervisorctl restart $project_name
