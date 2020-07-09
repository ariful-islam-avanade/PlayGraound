FROM mcr.microsoft.com/dotnet/core/sdk:2.2
WORKDIR /PlayGraound
COPY ["PlayGround.csproj", "PlayGround/"]

RUN dotnet build "PlayGround.csproj" -c Release -o /PlayGround

COPY . .
WORKDIR "/PlayGround"
RUN dotnet build "PlayGround.csproj" -c Release -o /PlayGround
RUN dotnet publish "PlayGround.csproj" -c Release -o /PlayGround

ENTRYPOINT ["dotnet", "PlayGround.dll"]