using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using kurs2.Models;

namespace kurs2
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            string connection = Configuration.GetConnectionString("DefaultConnection");
            // добавляем контекст MobileContext в качестве сервиса в приложение
            services.AddDbContext<ApplicationContext>(options =>
                options.UseSqlServer(connection));
            services.AddControllersWithViews();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");

                endpoints.MapControllerRoute(
                    name: "post",
                    pattern: "{controller=Home}/{action=Post}/{id?}");
                endpoints.MapControllerRoute(
                    name: "user",
                    pattern: "{controller=Home}/{action=User}/{id?}");
                endpoints.MapControllerRoute(
                    name: "login",
                    pattern: "{controller=Home}/{action=Login}");
                endpoints.MapControllerRoute(
                    name: "exit,",
                    pattern: "{controller=Home}/{action=Exit}");
                endpoints.MapControllerRoute(
                    name: "addpost",
                    pattern: "{controller=Home}/{action=AddPost}");
                endpoints.MapControllerRoute(
                    name: "registration",
                    pattern: "{controller=Home}/{action=Registration}");
                endpoints.MapControllerRoute(
                    name: "addcommentary",
                    pattern: "{controller=Home}/{action=AddCommentary}/{id?}");
                endpoints.MapControllerRoute(
                    name: "changePost",
                    pattern: "{controller=Home}/{action=ChangePost}/{id?}");
                endpoints.MapControllerRoute(
                    name: "ChangeComm",
                    pattern: "{controller=Home}/{action=ChangeComm}/{id?}");
                endpoints.MapControllerRoute(
                    name: "DeletePost",
                    pattern: "{controller=Home}/{action=DeletePost}/{id?}");
                endpoints.MapControllerRoute(
                    name: "DeleteComm",
                    pattern: "{controller=Home}/{action=DeleteComm}/{id?}");
                endpoints.MapControllerRoute(
                    name: "Category",
                    pattern: "{controller=Home}/{action=Category}/{id?}");
                endpoints.MapControllerRoute(
                    name: "Search",
                    pattern: "{controller=Home}/{action=Search}/{q?}");
            });
        }
    }
}
