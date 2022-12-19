using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCarniceria_Corralito
{
    public partial class Pedidos : System.Web.UI.Page
    {
        ConexSQL AccSQL = new ConexSQL();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtNoPedido.Text = AccSQL.EjecutaCon1Res("SELECT COUNT(ID_PEDIDO)+1 FROM PEDIDOS").ToString();
            GridClientes.DataSource = (AccSQL.Ejecuta1Tabla("SELECT ID_CLIENTE, NOMBRE_REFERENCIA FROM CLIENTE")).Tables[0];
            GridClientes.DataBind();

            GridView1.DataSource = (AccSQL.Ejecuta1Tabla("SELECT PE.ID_PEDIDO, CLI.NOMBRE_REFERENCIA, CLI.NO_CELULAR, PE.TOTAL FROM PEDIDOS AS PE INNER JOIN CLIENTE AS CLI ON PE.ID_CLIENTE = CLI.ID_CLIENTE")).Tables[0];
            GridView1.DataBind();
        }
        protected void ddlTipoCarne_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridProductos.DataSource = (AccSQL.Ejecuta1Tabla("SELECT * FROM PRODUCTOS WHERE TIPO_CARNE = " + "'" + ddlTipoCarne.SelectedItem.ToString() + "'")).Tables[0];
            GridProductos.DataBind();
        }

        protected void GridProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int numRenglon = Convert.ToInt16(e.CommandArgument.ToString());
            int idproducto = Convert.ToInt16(GridProductos.Rows[numRenglon].Cells[1].Text);
            double precio = (double)AccSQL.EjecutaCon1Res("SELECT PRECIO FROM PRODUCTOS WHERE ID_PRODUCTO = " + idproducto);
            //double precio = Convert.ToDouble(GridProductos.Rows[numRenglon].Cells[3].Text);
            Session["ID_Producto"] = idproducto;
            Session["Precio"] = precio;
        }
        protected void GridPedidosAgregados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int numRenglon = Convert.ToInt16(e.CommandArgument.ToString());
            int idpedido = Convert.ToInt16(GridPedidosAgregados.Rows[numRenglon].Cells[1].Text);
            Session["ID_Pedidos"] = idpedido;
        }
        protected void btnPedir_Click(object sender, EventArgs e)
        {
            int idproducto = (int)Session["ID_Producto"];
            double precio = (double)Session["Precio"];
            int idpedido = (int)Session["ID_Pedidos"];
            int cantidad = Convert.ToInt32(txtCantidad.Text);
            double total = (precio * cantidad)/2;
            string DetallesInsert = AccSQL.EjecutaSinRes($"INSERT INTO DETALLES_PEDIDOS VALUES({idpedido},{idproducto},{cantidad}, {total*cantidad})");
            string Actualizar = AccSQL.EjecutaSinRes($"UPDATE PEDIDOS " +
                                                     $"SET TOTAL = (SELECT SUM(PRECIO_TOTAL) FROM DETALLES_PEDIDOS WHERE ID_PEDIDO = {idpedido})" +
                                                     $"WHERE ID_PEDIDO = {idpedido}; ");

            //Ticket
            Response.Redirect("Pedidos.aspx");
        }
        protected void GridClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int numRenglon = Convert.ToInt16(e.CommandArgument.ToString());
            int idcliente = Convert.ToInt16(GridClientes.Rows[numRenglon].Cells[1].Text);
            Session["ID_Cliente"] = idcliente;
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            int idmax = (int)AccSQL.EjecutaCon1Res("SELECT COUNT(ID_PEDIDO) FROM PEDIDOS") + 1;
            int idcarnicero = (int)AccSQL.EjecutaCon1Res("SELECT ID_CARNICERO FROM CARNICERO WHERE NOMBRE ='" + ddlCarnicero.SelectedValue.ToString() + "'");
            int idrepartidor = (int)AccSQL.EjecutaCon1Res("SELECT ID_REPARTIDOR FROM REPARTIDORES WHERE NOMBRE ='" + ddlRepartidor.SelectedValue.ToString() + "'");
            int idcliente = (int)Session["ID_Cliente"];
            string PedidoInsert = AccSQL.EjecutaSinRes($"INSERT INTO PEDIDOS VALUES({idmax},{idcliente},{idcarnicero},{idrepartidor}, '{ddlPago.SelectedValue.ToString()}', GETDATE(), 0.00)");

            GridPedidosAgregados.DataSource = (AccSQL.Ejecuta1Tabla("SELECT PE.ID_PEDIDO, CLI.NOMBRE_REFERENCIA FROM PEDIDOS AS PE INNER JOIN CLIENTE AS CLI ON PE.ID_CLIENTE = CLI.ID_CLIENTE")).Tables[0];
            GridPedidosAgregados.DataBind();
            Response.Redirect("Pedidos.aspx");
        }

        protected void btnCargar_Click(object sender, EventArgs e)
        {
            GridPedidosAgregados.DataSource = (AccSQL.Ejecuta1Tabla("SELECT PE.ID_PEDIDO, CLI.NOMBRE_REFERENCIA FROM PEDIDOS AS PE INNER JOIN CLIENTE AS CLI ON PE.ID_CLIENTE = CLI.ID_CLIENTE")).Tables[0];
            GridPedidosAgregados.DataBind();
        }
    }
}