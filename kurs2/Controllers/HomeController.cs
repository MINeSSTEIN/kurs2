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

        [Route("Index")]
        public IActionResult Search(string q)
        {
            if(q != "")
            {
                Response.Redirect($"search?q={q}");
            }
            return View(q);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [Route("Post")]
        public ActionResult Post(int id, int? usrId)
        {
            ViewBag.ID = id;

            ViewBag.Controller = "Post";
            ViewBag.Action = "Index";

            dynamic postsmodel = new ExpandoObject();
            postsmodel.Users = db.Users.ToList();
            postsmodel.Comments = db.Comments.ToList();
            postsmodel.Posts = db.Posts.ToList();
            postsmodel.Categories = db.Posts_Categories.ToList();
            postsmodel.PostsCategories = db.Posts_And_Categories.ToList();
            return View(postsmodel);
        }

        [Route("User")]
        public ActionResult User(int id)
        {
            ViewBag.ID = id;

            dynamic userModel = new ExpandoObject();
            userModel.Users = db.Users.ToList();
            userModel.Posts = db.Posts.ToList();

            return View(userModel);
        }

        [Route("Login")]
        public ActionResult Login(Users user)
        {
            var usr = db.Users.FirstOrDefault(x => x.Name == user.Name && x.Password == user.Password);
            if (usr != null)
            {
                Response.Cookies.Append("auth", usr.id.ToString(), new Microsoft.AspNetCore.Http.CookieOptions { Expires = DateTimeOffset.Now.AddMonths(1) });
                Response.Cookies.Append("pass", usr.Password.ToString(), new Microsoft.AspNetCore.Http.CookieOptions { Expires = DateTimeOffset.Now.AddMonths(1) });
                Response.Cookies.Append("name", usr.Name.ToString(), new Microsoft.AspNetCore.Http.CookieOptions { Expires = DateTimeOffset.Now.AddMonths(1) });
                Response.Cookies.Append("r", usr.CatID.ToString(), new Microsoft.AspNetCore.Http.CookieOptions { Expires = DateTimeOffset.Now.AddMonths(1) });

                Response.Redirect("/");
            }
            else
            {
                Response.Cookies.Append("Test", "Texxt");
            }
            return View();
        }

        [Route("Exit")]
        public ActionResult Exit()
        {
            Response.Cookies.Delete("auth");
            Response.Cookies.Delete("pass");
            Response.Cookies.Delete("r");
            Response.Cookies.Delete("name");
            Response.Redirect("/");
            return View();
        }

        [Route("AddPost")]
        public ActionResult AddPost(Posts post, string strId)
        {
            strId = Request.Cookies["auth"];
            int id = Convert.ToInt32(strId);
            ViewBag.ID = id;
            if (post.Title != "" && post.Info != null)
            {
                db.Posts.Add(post);
                db.SaveChanges();
            }

            if (db.Posts.FirstOrDefault(x => x.Title == post.Title) != null)
            {
                Response.Redirect($"post?id={post.id}");

            }
            return View();
        }

        [Route("Registration")]
        public ActionResult Registration(Users usr)
        {
            if (usr.Name != "" && usr.Bio != null && usr.Password != null)
            {
                db.Users.Add(usr);
                db.SaveChanges();
                Response.Redirect("/");
            }
            return View();
        }

        [Route("AddCommentary")]
        public ActionResult AddCommentary(Comments cm, int id)
        {
            ViewBag.id = id;
            if (cm.Text != null)
            {
                db.Comments.Add(cm);
                db.SaveChanges();
                Response.Redirect($"post?id={cm.PostID}");
            }
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [Route("ChangePost")]
        public ActionResult ChangePost(int id, Posts post)
        {
            ViewBag.id = id;
            ViewBag.post = db.Posts.Find(id);

            if (post.Title != null && post.Info != null)
            {
                db.Posts.Load();
                db.Posts.Find(id).Title = post.Title;
                db.Posts.Find(id).Info = post.Info;

                db.SaveChanges();

                Response.Redirect($"/post?id={id}");
            }
            return View();


        }

        [Route("ChangeComm")]
        public ActionResult ChangeComm(int id, Comments comm)
        {
            ViewBag.id = id;
            ViewBag.comm = db.Comments.Find(id);

            if (comm.Text != null)
            {
                db.Posts.Load();
                db.Comments.Find(id).Text = comm.Text;

                db.SaveChanges();

                Response.Redirect($"/post?id={db.Comments.Find(id).PostID}");
            }
            return View();
        }

        [Route("DeletePost")]
        public ActionResult DeletePost(int id)
        {
            ViewBag.id = id;

            var post = db.Posts.Find(id);
            db.Posts.Remove(post);
            db.SaveChanges();

            Response.Redirect("/");

            return View();
        }

        [Route("DeleteComm")]
        public ActionResult DeleteComm(int id)
        {
            ViewBag.id = id;

            var comm = db.Comments.Find(id);
            db.Comments.Remove(comm);
            db.SaveChanges();

            Response.Redirect($"Post?id={comm.PostID}");

            return View();
        }

/*        [Route("Search")]
        public ActionResult Search(int[] tags, string name)
        {
            dynamic searchModel = new ExpandoObject();
            searchModel.Categories = db.Posts_Categories.ToList();
            searchModel.Posts = db.Posts.ToList();
            searchModel.PostsCategories = db.Posts_And_Categories.ToList();

            return View();
        }*/
    }
}
