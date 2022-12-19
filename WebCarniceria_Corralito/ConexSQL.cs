using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.DynamicData;
using System.Data;
using System.Drawing;

namespace WebCarniceria_Corralito
{
    public class ConexSQL
    {
        SqlConnection Conexion;
        SqlCommand Comando;
        public ConexSQL()
        {
            string CC = System.Configuration.ConfigurationManager.ConnectionStrings["CadCon"].ConnectionString;
            Conexion = new SqlConnection(CC);
            Comando = new SqlCommand();
            Comando.Connection = Conexion;
        }
        public bool AbrirCon()
        {
            try
            { Conexion.Open(); }
            catch{ }
            return (Conexion.State == System.Data.ConnectionState.Open) ;
        }
        public void CerrarCon()
        {
            Conexion.Close();
        }
        public string EjecutaSinRes(string InstSql)
        {
            try
            {
                AbrirCon();
                Comando.CommandType = System.Data.CommandType.Text;
                Comando.CommandText = InstSql;
                Comando.ExecuteNonQuery();
                CerrarCon();
                return "OK";
            }
            catch(Exception ex)
            {
                return ex.ToString();
            }
        }
        public string[] Ejecuta1ListaRes(String InstrSql)
        {
            string[] resultado = new string[1000];
            int indRes = 0;
            SqlDataReader Lector;
            try
            {
                AbrirCon();
                Comando.CommandType = System.Data.CommandType.Text;
                Comando.CommandText = InstrSql;
                Lector = Comando.ExecuteReader();
                if (Lector.HasRows)
                    while (Lector.Read())
                        resultado[indRes++] = Lector[0].ToString();
                CerrarCon();
                Array.Resize(ref resultado, indRes);
                return resultado;
            }
            catch (Exception ex)
            {
                resultado[0] = ex.ToString();
                Array.Resize(ref resultado, 1);
                return resultado;
            }
        }
        public object EjecutaCon1Res(string InstrSql)
        {
            try
            {
                AbrirCon();
                Comando.CommandType = System.Data.CommandType.Text;
                Comando.CommandText = InstrSql;
                object R = Comando.ExecuteScalar();
                CerrarCon();
                return R;
            }
            catch (Exception ex)
            {
                return ex;
            }
        }
        public DataSet Ejecuta1Tabla(string InstrSql)
        {
            DataSet Res = new DataSet();
            AbrirCon();
            SqlDataAdapter DA = new SqlDataAdapter(InstrSql, Conexion);
            DA.Fill(Res);
            CerrarCon();
            return Res;
        }
    } 
}