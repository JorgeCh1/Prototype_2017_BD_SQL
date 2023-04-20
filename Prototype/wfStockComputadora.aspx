<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfStockComputadora.aspx.cs" Inherits="Prototype.wfStockComputadora" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hfId" runat="server" />
    <asp:HiddenField ID="hfModo" runat="server" />

      <br />
        <br />
    <div style="text-align:initial; display:inline-block">
    <asp:Panel ID="Panel1" runat="server" style="margin-right: 13px; margin-bottom: 0px" Width="706px">

        <asp:Label ID="lblMarca" runat="server" Text="Marca"></asp:Label><br />
        <asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvMarca" runat="server" ControlToValidate="txtMarca" ErrorMessage="Campo marca está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />

        <br />
        <asp:Label ID="lblModelo" runat="server" Text="Modelo"></asp:Label><br />
        <asp:TextBox ID="txtModelo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvModelo" runat="server" ControlToValidate="txtModelo" ErrorMessage="Campo Modelo está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />

        <br />
        <asp:Label ID="lblProcesador" runat="server" Text="Procesador"></asp:Label><br />
        <asp:TextBox ID="txtProcesador" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvProcesador" runat="server" ControlToValidate="txtProcesador" ErrorMessage="Campo Procesador está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />

        <br />
        <asp:Label ID="lblMemoriaRam" runat="server" Text="Memoria RAM"></asp:Label><br />
        <asp:TextBox ID="txtMemoriaRam" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvMemoriaRam" runat="server" ControlToValidate="txtMemoriaRam" ErrorMessage="Campo Memoria RAM está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />
        <asp:RangeValidator ID="rvMemoriaRam" runat="server" ControlToValidate="txtMemoriaRam" ErrorMessage="Solo se aceptan números enteros de 1 a 32768" Display="Dynamic" ForeColor="Red" MinimumValue="1" MaximumValue="32768" Type="Integer" ValidationGroup="AgregarComputadora" />

        <br />
        <asp:Label ID="lblAlmacenamiento" runat="server" Text="Almacenamiento"></asp:Label><br />
        <asp:TextBox ID="txtAlmacenamiento" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvAlmacenamiento" runat="server" ControlToValidate="txtAlmacenamiento" ErrorMessage="Campo Almacenamiento está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />
        <asp:RangeValidator ID="rvAlmacenamiento" runat="server" ControlToValidate="txtAlmacenamiento" ErrorMessage="Solo se aceptan números enteros de 1 a 1000000" Display="Dynamic" ForeColor="Red" MinimumValue="1" MaximumValue="1000000" Type="Integer" ValidationGroup="AgregarComputadora" />

        <br />
        <asp:Label ID="lblSistemaOperativo" runat="server" Text="Sistema Operativo"></asp:Label><br />
        <asp:TextBox ID="txtSistemaOperativo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvSistemaOperativo" runat="server" ControlToValidate="txtSistemaOperativo" ErrorMessage="Campo Sistema Operativo está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />
        <br />
        <asp:Button runat="server" Text="Insertar" OnClick="Hecho_Click" Width="150px" />&nbsp;&nbsp;&nbsp;  
          <br />
        <br />
    </asp:Panel>
        </div>

    <div style="text-align:initial; display:inline-block">
    <asp:Panel ID="Panel2" runat="server" Height="508px" Width="713px">
        <asp:Label ID="lblID" runat="server" Text="Id"></asp:Label><br />
        <asp:TextBox ID="txtId" runat="server" Visible="true"></asp:TextBox>
        <br />
            <asp:Label runat="server" Text="Ingrese la cantidad de Computadoras que existen:" Font-Size="Medium"></asp:Label><br />
            <asp:TextBox ID="txtCantidadProducto" runat="server" ToolTip="Representa la cantidad del producto"></asp:TextBox>

        <br />
            <asp:Label runat="server" Text="Ingrese la cantidad de Computadoras para dar de Alta:" Font-Size="Medium"></asp:Label><br />
            <asp:TextBox ID="txtAlta" runat="server" ToolTip="Representa la cantidad del producto"></asp:TextBox>

        <br />

            <asp:Label runat="server" Text="Ingrese la cantidad de Computadoras para dar de Baja:" Font-Size="Medium"></asp:Label><br />
            <asp:TextBox ID="txtBaja" runat="server" ToolTip="Representa la cantidad del producto"></asp:TextBox>

        <br />


            
            <asp:Button runat="server" Text="Actualizar" OnClick="Actualizar_Click" Width="150px" />&nbsp;&nbsp;&nbsp;
       
        <br />
        <br />
        <br />
            <asp:Label ID="lblAltaStock" runat="server" Font-Size="Small"></asp:Label>
            <br />
            <asp:Label ID="lblBajaStok" runat="server" Font-Size="Small"></asp:Label>
            <br />
            <br />
        <br />
        </asp:Panel>
        </div>
</asp:Content>

