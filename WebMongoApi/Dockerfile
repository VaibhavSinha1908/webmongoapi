FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["WebMongoApi/WebMongoApi.csproj", "WebMongoApi/"]
RUN dotnet restore "WebMongoApi/WebMongoApi.csproj"
COPY . .
WORKDIR "/src/WebMongoApi"
RUN dotnet build "WebMongoApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "WebMongoApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "WebMongoApi.dll"]
