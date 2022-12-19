<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Alta_Clientes.aspx.cs" Inherits="WebCarniceria_Corralito.Alta_Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <section id="contenido">
    <asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label><asp:TextBox ID="txtNomCliente" runat="server" CssClass="cajaCrear"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="No. Celular: "></asp:Label><asp:TextBox ID="txtCelular" runat="server" CssClass="cajaCrear"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Colonia: "></asp:Label><asp:TextBox ID="txtColonia" runat="server" CssClass="cajaCrear"></asp:TextBox>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Calle: "></asp:Label><asp:TextBox ID="txtCalle" runat="server" CssClass="cajaCrear"></asp:TextBox>
    <br />
    <asp:Label ID="Label6" runat="server" Text="No. Exterior: "></asp:Label><asp:TextBox ID="txtExterior" runat="server" CssClass="cajaCrear"></asp:TextBox>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Referencia: "></asp:Label>
    <br />
    <asp:TextBox ID="txtReferencia" runat="server" Height="94px" TextMode="MultiLine" Width="333px" CssClass="cajaCrear"></asp:TextBox>

    <br />
    <br />
    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" CssClass="EstiloBoton" OnClick="btnRegistrar_Click" />
    <br />
    <asp:Label ID="lblRegistro" runat="server"></asp:Label>
</section>
</asp:Content>
