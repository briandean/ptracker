<%@ Page Language="C#" MasterPageFile="~/setup/setup.master"  %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        string room = TextBox1.Text;
        string office = DropDownList1.SelectedValue;

        SqlConnection c = new SqlConnection("server=127.0.0.1;database=ptracker;uid=sa;pwd=password");
        string s = "Insert into rooms(office_id, room_num) values (@office,@room)";
        SqlCommand co = new SqlCommand(s, c);

        SqlParameter param1 = new SqlParameter();
        param1.ParameterName = "@room";
        param1.Value = room;
        co.Parameters.Add(param1);


        SqlParameter param2 = new SqlParameter();
        param2.ParameterName = "@office";
        param2.Value = office;
        co.Parameters.Add(param2);

        c.Open();
        co.ExecuteNonQuery();
        Response.Redirect("allrooms.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("allrooms.aspx");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Add Room</h1>
    <a href="../setup/allrooms.aspx">All Rooms</a>&nbsp
    <a href="../setup/filterroom.aspx">Filter Rooms</a>&nbsp
    <a href="../setup/addroom.aspx">Add Room</a>
    <br />
    <br />
Office:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="office" DataValueField="id">
    </asp:DropDownList>
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
    <br />
    Room Number:
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Room" />
    <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" />
</asp:Content>

