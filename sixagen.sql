create database Sixagen
go

use Sixagen
go

Create table Empleados(
ID int primary key identity,
Nombre varchar(50) not null,
Apellido varchar(50) not null,
Puesto varchar(100) not null,
Fecha_Contratacion date,
Telefono varchar(50) not null,
Email varchar(50) not null
)

go

Create table Clientes(
ID int primary key identity,
Nombre varchar(50) not null,
Apellido varchar(50) not null,
Direccion varchar(300) not null,
Telefono varchar(50) not null,
Email varchar(50) not null
)

go

Create table Agendas(
ID int primary key identity,
Motivo varchar(50) not null,
Descripcion varchar(300) not null,
Cliente int references Clientes(ID),
Empleado int references Empleados(ID),
Fecha date not null, 
Hora varchar(10) not null,
Herramientas_Necesarias varchar(100)
)

go

Create table Equipos_Reparacion(
ID int primary key identity,
Nombre_Equipo varchar(50) not null,
Descripcion varchar(50) not null,
Dueno int references Clientes(ID),
Empleado int references Empleados(ID),
Problema varchar(100) not null,
Estado binary not null,
Fecha_Entrada date
)

go

Create table Productos(
ID int primary key identity,
Producto varchar(50) not null,
Modelo varchar(100) not null,
Descripcion varchar(300) not null,
Cantidad int not null,
Precio decimal(18,2)
--Fecha_Vencimiento date
)

go

Create table Ventas(
ID int primary key identity,
Producto int References Productos(ID) not null,
Descripcion varchar(300),
Cantidad int not null,
Precio_total decimal(18,2) not null,
Cliente int references Clientes(ID),
Empleado int references Empleados(ID)
)

go

Create table Login(
ID int primary key identity, 
Usuario varchar(50) not null,
Clave varchar(50) not null
)

go

alter table Empleados drop column Apellido
go
alter table Clientes drop column Apellido
go
alter table Login add unique (Usuario)

go

Insert into Empleados values('Marcos Restituyo', 'Jefe','2019-03-26', '809-616-9743', 'markitofrikistin@hotmail.com')
select * from Empleados


Insert into Clientes values('Ismel Rosario', 'Los guandules C/San francisco #14', '809-616-9743', '20175534@itla.edu.do')
select * from Clientes


Insert into Agendas values('Television da�ada', 'Direccion: Respaldo San Francisco #24', 1, 1, '2019-04-05', '3:30:00', 'Destornillador, Tester, Soldador, Esta�o')
select * from Agendas

Select a.ID, Motivo, e.* from Agendas a join Empleados e on(a.Empleado = e.ID)


Insert into Equipos_Reparacion values('Inversor', 'Inversor Leyba', 1, 1, 'El inversor se apaga rapido, al parecer no carga', 0, '2019-03-27')
select * from Equipos_Reparacion


Insert into Productos values('Televisor', 'ASD521RT', 'Samsung, 33 pulgadas, Smart TV', 5, 32500.55)
select * from Productos


Insert into Ventas values(1, 'Samsung, 33 pulgadas, Smart TV', 1, 32500.55, 1, 1)
select * from Ventas

Insert into Login values('MarcosRestituyo', 'Markito2000', 'Admin', 1)
Select * from Login

go
/*
--Login


create proc IniciarSesion
@Usuario varchar(50),
@Clave varchar(50)
as
begin
select Usuario, Clave, Tipo from Login where Usuario = @Usuario and Clave = @Clave
end

--Login End

go

--Empleados

create proc MostrarEmpleados

as
begin
select * from Empleados
end

go

create proc BuscarEmpleado
@Campo varchar(50),
@Valor varchar(50)
as
begin

if (@Campo = 'ID_Empleado')
select * from Empleados where ID_Empleado = Convert(int, @Valor)
else if (@Campo = 'Nombre')
select * from Empleados where Nombre like @Valor + '%'
else
select * from Empleados where Puesto like @Valor + '%'

end

go

create proc GuardarEmpleado
@Nombre varchar(50),
@Puesto varchar(100),
@Fecha date,
@Telefono varchar(50),
@Email varchar(50)
as
begin
insert into Empleados values(@Nombre, @Puesto, @Fecha, @Telefono, @Email)
end

go

create proc ModificarEmpleado
@ID int,
@Nombre varchar(50),
@Puesto varchar(100),
@Fecha date,
@Telefono varchar(50),
@Email varchar(50)
as
begin
update Empleados set Nombre = @Nombre, Puesto = @Puesto, Fecha_Contratacion = @Fecha, Telefono = @Telefono, Email = @Email
Where ID_Empleado = @ID
end

go

create proc EliminarEmpleado
@ID int
as
begin
delete from Empleados where ID_Empleado = @ID
end

go

--Empleados End





--Clientes

create proc MostrarClientes

as
begin
select * from Clientes
end

go

create proc BuscarCliente
@Campo varchar(50),
@Valor varchar(50)
as
begin

if (@Campo = 'ID_Cliente')
select * from Clientes where ID_Cliente = Convert(int, @Valor)
else
select * from Clientes where Nombre like @Valor + '%'


end

go

create proc GuardarCliente
@Nombre varchar(50),
@Direccion varchar(300),
@Telefono varchar(50),
@Email varchar(50)
as
begin
insert into Clientes values(@Nombre, @Direccion, @Telefono, @Email)
end

go

create proc ModificarCliente
@ID int,
@Nombre varchar(50),
@Direccion varchar(300),
@Telefono varchar(50),
@Email varchar(50)
as
begin
update Clientes set Nombre = @Nombre, Direccion = @Direccion, Telefono = @Telefono, Email = @Email
Where ID_Cliente = @ID
end

go

create proc EliminarCliente
@ID int
as
begin
delete from Clientes where ID_Cliente = @ID
end

go
--Clientes End




--Productos

create view MostrarProductos
as
select * from Productos

go

create proc BuscarProducto
@Campo varchar(50),
@Valor varchar(50)
as
begin

if(@Campo = 'Producto')
select * from Productos where Producto like @Valor + '%'
else
select * from Productos where Modelo like @Valor + '%'

end

go

create proc GuardarProducto
@Producto varchar(50),
@Modelo varchar(100),
@Descripcion varchar(300),
@Cantidad int,
@Precio decimal(18,2)
as
begin

insert into Productos values(@Producto, @Modelo, @Descripcion, @Cantidad, @Precio);

end

go

create proc ModificarProducto
@ID int,
@Producto varchar(50),
@Modelo varchar(100),
@Descripcion varchar(300),
@Cantidad int,
@Precio decimal(18,2)
as
begin

update Productos set Producto = @Producto, Modelo = @Modelo, Descripcion = @Descripcion,
Cantidad = @Cantidad, Precio = @Precio where ID_Producto = @ID

end

go

create proc EliminarProducto
@ID int
as
begin

delete from Productos where ID_Producto = @ID

end


--Productos End


go


--Equipos Reparacion

create view MostrarEquipos
as
select ID_Equipo, Nombre_Equipo, Descripcion, Dueno, Empleado, Problema, Fecha_Entrada,
 Case(Estado) when 1 then 'Reparado' else 'Da�ado'end as Estatus
from Equipos_Reparacion

go

create proc BuscarEquipo
@Valor varchar(50)
as
begin

select * from Equipos_Reparacion where Nombre_Equipo like @Valor + '%'

end

go

create proc GuardarEquipo
@Nombre varchar(50),
@Descripcion varchar(50),
@Dueno int,
@Empleado int,
@Problema varchar(100),
@Fecha date
as
begin

insert into Equipos_Reparacion values(@Nombre, @Descripcion, @Dueno, @Empleado, @Problema, 0, @Fecha)

end

go

create proc ModificarEquipo
@ID int,
@Nombre varchar(50),
@Descripcion varchar(50),
@Dueno int,
@Empleado int,
@Problema varchar(100),
@Fecha date
as
begin

update Equipos_Reparacion set Nombre_Equipo = @Nombre, Descripcion = @Descripcion, Dueno = @Dueno,
Empleado = @Empleado, Problema = @Problema, Fecha_Entrada = @Fecha 
where ID_Equipo = @ID

end

go

create proc Reparar
@ID int
as
begin

update Equipos_Reparacion set Estado = 1 where ID_Equipo = @ID

end

go

create view EquiposReparados
as
Select * from MostrarEquipos where Estatus = 'Reparado'

go

/*create proc EliminarEquipo
@ID int
as
begin

delete from Equipos_Reparacion where ID_Equipo = @ID

end

go*/

--Productos End




--Ventas


create view MostrarVentas
as
select ID_Venta, p.Producto, v.Descripcion, v.Cantidad, Precio_total, c.Nombre as Cliente, e.Nombre as Empleado
from Ventas v join Productos p on(v.Producto = ID_Producto) join Clientes c 
on(ID_Cliente = Cliente) join Empleados e on(ID_Empleado = Empleado)

go

create proc BuscarVenta
@Valor varchar(50)
as
begin

select ID_Venta, p.Producto, v.Descripcion, v.Cantidad, Precio_total, c.Nombre as Cliente, e.Nombre as Empleado
from Ventas v join Productos p on(v.Producto = ID_Producto) join Clientes c 
on(ID_Cliente = Cliente) join Empleados e on(ID_Empleado = Empleado) 
where p.Producto like @Valor + '%'

end

go

create proc GuardarVenta
@Producto int,
@Descripcion varchar(300),
@Cantidad int,
@Precio_total decimal(18,2),
@Cliente int,
@Empleado int
as
begin

insert into Ventas values(@Producto, @Descripcion, @Cantidad, @Precio_total, @Cliente, @Empleado)
update Productos set Cantidad = (Select Cantidad from Productos where ID_Producto = @Producto) - @Cantidad

end

go

/*create proc ModificarEquipo
@ID int,
@Nombre varchar(50),
@Descripcion varchar(50),
@Dueno int,
@Empleado int,
@Problema varchar(100),
@Fecha date
as
begin

update Equipos_Reparacion set Nombre_Equipo = @Nombre, Descripcion = @Descripcion, Dueno = @Dueno,
Empleado = @Empleado, Problema = @Problema, Fecha_Entrada = @Fecha 
where ID_Equipo = @ID

end

go*/



/*create proc EliminarEquipo
@ID int
as
begin

delete from Equipos_Reparacion where ID_Equipo = @ID

end

go*/


--Ventas End





--Agendas

create view MostrarCitas
as
select * from Agendas

go

create view MostrarCitasHoy
as
select ID_Cita, Motivo, Descripcion, c.Nombre as Cliente, e.Nombre as Empleado, a.Fecha, Hora, Herramientas_Necesarias
from Agendas a join Clientes c on(ID_Cliente = Cliente) join Empleados e on(Empleado = ID_Empleado) 
where Fecha = Convert(date, SYSDATETIME())

go

create view MostrarCitasTomorrow
as
select ID_Cita, Motivo, Descripcion, c.Nombre as Cliente, e.Nombre as Empleado, a.Fecha, Hora, Herramientas_Necesarias
from Agendas a join Clientes c on(ID_Cliente = Cliente) join Empleados e on(Empleado = ID_Empleado) 
where Fecha = Convert(date, DATEADD(DAY, 1, SYSDATETIME()))

go

create view MostrarCitasDiponibles
as
select ID_Cita, Motivo, Descripcion, c.Nombre as Cliente, e.Nombre as Empleado, a.Fecha, Hora, Herramientas_Necesarias
from Agendas a join Clientes c on(ID_Cliente = Cliente) join Empleados e on(Empleado = ID_Empleado) 
where Fecha >= Convert(date, SYSDATETIME())

go

create proc BuscarCita
@Campo varchar(60),
@Motivo varchar(50),
@Fecha date
as

if(@Campo = 'Motivo')
select * from Agendas where Motivo like @Motivo + '%'
else
select * from Agendas where Fecha = @Fecha;

go

create proc GuardarCita
@Motivo varchar(50),
@Descripcion varchar(300),
@Cliente int,
@Empleado int,
@Fecha date, 
@Hora varchar(10),
@Herramientas varchar(100)
as
begin

insert into Agendas values(@Motivo, @Descripcion, @Cliente, @Empleado, @Fecha, @Hora, @Herramientas)

end

go

create proc ModificarCita
@ID int,
@Motivo varchar(50),
@Descripcion varchar(300),
@Cliente int,
@Empleado int,
@Fecha date, 
@Hora varchar(10),
@Herramientas varchar(100)
as
begin

update Agendas set Motivo = @Motivo, Descripcion = @Descripcion, Cliente = @Cliente, Empleado = @Empleado,
Fecha = @Fecha, Hora = @Hora, Herramientas_Necesarias = @Herramientas where ID_Cita = @ID

end

go

create proc EliminarCita
@ID int
as
begin

Delete from Agendas where ID_Cita = @ID

end

go
--Agendas end


*/

