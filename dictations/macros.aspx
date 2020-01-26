<%@ Page Language="C#" MasterPageFile="~/dictations/dictation.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Macros</h1>
<br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="ObjectDataSource1" AllowPaging="True">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>'></asp:Label><br />
            macro_name:
            <asp:TextBox ID="macro_nameTextBox" runat="server" Text='<%# Bind("macro_name") %>'>
            </asp:TextBox><br />
            macro_text:
            <asp:TextBox ID="macro_textTextBox" runat="server" Text='<%# Bind("macro_text") %>'>
            </asp:TextBox><br />
            macro_cat:
            <asp:TextBox ID="macro_catTextBox" runat="server" Text='<%# Bind("macro_cat") %>'>
            </asp:TextBox><br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
            </asp:LinkButton>
            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
            </asp:LinkButton>
        </EditItemTemplate>
        <InsertItemTemplate>
            macro_name:
            <asp:TextBox ID="macro_nameTextBox" runat="server" Text='<%# Bind("macro_name") %>'>
            </asp:TextBox><br />
            macro_text:
            <asp:TextBox ID="macro_textTextBox" runat="server" Text='<%# Bind("macro_text") %>'>
            </asp:TextBox><br />
            macro_cat:
            <asp:TextBox ID="macro_catTextBox" runat="server" Text='<%# Bind("macro_cat") %>'>
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
            macro_name:
            <asp:Label ID="macro_nameLabel" runat="server" Text='<%# Bind("macro_name") %>'>
            </asp:Label><br />
            macro_text:
            <asp:Label ID="macro_textLabel" runat="server" Text='<%# Bind("macro_text") %>'>
            </asp:Label><br />
            macro_cat:
            <asp:Label ID="macro_catLabel" runat="server" Text='<%# Bind("macro_cat") %>'></asp:Label><br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                Text="Edit">
            </asp:LinkButton>
            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                Text="Delete">
            </asp:LinkButton>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                Text="New">
            </asp:LinkButton>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
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

</asp:Content>

