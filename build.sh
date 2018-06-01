#!/bin/bash
DIR=`dirname $0`
source $DIR/dotnet-include.sh

dotnet restore $DIR/../FabricClusterCsharpApp/src/FabricClusterCsharpApp/Myactorserv.Interfaces/Myactorserv.Interfaces.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../FabricClusterCsharpApp/src/FabricClusterCsharpApp/Myactorserv.Interfaces/Myactorserv.Interfaces.csproj -v normal

CURDIR=`pwd`
dotnet restore $DIR/../FabricClusterCsharpApp/src/FabricClusterCsharpApp/MyactorservService/MyactorservService.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../FabricClusterCsharpApp/src/FabricClusterCsharpApp/MyactorservService/MyactorservService.csproj -v normal
cd `dirname $DIR/../FabricClusterCsharpApp/src/FabricClusterCsharpApp/MyactorservService/MyactorservService.csproj`
dotnet publish -o $CURDIR/../FabricClusterCsharpApp/FabricClusterCsharpApp/MyactorservPkg/Code
cd -


dotnet restore $DIR/../FabricClusterCsharpApp/src/FabricClusterCsharpApp/MyactorservTestClient/MyactorservTestClient.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../FabricClusterCsharpApp/src/FabricClusterCsharpApp/MyactorservTestClient/MyactorservTestClient.csproj -v normal
cd `dirname $DIR/../FabricClusterCsharpApp/src/FabricClusterCsharpApp/MyactorservTestClient/MyactorservTestClient.csproj`
dotnet publish -o $CURDIR/../FabricClusterCsharpApp/MyactorservServiceTestClient
cd -
