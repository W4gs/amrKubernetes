#!/bin/bash

echo "Installing Dependencies...."
/bin/apt install unzip -y

echo "Downloading Client...."
/bin/curl https://static.askmrrobot.com/wowsite/client/$AMRFILE -o $AMRDIR/$AMRFILE

echo "Unzipping Client...."
/bin/unzip $AMRDIR/$AMRFILE -d $AMRDIR/

echo "Writing out settings.json to $AMRDIR/AskMrRobotClient/...."
echo -e "{\n  \"ClientUserSettings\": {\n    \"Username\": \"$AMRUSERNAME\",\n    \"Token\": \"$AMRTOKEN\",\n    \"PerformanceMode\": \"Batch\",\n    \"Threads\": 1.0,\n    \"EnableGlobalNetwork\": false,\n    \"GlobalNetworkThreads\": -1.0,\n    \"GlobalNetworkSchedule\": \"\"\n  }\n}\n" > $AMRDIR/AskMrRobotClient/settings.json

echo "Running AMR Client...."
/bin/dotnet $AMRDIR/AskMrRobotClient/simclient.dll
