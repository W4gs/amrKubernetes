#!/bin/bash

echo "Making $ASKDIR Directory...."
/bin/mkdir -p $ASKDIR

echo "Changing To $ASKDIR Directory...."
/bin/cd $ASKDIR

echo "Installing Dependencies...."
/bin/yum install unzip dotnet-host dotnet-sdk-3.1 -y 2>&1 > /dev/nulll

echo "Downloading Client...."
/bin/curl https://static.askmrrobot.com/wowsite/client/$DLFILE -o $ASKDIR/$DLFILE 2>&1 > /dev/null

echo "Unzipping Client...."
/bin/unzip $ASKDIR/$DLFILE -d $ASKDIR/ 2>&1 > /dev/nulll

echo "Writing out settings.json to $ASKDIR/AskMrRobotClient/...."
echo -e '{\n  \"ClientUserSettings\": {\n    "Username": "autris",\n    "Token": "ae8e4af3830c4175bd0c5e12e22a5848a16e783ac9ae443aba57f30130f1e37d",\n    "PerformanceMode": "Batch",\n    "Threads": 1.0,\n    "EnableGlobalNetwork": false,\n    "GlobalNetworkThreads": -1.0,\n    "GlobalNetworkSchedule": ""\n  }\n}\n" > $ASKDIR/AskMrRobotClient/settings.json


echo "Running AMR Client...."
/bin/dotnet $ASKDIR/AskMrRobotClient/simclient.dll
