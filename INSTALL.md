Ip tracker tool 
pkg update -y
pkg upgrade -y
pkg install curl -y
pkg install jq -y
pkg install nano -y

git clone https://github.com/tu-usuario/fsociety-tracker.git
cd fsociety-tracker

chmod +x fsociety_tracker.sh
