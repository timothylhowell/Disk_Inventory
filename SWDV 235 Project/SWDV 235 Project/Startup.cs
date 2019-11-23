using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SWDV_235_Project.Startup))]
namespace SWDV_235_Project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
