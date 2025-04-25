# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY . ./
RUN dotnet restore "src/ShopManagement.Blazor/ShopManagement.Blazor.csproj"
RUN dotnet publish "src/ShopManagement.Blazor/ShopManagement.Blazor.csproj" -c Release -o /app/publish
RUN dotnet dev-certs https -v -ep openiddict.pfx -p f2ec55f1-074e-4f31-8934-5ad909cdd3d3

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copy publish output
COPY --from=build /app/publish .

# Copy file certificate
COPY src/ShopManagement.Blazor/openiddict.pfx /app/openiddict.pfx


ENTRYPOINT ["dotnet", "ShopManagement.Blazor.dll"]
