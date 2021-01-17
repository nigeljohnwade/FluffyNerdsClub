#!/usr/bin/env bash
NOW=$(date +"%m-%d-%Y-%H-%M-%S")
#AUTH="authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjFlNTJlYTBkLTI0NzctNGEzNi1hMmJiLWIwZDI0ZmE2ZWQxYiIsImlhdCI6MTU0MzQxNDU2Niwic3ViIjoiZGV2ZWxvcGVyLzUwZWFjMmYwLTBhNDItNTJiMS0zMDM1LTZiZWI3ODM5N2M3MSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIzNC4yNDUuMzMuMTM0Il0sInR5cGUiOiJjbGllbnQifV19.7JtUzoWKL0fWhfWT50NlwNx3xUnT1OyzMvG98tFeVdQVLFmD7StaWKoY368rs2mY7Kfj3hjTqH6oERGVvbNXXA"
AUTH="authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjhlZjVmZWFhLTZjMTMtNGYwMC1hYTcyLTY4OWIwYTRmMWZlMCIsImlhdCI6MTU5NzM0NDQ1NSwic3ViIjoiZGV2ZWxvcGVyLzUwZWFjMmYwLTBhNDItNTJiMS0zMDM1LTZiZWI3ODM5N2M3MSIsInNjb3BlcyI6WyJyb3lhbGUiXSwibGltaXRzIjpbeyJ0aWVyIjoiZGV2ZWxvcGVyL3NpbHZlciIsInR5cGUiOiJ0aHJvdHRsaW5nIn0seyJjaWRycyI6WyIzNC4yNTEuMTk4LjE3MyJdLCJ0eXBlIjoiY2xpZW50In1dfQ.n-i5mJVFUIa2XYxacdD7VDlsAlf3AoHiM7JzVU_rHZ797sqgzCiuq72JK70tR9pE91piF-NBkQ60SEtEiQhueA"
NIGEL="2UJ99VGP8"
JENNY="9JVGL8QV"
JENNY_2="PLVRCUCYJ"
FLUFFY_NERDS="LCJJPC"
FILENAME_PROFILE_NIGEL="clash_profile_data_NIGEL_$NOW.json"
FILENAME_PROFILE_CURRENT_NIGEL="clash_profile_data_NIGEL_CURRENT.json"
FILENAME_PROFILE_JENNY="clash_profile_data_JENNY_$NOW.json"
FILENAME_PROFILE_JENNY_2="clash_profile_data_JENNY_2_$NOW.json"
FILENAME_PROFILE_CURRENT_JENNY="clash_profile_data_JENNY_CURRENT.json"
FILENAME_PROFILE_CURRENT_JENNY_2="clash_profile_data_JENNY_2_CURRENT.json"
FILENAME_BATTLE_NIGEL="clash_battle_data_NIGEL_$NOW.json"
FILENAME_BATTLE_CURRENT_NIGEL="clash_battle_data_NIGEL_CURRENT.json"
FILENAME_BATTLE_JENNY="clash_battle_data_JENNY_$NOW.json"
FILENAME_BATTLE_JENNY_2="clash_battle_data_JENNY_2_$NOW.json"
FILENAME_BATTLE_CURRENT_JENNY="clash_battle_data_JENNY_CURRENT.json"
FILENAME_BATTLE_CURRENT_JENNY_2="clash_battle_data_JENNY_2_CURRENT.json"
FILENAME_CLAN="clash_clan_data_FLUFFY_NERDS_$NOW.json"
FILENAME_CURRENT_CLAN="clash_clan_data_FLUFFY_NERDS_CURRENT.json"
cd ~/git/hashtagdayjob/clash_data/
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$NIGEL/battlelog" > $FILENAME_BATTLE_NIGEL
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$JENNY/battlelog" > $FILENAME_BATTLE_JENNY
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$JENNY_2/battlelog" > $FILENAME_BATTLE_JENNY_2
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$NIGEL" > $FILENAME_PROFILE_NIGEL
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$JENNY" > $FILENAME_PROFILE_JENNY
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$JENNY_2" > $FILENAME_PROFILE_JENNY_2
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/clans/%23$FLUFFY_NERDS" > $FILENAME_CLAN
cd ~/git/FluffyNerdsClub/clash_data
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$JENNY" > $FILENAME_PROFILE_CURRENT_JENNY
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$JENNY_2" > $FILENAME_PROFILE_CURRENT_JENNY_2
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$NIGEL" > $FILENAME_PROFILE_CURRENT_NIGEL
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/clans/%23$FLUFFY_NERDS" > $FILENAME_CURRENT_CLAN
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$JENNY_2/battlelog" > $FILENAME_BATTLE_CURRENT_JENNY_2
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$JENNY/battlelog" > $FILENAME_BATTLE_CURRENT_JENNY
curl -X GET --header 'Accept: application/json' --header "$AUTH" "https://api.clashroyale.com/v1/players/%23$NIGEL/battlelog" > $FILENAME_BATTLE_CURRENT_NIGEL


