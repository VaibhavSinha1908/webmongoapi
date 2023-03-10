#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["WebMongoApi/WebMongoApi.csproj", "WebMongoApi/"]
COPY ["WebMongoApi.Test/WebMongoApi.Test.csproj", "WebMongoApi.Test/"]
RUN dotnet restore "WebMongoApi/WebMongoApi.csproj"
RUN dotnet restore "WebMongoApi.Test/WebMongoApi.Test.csproj"
COPY . .

WORKDIR "/src/WebMongoApi"
RUN dotnet build "WebMongoApi.csproj" -c Release -o /app/build

# run the unit tests
FROM build AS test
WORKDIR /app/WebMongoApi.Test
ENTRYPOINT ["dotnet", "test", "--logger:trx"]


FROM build AS publish
RUN dotnet publish "WebMongoApi.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebMongoApi.dll"]

