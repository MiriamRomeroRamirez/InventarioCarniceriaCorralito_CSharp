using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCarniceria_Corralito
{
    public partial class Alta_Clientes : System.Web.UI.Page
    {
        ConexSQL AccSQL = new ConexSQL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            int max_id = (int)AccSQL.EjecutaCon1Res("SELECT COUNT(ID_CLIENTE)+1 FROM CLIENTE");
            lblRegistro.Text = AccSQL.EjecutaSinRes("INSERT INTO CLIENTE VALUES(" + max_id + ",'" + txtNomCliente.Text + "','" + txtCelular.Text + "',"
                + "'" + txtColonia.Text + "','" + txtCalle.Text + "', '" + txtExterior.Text + "', '" + txtReferencia.Text +"')");
            Response.Redirect("Alta_Clientes.aspx");
        }
    }
}