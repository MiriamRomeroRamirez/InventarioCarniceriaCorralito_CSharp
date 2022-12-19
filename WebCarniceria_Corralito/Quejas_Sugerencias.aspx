<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Quejas_Sugerencias.aspx.cs" Inherits="WebCarniceria_Corralito.Quejas_Sugerencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <section id="contenido">
        <div>
            <div>
            </div>
            <br />
            <div id="Pedidos">
                <div id="GridPedidosP">
                    <asp:GridView ID="GridPedidos" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCommand="GridPedidos_RowCommand" Height="100%">
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
                    <asp:Button ID="btnMirarDetalles" runat="server" CssClass="EstiloBoton" Text="Mirar detalles" Width="123px" OnClick="btnMirarDetalles_Click" />
                    <br />
                </div>
                <div id="GridDetallesPP"> 
                    <asp:GridView ID="GridDetallesP" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Height="100%" Enabled="False">
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
                
            </div>
        </div>

        <div id="Detalles">
            <asp:Label ID="Label1" runat="server" Text="Aclaración: "></asp:Label>
            <br />
            <asp:TextBox ID="txtAclaraciones" runat="server" Height="100px" TextMode="MultiLine" Width="355px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnComentar" runat="server" Text="Comentar" CssClass="EstiloBoton" OnClick="btnComentar_Click" />
            <br />
            
        </div>
        <div>
            <asp:Label ID="Label3" runat="server" Text="Aclaraciones"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridAclaraciones" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="100%">
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

    </section>
</asp:Content>

