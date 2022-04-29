#!/bin/bash

echo "Making $AMRDIR Directory...."
/bin/mkdir -p $AMRDIR

echo "Changing To $AMRDIR Directory...."
/bin/cd $AMRDIR

echo "Installing Dependencies...."
/bin/yum install unzip dotnet-host dotnet-sdk-3.1 -y 2>&1 > /dev/nulll

echo "Downloading Client...."
/bin/curl https://static.askmrrobot.com/wowsite/client/$DLFILE -o $AMRDIR/$AMRFILE 2>&1 > /dev/null

echo "Unzipping Client...."
/bin/unzip $AMRDIR/$AMRFILE -d $AMRDIR/ 2>&1 > /dev/nulll

echo "Writing out settings.json to $AMRDIR/AskMrRobotClient/...."
echo -e '{\n  \"ClientUserSettings\": {\n    "Username": "$AMRUSERNAME",\n    "Token": "$AMRTOKEN",\n    "PerformanceMode": "Batch",\n    "Threads": 1.0,\n    "EnableGlobalNetwork": false,\n    "GlobalNetworkThreads": -1.0,\n    "GlobalNetworkSchedule": ""\n  }\n}\n"' > $AMRDIR/AskMrRobotClient/settings.json

echo "Running AMR Client...."
/bin/dotnet $AMRDIR/AskMrRobotClient/simclient.dll
