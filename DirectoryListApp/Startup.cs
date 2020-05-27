using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DirectoryListApp.Startup))]
namespace DirectoryListApp
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
