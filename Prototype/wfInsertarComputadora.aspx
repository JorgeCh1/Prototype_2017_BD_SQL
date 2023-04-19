<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="wfInsertarComputadora.aspx.cs" Inherits="Prototype.wfInsertarComputadora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <asp:HiddenField ID="hfId" runat="server" />
    <asp:HiddenField ID="hfModo" runat="server" />

    <asp:Label ID="lblMarca" runat="server" Text="Marca"></asp:Label>
    <asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvMarca" runat="server" ControlToValidate="txtMarca" ErrorMessage="Campo marca está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />
    
    <br />
    <asp:Label ID="lblModelo" runat="server" Text="Modelo"></asp:Label>
    <asp:TextBox ID="txtModelo" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvModelo" runat="server" ControlToValidate="txtModelo" ErrorMessage="Campo Modelo está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />
    
    <br />
    <asp:Label ID="lblProcesador" runat="server" Text="Procesador"></asp:Label>
    <asp:TextBox ID="txtProcesador" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvProcesador" runat="server" ControlToValidate="txtProcesador" ErrorMessage="Campo Procesador está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />
    
    <br />
    <asp:Label ID="lblMemoriaRam" runat="server" Text="Memoria RAM"></asp:Label>
    <asp:TextBox ID="txtMemoriaRam" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvMemoriaRam" runat="server" ControlToValidate="txtMemoriaRam" ErrorMessage="Campo Memoria RAM está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />
    <asp:RangeValidator ID="rvMemoriaRam" runat="server" ControlToValidate="txtMemoriaRam" ErrorMessage="Solo se aceptan números enteros de 1 a 32768" Display="Dynamic" ForeColor="Red" MinimumValue="1" MaximumValue="32768" Type="Integer" ValidationGroup="AgregarComputadora"  />

    <br />
    <asp:Label ID="lblAlmacenamiento" runat="server" Text="Almacenamiento"></asp:Label>
    <asp:TextBox ID="txtAlmacenamiento" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvAlmacenamiento" runat="server" ControlToValidate="txtAlmacenamiento" ErrorMessage="Campo Almacenamiento está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora" />
    <asp:RangeValidator ID="rvAlmacenamiento" runat="server" ControlToValidate="txtAlmacenamiento" ErrorMessage="Solo se aceptan números enteros de 1 a 1000000" Display="Dynamic" ForeColor="Red" MinimumValue="1" MaximumValue="1000000" Type="Integer" ValidationGroup="AgregarComputadora"  />

    <br />
    <asp:Label ID="lblSistemaOperativo" runat="server" Text="Sistema Operativo"></asp:Label>
    <asp:TextBox ID="txtSistemaOperativo" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvSistemaOperativo" runat="server" ControlToValidate="txtSistemaOperativo" ErrorMessage="Campo Sistema Operativo está vació" Display="Dynamic" ForeColor="Red" ValidationGroup="AgregarComputadora"  />

    <asp:TextBox ID="txtId" runat="server" Visible="false"></asp:TextBox>

    <br />
    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" ValidationGroup="AgregarComputadora" />
    
    <br />
    <asp:Button ID="btnEditar" runat="server" Text="Editar" OnClick="btnEditar_Click" ValidationGroup="EditarComputadora" />


   <asp:GridView ID="gvComputadoras" runat="server" AutoGenerateColumns="False">
       <Columns>
         <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnSeleccionar" runat="server" Text="Seleccionar" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnSeleccionar_Click" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Id" HeaderText="Id"/>
        <asp:BoundField DataField="Marca" HeaderText="Marca" />
        <asp:BoundField DataField="Modelo" HeaderText="Modelo" />
        <asp:BoundField DataField="Procesador" HeaderText="Procesador" />
        <asp:BoundField DataField="MemoriaRam" HeaderText="Memoria RAM" />
        <asp:BoundField DataField="Almacenamiento" HeaderText="Almacenamiento" />
        <asp:BoundField DataField="SistemaOperativo" HeaderText="Sistema Operativo" />
        <asp:TemplateField HeaderText="Acción">
            <ItemTemplate >
                <asp:Button ID="btnClonar" runat="server" Text="Clonar" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnClonar_Click" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Acción">
            <ItemTemplate>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnEliminar_Click" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    </asp:GridView>


</asp:Content>
