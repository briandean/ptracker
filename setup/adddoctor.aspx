<%@ Page Language="C#" MasterPageFile="~/setup/setup.master"  %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    
    {
        string name = TextBox1.Text;
        string office = DropDownList1.SelectedValue;
        
        SqlConnection c = new SqlConnection("server=127.0.0.1;database=ptracker;uid=sa;pwd=password");
        string s = "Insert into doctors(office_id, name) values (@office,@name)";
        SqlCommand co = new SqlCommand(s, c);

        SqlParameter param1 = new SqlParameter();
        param1.ParameterName = "@name";
        param1.Value = name;
        co.Parameters.Add(param1);
        
        
        SqlParameter param2 = new SqlParameter();
        param2.ParameterName = "@office";
        param2.Value = office;
        co.Parameters.Add(param2);

        c.Open();
        co.ExecuteNonQuery();
        Response.Redirect("alldoctors.aspx");

    }

protected void  Button2_Click(object sender, EventArgs e)
{
        Response.Redirect("alldoctors.aspx");
}
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Add Doctor</h1>
    
        <a href="../setup/alldoctors.aspx">All Doctors</a>&nbsp<a href="../setup/filtereddocs.aspx">Filter Doctors</a>&nbsp<a
            href="../setup/adddoctor.aspx">Add Doctor</a>
<br />
<br />
        Office:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1"
            DataTextField="office" DataValueField="id">
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
    Name:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Add Doctor" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" /><br />

</asp:Content>

