FROM https://github.com/ariful-islam-avanade/PlayGraound.git
WORKDIR /PlayGraound
COPY ["PlayGround.csproj", "PlayGround/"]

RUN dotnet build "PlayGround.csproj" -c Release -o /app

COPY . .
WORKDIR "/PlayGround"
RUN dotnet build "PlayGround.csproj" -c Release -o /app
RUN dotnet publish "PlayGround.csproj" -c Release -o /app

ENTRYPOINT ["dotnet", "PlayGround.dll"]