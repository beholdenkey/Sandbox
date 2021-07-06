NOW=$(date +"%m-%d-%Y-%T")
echo $NOW
nohup nautobot-server runserver 0.0.0.0:8080 --insecure > server.out 2>&1 &
nohup nautobot-server rqworker > worker.out 2>&1 &
NOW=$(date +"%m-%d-%Y-%T")
echo $NOW
