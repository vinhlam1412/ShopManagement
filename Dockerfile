# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY . ./
RUN dotnet restore "src/ShopManagement.Blazor/ShopManagement.Blazor.csproj"
RUN dotnet publish "src/ShopManagement.Blazor/ShopManagement.Blazor.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
RUN dotnet dev-certs https -v -ep openiddict.pfx -p 6b3a6e72-8813-4ab1-b79a-a5ed4fb87584

ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80

ENTRYPOINT ["dotnet", "ShopManagement.Blazor.dll"]
