NOW=$(date +"%m-%d-%Y-%H-%M-%S")
AUTH="authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjFlNTJlYTBkLTI0NzctNGEzNi1hMmJiLWIwZDI0ZmE2ZWQxYiIsImlhdCI6MTU0MzQxNDU2Niwic3ViIjoiZGV2ZWxvcGVyLzUwZWFjMmYwLTBhNDItNTJiMS0zMDM1LTZiZWI3ODM5N2M3MSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIzNC4yNDUuMzMuMTM0Il0sInR5cGUiOiJjbGllbnQifV19.7JtUzoWKL0fWhfWT50NlwNx3xUnT1OyzMvG98tFeVdQVLFmD7StaWKoY368rs2mY7Kfj3hjTqH6oERGVvbNXXA"
NIGEL="2UJ99VGP8"
JENNY="9JVGL8QV"
FILENAME_PROFILE_NIGEL="clash_profile_data_NIGEL_$NOW.json"
FILENAME_PROFILE_JENNY="clash_profile_data_JENNY_$NOW.json"
FILENAME_BATTLE_NIGEL="clash_battle_data_NIGEL_$NOW.json"
FILENAME_BATTLE_JENNY="clash_battle_data_JENNY_$NOW.json"
cd git/hashtagdayjob/clash_data/
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$NIGEL/battlelog" > $FILENAME_BATTLE_NIGEL
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$JENNY/battlelog" > $FILENAME_BATTLE_JENNY
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$NIGEL" > $FILENAME_PROFILE_NIGEL
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$JENNY/" > $FILENAME_PROFILE_JENNY


