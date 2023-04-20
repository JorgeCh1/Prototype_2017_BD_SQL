using Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Prototype
{
    public partial class wfStockComputadora : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        private static List<ProductoReceiver> Computadoras { get; set; } = new List<ProductoReceiver>();


        protected void Hecho_Click(object sender, EventArgs e)
        {
            var cantidadAlta = Int32.Parse(txtAlta.Text);
            var cantidadBaja = Int32.Parse(txtBaja.Text);
            var cantidad = Int32.Parse(txtCantidadProducto.Text);

            // Conexión a la base de datos
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);
            connection.Open();

            //Instancia de la Empresa
            EmpresaInvoker empresa = new EmpresaInvoker(connection);
            var producto = new ProductoReceiver
            {
                Marca = txtMarca.Text,
                Modelo = txtModelo.Text,
                Procesador = txtProcesador.Text,
                MemoriaRam = Convert.ToInt32(txtMemoriaRam.Text),
                Almacenamiento = Convert.ToInt32(txtAlmacenamiento.Text),
                SistemaOperativo = txtSistemaOperativo.Text,
                AltaStock = Int32.Parse(txtAlta.Text),
                BajaStock = Int32.Parse(txtBaja.Text),
                Cantidad = int.Parse(txtCantidadProducto.Text)
            };
            var ordenInsert = new InsertStock(producto, cantidad, connection);
            empresa.TomarOrden(ordenInsert);
            empresa.ProcesarOrdenes();

            // Cierre de la conexión a la base de datos
            connection.Close();

            lblAltaStock.Text = $"Agregando { cantidadAlta } de Computadoras";
            lblAltaStock.Visible = true;
            lblBajaStok.Text = $"Quitando { cantidadBaja } de Computadoras";
            lblBajaStok.Visible = true;
        }

        protected void Actualizar_Click(object sender, EventArgs e)
        {
            var cantidadAlta = Int32.Parse(txtAlta.Text);
            var cantidadBaja = Int32.Parse(txtBaja.Text);

            // Conexión a la base de datos
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString);
            connection.Open();

            //Instancia de la Empresa
            EmpresaInvoker empresa = new EmpresaInvoker(connection);
            var producto = new ProductoReceiver
            {
                //Cantidad = int.Parse(txtCantidadProducto.Text),
                Id = Convert.ToInt32(txtId.Text),
                Marca = txtMarca.Text,
                Modelo = txtModelo.Text,
                Procesador = txtProcesador.Text,
                MemoriaRam = Convert.ToInt32(txtMemoriaRam.Text),
                Almacenamiento = Convert.ToInt32(txtAlmacenamiento.Text),
                SistemaOperativo = txtSistemaOperativo.Text,
                AltaStock = Int32.Parse(txtAlta.Text),
                BajaStock = Int32.Parse(txtBaja.Text)

            };

            var ordenAlta = new AltaStockDbCommand(producto, cantidadAlta, connection);
            empresa.TomarOrden(ordenAlta);
            var ordenBaja = new BajaStockDbCommand(producto, cantidadBaja, connection);
            empresa.TomarOrden(ordenBaja);
            empresa.ProcesarOrdenes();


            // Cierre de la conexión a la base de datos
            connection.Close();

            lblAltaStock.Text = $"Agregando { cantidadAlta } de Computadoras";
            lblAltaStock.Visible = true;
            lblBajaStok.Text = $"Quitando { cantidadBaja } de Computadoras";
            lblBajaStok.Visible = true;
        }  
    }
 }
