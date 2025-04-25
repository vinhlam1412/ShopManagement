# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY . ./
RUN dotnet restore "src/ShopManagement.Blazor/ShopManagement.Blazor.csproj"
RUN dotnet publish "src/ShopManagement.Blazor/ShopManagement.Blazor.csproj" -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copy publish output
COPY --from=build /app/publish .

# ✅ Copy file openiddict.pfx vào đúng thư mục
COPY src/ShopManagement.Blazor/openiddict.pfx ./openiddict.pfx
RUN dotnet dev-certs https -v -ep openiddict.pfx -p f2ec55f1-074e-4f31-8934-5ad909cdd3d3


ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80

ENTRYPOINT ["dotnet", "ShopManagement.Blazor.dll"]
