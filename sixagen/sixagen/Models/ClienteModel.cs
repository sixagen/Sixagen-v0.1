﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sixagen.Models
{
    public class ClienteModel
    {
        public int ID { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
    }
}