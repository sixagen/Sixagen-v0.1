﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace sixagen.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SixagenEntities : DbContext
    {
        public SixagenEntities()
            : base("name=SixagenEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Agendas> Agendas { get; set; }
        public virtual DbSet<Clientes> Clientes { get; set; }
        public virtual DbSet<Empleados> Empleados { get; set; }
        public virtual DbSet<Equipos_Reparacion> Equipos_Reparacion { get; set; }
        public virtual DbSet<Login> Login { get; set; }
        public virtual DbSet<Productos> Productos { get; set; }
        public virtual DbSet<Ventas> Ventas { get; set; }

        public System.Data.Entity.DbSet<sixagen.Models.Cuenta> Cuentas { get; set; }
    }
}