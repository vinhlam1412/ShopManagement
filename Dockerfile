# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY . ./
RUN dotnet restore "src/ShopManagement.Blazor/ShopManagement.Blazor.csproj"
RUN dotnet publish "src/ShopManagement.Blazor/ShopManagement.Blazor.csproj" -c Release -o /app/publish
RUN dotnet tool install -g Volo.Abp.Cli
RUN cd src/ShopManagement.Blazor && abp install-libs

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copy publish output
COPY --from=build /app/publish .

EXPOSE 80
	
ENTRYPOINT ["dotnet", "ShopManagement.Blazor.dll"]
