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
