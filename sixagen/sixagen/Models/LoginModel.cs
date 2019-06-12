using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sixagen.Models
{
    public class LoginModel
    {
        public int ID { get; set; }
        public string Usuario { get; set; }
        public string Clave { get; set; }
        public string Tipo { get; set; }
    }
}