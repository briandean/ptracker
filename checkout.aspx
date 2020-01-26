<%@ Page Language="C#" MasterPageFile="~/status.master" Title="Untitled Page" %>

<script runat=server>

    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        
    {
        Response.Redirect("Default.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        FormView1.ItemUpdated += new FormViewUpdatedEventHandler(FormView1_ItemUpdated);
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>
        Check out patient</h1>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource1"
        DefaultMode="Edit">
        <EditItemTemplate>
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' Visible="False"></asp:Label><br />
            Status:
            <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("status") %>'>
                <asp:ListItem Value="0">Waiting</asp:ListItem>
                <asp:ListItem Value="1">In Room</asp:ListItem>
                <asp:ListItem Value="3">Check Out</asp:ListItem>
            </asp:DropDownList><br />
            First Name:
            <asp:Label ID="Label1" runat="server" Text='<%# Bind("first_name", "{0}") %>'></asp:Label><br />
            Last Name:
            <asp:Label ID="Label2" runat="server" Text='<%# Bind("last_name", "{0}") %>'></asp:Label><br />
            Checked In:
            <asp:Label ID="Label3" runat="server" Text='<%# Bind("checked_in", "{0}") %>'></asp:Label><asp:Label ID="Label4" runat="server" Text='<%# Bind("checked_out", "{0}") %>' Visible="False"></asp:Label><br />
            Resource:<asp:Label ID="Label6" runat="server" Text='<%# Bind("visiting") %>'></asp:Label><br />
            Appointment Time:<asp:Label ID="Label5" runat="server" Text='<%# Bind("time") %>'></asp:Label><br />
            Patient SSN:
            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ssn", "{0}") %>'></asp:TextBox><br />
            Patient DOB:<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("dob", "{0}") %>'></asp:TextBox><br />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Check Out"></asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel" PostBackUrl="~/Default.aspx"></asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            status:
            <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>'>
            </asp:TextBox><br />
            first_name:
            <asp:TextBox ID="first_nameTextBox" runat="server" Text='<%# Bind("first_name") %>'>
            </asp:TextBox><br />
            last_name:
            <asp:TextBox ID="last_nameTextBox" runat="server" Text='<%# Bind("last_name") %>'>
            </asp:TextBox><br />
            checked_in:
            <asp:TextBox ID="checked_inTextBox" runat="server" Text='<%# Bind("checked_in") %>'>
            </asp:TextBox><br />
            checked_out:
            <asp:TextBox ID="checked_outTextBox" runat="server" Text='<%# Bind("checked_out") %>'>
            </asp:TextBox><br />
            visiting:
            <asp:TextBox ID="visitingTextBox" runat="server" Text='<%# Bind("visiting") %>'>
            </asp:TextBox><br />
            room:
            <asp:TextBox ID="roomTextBox" runat="server" Text='<%# Bind("room") %>'>
            </asp:TextBox><br />
            office:
            <asp:TextBox ID="officeTextBox" runat="server" Text='<%# Bind("office") %>'>
            </asp:TextBox><br />
            time:
            <asp:TextBox ID="timeTextBox" runat="server" Text='<%# Bind("time") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert">
            </asp:LinkButton>
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>'></asp:Label><br />
            status:
            <asp:Label ID="statusLabel" runat="server" Text='<%# Bind("status") %>'></asp:Label><br />
            first_name:
            <asp:Label ID="first_nameLabel" runat="server" Text='<%# Bind("first_name") %>'></asp:Label><br />
            last_name:
            <asp:Label ID="last_nameLabel" runat="server" Text='<%# Bind("last_name") %>'></asp:Label><br />
            checked_in:
            <asp:Label ID="checked_inLabel" runat="server" Text='<%# Bind("checked_in") %>'></asp:Label><br />
            checked_out:
            <asp:Label ID="checked_outLabel" runat="server" Text='<%# Bind("checked_out") %>'></asp:Label><br />
            visiting:
            <asp:Label ID="visitingLabel" runat="server" Text='<%# Bind("visiting") %>'></asp:Label><br />
            room:
            <asp:Label ID="roomLabel" runat="server" Text='<%# Bind("room") %>'></asp:Label><br />
            office:
            <asp:Label ID="officeLabel" runat="server" Text='<%# Bind("office") %>'></asp:Label><br />
            time:
            <asp:Label ID="timeLabel" runat="server" Text='<%# Bind("time") %>'></asp:Label><br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit"></asp:LinkButton>
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete"></asp:LinkButton>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New"></asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    <br />
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByID"
            TypeName="ptrackerTableAdapters.patientsTableAdapter" UpdateMethod="UpdateCheckedOut">
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
                <asp:Parameter Name="dictated" Type="Boolean" />
                <asp:Parameter Name="dob" Type="String" />
                <asp:Parameter Name="ssn" Type="String" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
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
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataAllOffices"
            TypeName="ptrackerTableAdapters.officeTableAdapter">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" DeleteMethod="Delete"
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
</asp:Content>
