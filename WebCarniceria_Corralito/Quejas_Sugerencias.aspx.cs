using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCarniceria_Corralito
{
    public partial class Quejas_Sugerencias : System.Web.UI.Page
    {
        ConexSQL AccSQL = new ConexSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridPedidos.DataSource = (AccSQL.Ejecuta1Tabla($"SELECT PE.ID_PEDIDO, CLI.NOMBRE_REFERENCIA, PE.TOTAL FROM PEDIDOS AS PE INNER JOIN CLIENTE AS CLI ON PE.ID_CLIENTE = CLI.ID_CLIENTE")).Tables[0];
            GridPedidos.DataBind();
        }

        protected void GridPedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int numRenglon = Convert.ToInt16(e.CommandArgument.ToString());
            int idpedido = Convert.ToInt16(GridPedidos.Rows[numRenglon].Cells[1].Text);
            Session["ID_Pedido"] = idpedido;
        }
        protected void btnMirarDetalles_Click(object sender, EventArgs e)
        {
            int idpedido = (int)Session["ID_Pedido"];
            GridDetallesP.DataSource = (AccSQL.Ejecuta1Tabla($"SELECT PRO.PRODUCTO, DE.CANTIDAD, DE.PRECIO_TOTAL FROM PRODUCTOS AS PRO INNER JOIN DETALLES_PEDIDOS AS DE ON DE.ID_PRODUCTO = PRO.ID_PRODUCTO WHERE ID_PEDIDO = {idpedido}")).Tables[0];
            GridDetallesP.DataBind();
        }

        protected void btnComentar_Click(object sender, EventArgs e)
        {
            int idpedido = (int)Session["ID_Pedido"];
            string comentario = txtAclaraciones.Text;
            string quejaInsert = AccSQL.EjecutaSinRes($"INSERT INTO ACLARACIONES VALUES({idpedido}, '{comentario}')").ToString();
            GridAclaraciones.DataSource = (AccSQL.Ejecuta1Tabla($"select ac.id_pedido, cli.nombre_referencia, ac.DESCRIPCION from ACLARACIONES as ac inner join PEDIDOS as pe on pe.ID_PEDIDO = ac.ID_PEDIDO " +
                $"inner join CLIENTE as cli on pe.ID_CLIENTE = cli.ID_CLIENTE")).Tables[0];
            GridAclaraciones.DataBind();
            Response.Redirect("Quejas_Sugerencias.aspx");
        }

        
    }
}