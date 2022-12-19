<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="WebCarniceria_Corralito.Pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <section id="contenido">
        
        <div id="AgregarPedidoNuevo">
            <h1>AGREGAR UN PEDIDO A CLIENTE</h1><br />
            <div id="Registro">
                <asp:Label ID="Label6" runat="server" Text="No.Pedido"></asp:Label><asp:TextBox ID="txtNoPedido" runat="server" CssClass="cajaCrear" Enabled="False" Width="66px"></asp:TextBox>
                <br />
                <asp:Label ID="Label1" runat="server" Text="CARNICERO: "></asp:Label><asp:DropDownList ID="ddlCarnicero" runat="server" CssClass="EstiloBoton" DataSourceID="SqlDataSource1" DataTextField="NOMBRE" DataValueField="NOMBRE"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CARNICERIA_ConnectionString2 %>" SelectCommand="SELECT [NOMBRE] FROM [CARNICERO]"></asp:SqlDataSource>
                <br />
                <asp:Label ID="Label2" runat="server" Text="REPARTIDOR: "></asp:Label><asp:DropDownList ID="ddlRepartidor" runat="server" CssClass="EstiloBoton" DataSourceID="SqlDataSource3" DataTextField="NOMBRE" DataValueField="NOMBRE" Height="16px"></asp:DropDownList>
                <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CARNICERIA_ConnectionString3 %>" SelectCommand="SELECT [NOMBRE] FROM [REPARTIDORES]"></asp:SqlDataSource>
                <asp:Label ID="Label3" runat="server" Text="PAGO: "></asp:Label><asp:DropDownList ID="ddlPago" runat="server" CssClass="EstiloBoton" Height="23px">
                    <asp:ListItem>TARJETA</asp:ListItem>
                    <asp:ListItem>PERSONAL</asp:ListItem>
                    <asp:ListItem>PAGO A REPARTIDOR</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div id="listClientes">
                <asp:GridView ID="GridClientes" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="GridClientes_RowCommand" Height="100%" Width="100%">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
        <div id="botonAgregar">
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar pedido" CssClass="EstiloBoton" OnClick="btnAgregar_Click" />
        </div>
                <br />
             </div>
        </div>
        <br />
        <br />

        <div id="AgregarDetallePedido">
            <h1>AGREGAR PRODUCTOS A PEDIDOS</h1><br />
            <div id="Productos">
        <asp:DropDownList ID="ddlTipoCarne" runat="server" CssClass="EstiloBoton" Height="43px" OnSelectedIndexChanged="ddlTipoCarne_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem>RES</asp:ListItem>
            <asp:ListItem>CERDO</asp:ListItem>
        </asp:DropDownList>
                <br />
                <br />
                Lista de productos:
                <asp:GridView ID="GridProductos" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="GridProductos_RowCommand" Height="100%" Width="100%">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Cantidad"></asp:Label><asp:TextBox ID="txtCantidad" runat="server" CssClass="cajaCrear" TextMode="Number"></asp:TextBox>
                
        <div id="botonpedir">
                <asp:Button ID="btnPedir" runat="server" Text="ORDENAR" CssClass="EstiloBoton" OnClick="btnPedir_Click" Height="22px" />
        </div>
        
            </div>
            <div id="PedidosAgregados">
                <asp:Button ID="btnCargar" runat="server" CssClass="EstiloBoton" Text="Cargar pedidos guardados" OnClick="btnCargar_Click" />
                <br />
                <br />
                Lista de pedidos: <br />
                <asp:GridView ID="GridPedidosAgregados" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="GridPedidosAgregados_RowCommand" Height="100%" Width="100%">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
            </div>
            <br />
        </div>
        <br />
        <h1>PEDIDOS REALIZADOS</h1>
        <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="100%">
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </section>
</asp:Content>
