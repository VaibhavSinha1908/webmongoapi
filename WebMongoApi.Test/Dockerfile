FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["WebMongoApi.Test/WebMongoApi.Test.csproj", "WebMongoApi.Test/"]
COPY ["WebMongoApi/WebMongoApi.csproj", "WebMongoApi/"]
RUN dotnet restore "WebMongoApi.Test/WebMongoApi.Test.csproj"
COPY . .
WORKDIR "/src/WebMongoApi.Test"
RUN dotnet build "WebMongoApi.Test.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebMongoApi.Test.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebMongoApi.Test.dll"]
