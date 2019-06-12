using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using sixagen.Models;

namespace sixagen.Controllers
{
    public class CuentaController : Controller
    {
        // GET: Cuenta
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Cuenta c)
        {
            return View();
        }



        public ActionResult Registrar()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Registar(Cuenta c)
        {
            return View();
        }
    }
}