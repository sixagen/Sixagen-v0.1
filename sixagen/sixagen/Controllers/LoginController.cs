using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using sixagen.Models;

namespace sixagen.Controllers
{
    public class LoginController : Controller
    {
        
        public int id;    
        SixagenEntities Entidad = new SixagenEntities();
        // GET: Login
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult Registrar()
        {

            return View();
        }
        public void login(InicioDeSecion us) {
            Entidad.Login.Add(new Login
            {
                ID = id,
                Usuario = us.login.Usuario,
                Clave = us.login.Clave,
                IDOwner = null
            });
            Entidad.SaveChanges();
        }
        [HttpPost]
        public ActionResult Registrar(InicioDeSecion us)
        {
            if (ModelState.IsValid)
            {
                Entidad.Clientes.Add(new Clientes 
                {
                    Nombre = us.cliente.Nombre,
                    Direccion = us.cliente.Direccion,
                    Telefono = us.cliente.Telefono,
                    Email = us.cliente.Email
                });


                Entidad.SaveChanges();
           
                var consulta = from a in Entidad.Clientes
                               where a.Telefono == us.cliente.Telefono
                               where a.Email == us.cliente.Email
                               select a.ID;
                
                foreach (var a in consulta)
                {
                    id = a;
                }
                login(us);

            }
            ViewBag.Message = "Bienvenido " + us.cliente.Nombre + " ha sido registrado!";

            return View();
        }

    }
}

