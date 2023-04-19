using Datos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Entidades
{
    public class DataAccess
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

        public static List<Computadora> GetComputadoras()
        {
            List<Computadora> listaComputadoras = new List<Computadora>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT * FROM Computadora", connection);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    Computadora computadora = new Computadora
                    {
                        Id = Convert.ToInt32(reader["Id"]),
                        Marca = reader["Marca"].ToString(),
                        Modelo = reader["Modelo"].ToString(),
                        Procesador = reader["Procesador"].ToString(),
                        MemoriaRam = Convert.ToInt32(reader["MemoriaRam"]),
                        Almacenamiento = Convert.ToInt32(reader["Almacenamiento"]),
                        SistemaOperativo = reader["SistemaOperativo"].ToString()
                    };

                    listaComputadoras.Add(computadora);
                }
            }

            return listaComputadoras;
        }

        public static void AgregarComputadora(Computadora computadora)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("INSERT INTO Computadora (Marca, Modelo, Procesador, MemoriaRam, Almacenamiento, SistemaOperativo) VALUES (@Marca, @Modelo, @Procesador, @MemoriaRam, @Almacenamiento, @SistemaOperativo)", connection);
                command.Parameters.AddWithValue("@Marca", computadora.Marca);
                command.Parameters.AddWithValue("@Modelo", computadora.Modelo);
                command.Parameters.AddWithValue("@Procesador", computadora.Procesador);
                command.Parameters.AddWithValue("@MemoriaRam", computadora.MemoriaRam);
                command.Parameters.AddWithValue("@Almacenamiento", computadora.Almacenamiento);
                command.Parameters.AddWithValue("@SistemaOperativo", computadora.SistemaOperativo);

                command.ExecuteNonQuery();
            }
        }

        public static void EditarComputadora(Computadora computadora)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("UPDATE Computadora SET Marca = @Marca, Modelo = @Modelo, Procesador = @Procesador, MemoriaRam = @MemoriaRam, Almacenamiento = @Almacenamiento, SistemaOperativo = @SistemaOperativo WHERE Id = @Id", connection);
                command.Parameters.AddWithValue("@Marca", computadora.Marca);
                command.Parameters.AddWithValue("@Modelo", computadora.Modelo);
                command.Parameters.AddWithValue("@Procesador", computadora.Procesador);
                command.Parameters.AddWithValue("@MemoriaRam", computadora.MemoriaRam);
                command.Parameters.AddWithValue("@Almacenamiento", computadora.Almacenamiento);
                command.Parameters.AddWithValue("@SistemaOperativo", computadora.SistemaOperativo);
                command.Parameters.AddWithValue("@Id", computadora.Id);

                command.ExecuteNonQuery();
            }
        }


        public static void EliminarComputadora(int id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("DELETE FROM Computadora WHERE Id = @Id", connection);
                command.Parameters.AddWithValue("@Id", id);

                command.ExecuteNonQuery();
            }
        }
    }
}
