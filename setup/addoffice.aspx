<%@ Page Language="C#" MasterPageFile="setup.master"  %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        string office = TextBox1.Text;

        SqlConnection c = new SqlConnection("server=127.0.0.1;database=ptracker;uid=sa;pwd=password");
        string s = "Insert into office(office) values (@office)";
        SqlCommand co = new SqlCommand(s, c);

        SqlParameter param1 = new SqlParameter();
        param1.ParameterName = "@office";
        param1.Value = office;
        co.Parameters.Add(param1);

        c.Open();
        co.ExecuteNonQuery();
        Response.Redirect("offices.aspx");

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("offices.aspx");

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Add Office</h1>
<br />
Office Name: 
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" />
</asp:Content>

