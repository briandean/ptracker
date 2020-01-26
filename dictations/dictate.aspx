<%@ Page Language="C#" MasterPageFile="dictation.master" Title="Untitled Page" ValidateRequest="false" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">


    protected void Button1_Click(object sender, EventArgs e)
    {
        string dictation = TextBox1.Text;
        string appt = Request.QueryString["id"];
        string doc = DropDownList1.SelectedValue;
        string pat_id = textbox3.Text;

        SqlConnection c = new SqlConnection("server=127.0.0.1;database=ptracker;uid=sa;pwd=password");
        string s = "Insert into dictations(pat_id,message,doctor,date_dictated, appt_id) values (@pat_id, @dictation, @doc, Current_timestamp, @appt_id)";
        SqlCommand co = new SqlCommand(s, c);

        SqlParameter param1 = new SqlParameter();
        param1.ParameterName = "@pat_id";
        param1.Value = pat_id;
        co.Parameters.Add(param1); 
        
        SqlParameter param2 = new SqlParameter();
        param2.ParameterName = "@dictation";
        param2.Value = dictation;
        co.Parameters.Add(param2);
        
        SqlParameter param3 = new SqlParameter();
        param3.ParameterName = "@doc";
        param3.Value = doc;
        co.Parameters.Add(param3);
      
        SqlParameter param4 = new SqlParameter();
        param4.ParameterName = "@appt_id";
        param4.Value = appt;
        co.Parameters.Add(param4);

        c.Open();
        co.ExecuteNonQuery();
        Response.Redirect("../dictations/Default.aspx");       
               
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text += ListBox1.SelectedValue;
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Dictation Station</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
        DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                SortExpression="id" />
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
            <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
            <asp:BoundField DataField="checked_in" HeaderText="checked_in" SortExpression="checked_in" />
            <asp:BoundField DataField="checked_out" HeaderText="checked_out" SortExpression="checked_out" />
            <asp:BoundField DataField="visiting" HeaderText="visiting" SortExpression="visiting" />
            <asp:BoundField DataField="room" HeaderText="room" SortExpression="room" />
            <asp:BoundField DataField="office" HeaderText="office" SortExpression="office" />
            <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
        </Columns>
    </asp:GridView>
    <table>
        <tr>
            <td style="height: 695px">
                &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource3"
                    DataTextField="name" DataValueField="id">
                </asp:DropDownList>
                <br />
                Patient ID: <asp:TextBox ID="textbox3" runat="server"></asp:TextBox>
                <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete"
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
                <asp:UpdatePanel id="UpdatePanel1" runat="server">
                    <contenttemplate>
                <asp:TextBox ID="TextBox1" runat="server" Height="500px" TextMode="MultiLine" Width="600px"></asp:TextBox>
</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>
                <asp:Button ID="Button1" runat="server" Text="Submit Dictation" OnClick="Button1_Click" /></td>
            <td style="height: 695px">
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="ObjectDataSource2" DataTextField="macro_name"
                    DataValueField="macro_text" Height="500px" Width="100px"></asp:ListBox><br />
                <asp:Button ID="Button2" Text="Insert Macro" runat="server" OnClick="Button2_Click">
                </asp:Button>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetMacros"
        TypeName="ptrackerTableAdapters.macrosTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="macro_name" Type="String" />
            <asp:Parameter Name="macro_text" Type="String" />
            <asp:Parameter Name="macro_cat" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="macro_name" Type="String" />
            <asp:Parameter Name="macro_text" Type="String" />
            <asp:Parameter Name="macro_cat" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByID"
        TypeName="ptrackerTableAdapters.patientsTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="first_name" Type="String" />
            <asp:Parameter Name="last_name" Type="String" />
            <asp:Parameter Name="checked_in" Type="DateTime" />
            <asp:Parameter Name="checked_out" Type="DateTime" />
            <asp:Parameter Name="visiting" Type="String" />
            <asp:Parameter Name="room" Type="String" />
            <asp:Parameter Name="office" Type="String" />
            <asp:Parameter Name="time" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="first_name" Type="String" />
            <asp:Parameter Name="last_name" Type="String" />
            <asp:Parameter Name="checked_in" Type="DateTime" />
            <asp:Parameter Name="checked_out" Type="DateTime" />
            <asp:Parameter Name="visiting" Type="String" />
            <asp:Parameter Name="room" Type="String" />
            <asp:Parameter Name="office" Type="String" />
            <asp:Parameter Name="time" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
</asp:Content>
