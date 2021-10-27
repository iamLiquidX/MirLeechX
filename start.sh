tracker_list=`curl -Ns https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/all.txt | awk '$1' | tr '\n' ',' | cat`
echo -e "\nmax-concurrent-downloads=7\nbt-tracker=$tracker_list" >> /usr/src/app/aria.conf
aria2c --conf-path=/usr/src/app/aria.conf
python3 -m bot