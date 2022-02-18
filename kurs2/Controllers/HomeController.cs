using kurs2.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Dynamic;
using System.Linq;
using System.Threading.Tasks;

namespace kurs2.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public static ApplicationContext db;


        public HomeController(ApplicationContext context, ILogger<HomeController> logger)
        {
            _logger = logger;
            db = context;

        }

        public IActionResult Index()
        {
            dynamic mymodel = new ExpandoObject();
            mymodel.Users = db.Users.ToList();
            mymodel.Posts = db.Posts.ToList();
            return View(mymodel);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public async Task<IActionResult> Create(Users users)
        {
            db.Users.Add(users);
            await db.SaveChangesAsync();
            return RedirectToAction("index");
        }

        [Route("Post")]
        public ActionResult Post(int id)
        {
            ViewBag.ID = id;

            ViewBag.Controller = "Post";
            ViewBag.Action = "Index";

            dynamic postsmodel = new ExpandoObject();
            postsmodel.Users = db.Users.ToList();
            postsmodel.Comments = db.Comments.ToList();
            postsmodel.Posts = db.Posts.ToList();
            return View(postsmodel);
        }

        [Route("User")]
        public ActionResult User(int id)
        {
            ViewBag.ID = id;
            return View(db.Users);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
