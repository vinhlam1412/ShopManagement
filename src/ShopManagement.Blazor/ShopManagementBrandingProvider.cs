using Volo.Abp.DependencyInjection;
using Volo.Abp.Ui.Branding;

namespace ShopManagement.Blazor;

[Dependency(ReplaceServices = true)]
public class ShopManagementBrandingProvider : DefaultBrandingProvider
{
    public override string AppName => "ShopManagement";
}
