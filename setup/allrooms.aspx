<%@ Page Language="C#" MasterPageFile="~/setup/setup.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>All Rooms</h1>
    <a href="../setup/allrooms.aspx">All Rooms</a>&nbsp
    <a href="../setup/filterroom.aspx">Filter Rooms</a>&nbsp
    <a href="../setup/addroom.aspx">Add Room</a>
    <br />
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataAllRooms"
        TypeName="ptrackerTableAdapters.roomsTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="office_id" Type="Int32" />
            <asp:Parameter Name="room_num" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="office_id" Type="Int32" />
            <asp:Parameter Name="room_num" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="ObjectDataSource1"
        EmptyDataText="No rooms in database" ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                SortExpression="id" />
            <asp:BoundField DataField="office_id" HeaderText="office_id" SortExpression="office_id"
                Visible="False" />
            <asp:BoundField DataField="room_num" HeaderText="room_num" SortExpression="room_num" />
        </Columns>
        <RowStyle BackColor="#E3EAEB" />
        <EditRowStyle BackColor="#7C6F57" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</asp:Content>

