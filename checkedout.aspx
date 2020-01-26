<%@ Page Language="C#" MasterPageFile="~/status.master" %>

<script runat="server">



    protected void HighlightedInRoom_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ptracker.patientsRow status = (ptracker.patientsRow)((System.Data.DataRowView)e.Row.DataItem).Row;
            if (!status.status.Equals("3"))
            {
                e.Row.BackColor = System.Drawing.Color.Green;

            }
            else
            {
                e.Row.BackColor = System.Drawing.Color.Red;
            }

        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            
            ptracker.patientsRow q = (ptracker.patientsRow)((System.Data.DataRowView)e.Row.DataItem).Row;
            Label statuslbl = (Label)e.Row.FindControl("Label8");
            string text;
            text = statuslbl.Text;
            
            if (!q.status.Equals("3"))
            {
                statuslbl.Text = "In Room";    
            }
            else
            {
                statuslbl.Text = "Checked Out";
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
        Checked Out and In Room Patients</h1>
    <asp:Timer id="Timer1" runat="server" Interval="15000" OnTick="Timer1_Tick">
    </asp:Timer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCheckedOutandWaiting"
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
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<asp:GridView id="GridView1" runat="server" OnRowDataBound="HighlightedInRoom_RowDataBound" Font-Bold="False" EmptyDataText="No Patients Waiting" DataSourceID="ObjectDataSource1" DataKeyNames="id" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" __designer:wfdid="w9">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="Waiting ID" InsertVisible="False" ReadOnly="True"
                SortExpression="id" Visible="False" />
            <asp:TemplateField HeaderText="Status" SortExpression="status">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("status") %>'>
                        <asp:ListItem Selected="True" Value="0">Waiting</asp:ListItem>
                        <asp:ListItem Value="1">In Room</asp:ListItem>
                        <asp:ListItem Value="3">Check Out</asp:ListItem>
                    </asp:DropDownList><br />
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("status", "{0}") %>' Visible="False"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("status", "{0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name" SortExpression="first_name">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="last_name">
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Checked In" SortExpression="checked_in">
                <EditItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("checked_in") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("checked_in") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="checked_out" SortExpression="checked_out" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("checked_out") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("checked_out") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Doctor" SortExpression="visiting">
                <EditItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("visiting") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("visiting") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Room" SortExpression="room">
                <EditItemTemplate>
                    &nbsp;<asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="ObjectDataSource3"
                        DataTextField="room_num" DataValueField="room_num" SelectedValue='<%# Bind("room") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("room", "{0}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="office" SortExpression="office">
                <EditItemTemplate>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("office") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("office") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Appointment" SortExpression="time">
                <EditItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("time") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</contenttemplate>
        <triggers>
<asp:AsyncPostBackTrigger ControlID="Timer1"></asp:AsyncPostBackTrigger>
</triggers>
    </asp:UpdatePanel>
    &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    <br />
</asp:Content>
