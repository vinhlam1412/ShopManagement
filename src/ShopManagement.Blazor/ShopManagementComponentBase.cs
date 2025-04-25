using ShopManagement.Localization;
using Volo.Abp.AspNetCore.Components;

namespace ShopManagement.Blazor;

public abstract class ShopManagementComponentBase : AbpComponentBase
{
    protected ShopManagementComponentBase()
    {
        LocalizationResource = typeof(ShopManagementResource);
    }
}
