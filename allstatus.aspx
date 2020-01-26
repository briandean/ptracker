<%@ Page Language="C#" MasterPageFile="~/status.master" %>

<script runat="server">



    protected void HighlightedInRoom_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ptracker.patientsRow status = (ptracker.patientsRow)((System.Data.DataRowView)e.Row.DataItem).Row;
            if (!status.status.Equals("1"))
            {
                e.Row.BackColor = System.Drawing.Color.Yellow;

            }
            else
            {
                e.Row.BackColor = System.Drawing.Color.Green;
            }

        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            
            ptracker.patientsRow q = (ptracker.patientsRow)((System.Data.DataRowView)e.Row.DataItem).Row;
            Label statuslbl = (Label)e.Row.FindControl("Label8");
            string text;
            text = statuslbl.Text;
            
            if (!q.status.Equals("1"))
            {
                statuslbl.Text = "Waiting";    
            }
            else
            {
                statuslbl.Text = "In Room";
            }
        }
            
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }


</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Status of all patients</h1>
    <asp:Timer id="Timer1" runat="server"  Interval="15000" EnableViewState="False" OnTick="Timer1_Tick">
    </asp:Timer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetWaitingAndInRoom"
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
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataAllRooms"
        TypeName="ptrackerTableAdapters.roomsTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" DeleteMethod="Delete"
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
    &nbsp; &nbsp; &nbsp;
    <br />
    <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <contenttemplate>
<asp:GridView id="GridView1" runat="server" OnRowDataBound="HighlightedInRoom_RowDataBound" Font-Bold="False" EmptyDataText="No Patients Waiting" DataSourceID="ObjectDataSource1" DataKeyNames="id" AutoGenerateColumns="False" AllowSorting="True" __designer:wfdid="w116"><Columns>
<asp:CommandField ButtonType="Button" ShowEditButton="True"></asp:CommandField>
<asp:BoundField ReadOnly="True" DataField="id" InsertVisible="False" Visible="False" SortExpression="id" HeaderText="Waiting ID"></asp:BoundField>
<asp:TemplateField SortExpression="status" HeaderText="Status"><EditItemTemplate>
<asp:DropDownList id="DropDownList1" runat="server" __designer:wfdid="w40" SelectedValue='<%# Bind("status") %>'><asp:ListItem Selected="True" Value="0">Waiting</asp:ListItem>
<asp:ListItem Value="1">In Room</asp:ListItem>
</asp:DropDownList><BR /><asp:Label id="Label8" runat="server" __designer:wfdid="w41" Text='<%# Eval("status", "{0}") %>' Visible="False"></asp:Label> 
</EditItemTemplate>
<ItemTemplate>
<asp:Label id="Label8" runat="server" __designer:wfdid="w37" Text='<%# Eval("status", "{0}") %>'></asp:Label> 
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="first_name" HeaderText="First Name"><EditItemTemplate>
<asp:Label id="Label2" runat="server" __designer:wfdid="w32" Text='<%# Bind("first_name") %>'></asp:Label> 
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="last_name" HeaderText="Last Name"><EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="checked_in" HeaderText="Checked In"><EditItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("checked_in") %>'></asp:Label>
                
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("checked_in") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="checked_out" Visible="False" HeaderText="checked_out"><EditItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("checked_out") %>'></asp:Label>
                
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("checked_out") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="visiting" HeaderText="Doctor"><EditItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("visiting") %>'></asp:Label>
                
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("visiting") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="room" HeaderText="Room"><EditItemTemplate>
                    &nbsp;<asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="ObjectDataSource3"
                        DataTextField="room_num" DataValueField="room_num" SelectedValue='<%# Bind("room") %>'>
                    </asp:DropDownList>
                
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("room", "{0}") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="office" HeaderText="office"><EditItemTemplate>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("office") %>'></asp:Label>
                
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("office") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="time" HeaderText="Appointment"><EditItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                
</EditItemTemplate>
<ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField><EditItemTemplate>
<asp:HyperLink id="HyperLink1" runat="server" __designer:wfdid="w38" Text="Transfer" NavigateUrl='<%# Eval("id", "transfer.aspx?id={0}") %>'></asp:HyperLink> <asp:HyperLink id="HyperLink2" runat="server" __designer:wfdid="w35" Text="Check Out" NavigateUrl='<%# Eval("id", "checkout.aspx?id={0}") %>' ForeColor="Black" EnableTheming="False"></asp:HyperLink> 
</EditItemTemplate>

<ControlStyle BackColor="Silver" ForeColor="Black"></ControlStyle>
</asp:TemplateField>
<asp:BoundField DataField="dob" Visible="False" SortExpression="dob" HeaderText="dob"></asp:BoundField>
<asp:BoundField DataField="ssn" Visible="False" SortExpression="ssn" HeaderText="ssn"></asp:BoundField>
</Columns>
</asp:GridView> 
</contenttemplate>
        <triggers>
<asp:AsyncPostBackTrigger ControlID="Timer1" ></asp:AsyncPostBackTrigger>
</triggers>
    </asp:UpdatePanel>
</asp:Content>
