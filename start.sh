nohup ./autofreemint-linux > run.log 2>&1 &
echo $! > save_pid.txt
sleep 5
cat run.log
