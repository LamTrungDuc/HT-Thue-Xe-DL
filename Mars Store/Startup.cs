using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Mars_Store.Startup))]
namespace Mars_Store
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
