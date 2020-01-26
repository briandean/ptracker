<%@ Page Language="C#" MasterPageFile="~/status.master" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        string first = TextBox1.Text;
        string last = TextBox2.Text;
        string doctor = DropDownList1.SelectedItem.Text;
        string office = DropDownList2.SelectedValue;
        string time = TextBox3.Text;
        
        SqlConnection c = new SqlConnection("server=127.0.0.1;database=ptracker;uid=sa;pwd=password");
        string s = "Insert into patients(status,first_name,last_name,checked_in,visiting,office,time) values (0,@first,@last,Current_timestamp,@doctor,@office,@time)";
        SqlCommand co = new SqlCommand(s, c);

        SqlParameter param1 = new SqlParameter();
        param1.ParameterName = "@first";
        param1.Value = first;
        co.Parameters.Add(param1);

        SqlParameter param3 = new SqlParameter();
        param3.ParameterName = "last";
        param3.Value = last;
        co.Parameters.Add(param3);

        SqlParameter param2 = new SqlParameter();
        param2.ParameterName = "@doctor";
        param2.Value = doctor;
        co.Parameters.Add(param2);

        SqlParameter param4 = new SqlParameter();
        param4.ParameterName = "@office";
        param4.Value = office;
        co.Parameters.Add(param4);

        SqlParameter param5 = new SqlParameter();
        param5.ParameterName = "@time";
        param5.Value = time;
        co.Parameters.Add(param5);


        c.Open();
        co.ExecuteNonQuery();
        Server.Transfer("checkin.aspx");
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>
    Patient Check In</h1>
<br />
<b>Please Check In</b>
<br />
<br />
Patients First Name:
    <asp:TextBox ID="TextBox1" runat="server" Width="257px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
        ErrorMessage="RequiredFieldValidator">Please Enter First Name</asp:RequiredFieldValidator><br />
Patients Last Name:&nbsp;<asp:TextBox ID="TextBox2" runat="server" Width="258px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
        ErrorMessage="RequiredFieldValidator">Please Enter Last Name</asp:RequiredFieldValidator><br />
    <br />
    Visiting Doctor:
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1"
        DataTextField="name" DataValueField="id" >
    </asp:DropDownList><br />
    &nbsp;Office Visiting:&nbsp;
    <asp:DropDownList id="DropDownList2" runat="server" DataValueField="id" DataTextField="office" DataSourceID="ObjectDataSource2">
        <asp:ListItem></asp:ListItem>
    </asp:DropDownList><br />
    Time of appointment:
    <asp:TextBox ID="TextBox3" runat="server" Width="49px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
        ErrorMessage="RequiredFieldValidator">Please Enter An Appointment Time</asp:RequiredFieldValidator><br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataAllDoctors"
        TypeName="ptrackerTableAdapters.doctorsTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="office_id" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="office_id" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataAllOffices" TypeName="ptrackerTableAdapters.officeTableAdapter" UpdateMethod="Update">
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
    <asp:Button ID="Button1" runat="server" Text="Check In" OnClick="Button1_Click" />
    &nbsp;
</asp:Content>

