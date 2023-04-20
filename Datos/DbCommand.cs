using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;

namespace Datos
{
    public abstract class DbCommand : OrdenCommand
    {
        protected SqlConnection _connection;

        public DbCommand(ProductoReceiver producto, double cantidad, SqlConnection connection) : base(producto, cantidad)
        {
            _connection = connection;
        }


        public abstract void EjecutarConsulta();
    }
}
