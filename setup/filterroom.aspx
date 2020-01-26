<%@ Page Language="C#" MasterPageFile="~/setup/setup.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Filter Rooms</h1>
    <a href="../setup/allrooms.aspx">All Rooms</a>&nbsp
    <a href="../setup/filterroom.aspx">Filter Rooms</a>&nbsp
    <a href="../setup/addroom.aspx">Add Room</a>
    <br />
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataAllOffices"
        TypeName="ptrackerTableAdapters.officeTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="office" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="office" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    Office: &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
        DataSourceID="ObjectDataSource1" DataTextField="office" DataValueField="id">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByOfficeID"
        TypeName="ptrackerTableAdapters.roomsTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="office_id" Type="Int32" />
            <asp:Parameter Name="room_num" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="office" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="office_id" Type="Int32" />
            <asp:Parameter Name="room_num" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="ObjectDataSource2"
        ForeColor="#333333" GridLines="None">
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

