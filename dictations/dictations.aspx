<%@ Page Language="C#" MasterPageFile="~/dictations/dictation.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Search Dictations</h1>
Patient ID:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Search" />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
        DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                SortExpression="id" />
            <asp:BoundField DataField="pat_id" HeaderText="pat_id" SortExpression="pat_id" />
            <asp:BoundField DataField="message" HeaderText="message" SortExpression="message" />
            <asp:BoundField DataField="doctor" HeaderText="doctor" SortExpression="doctor" />
            <asp:BoundField DataField="date_dictated" HeaderText="date_dictated" SortExpression="date_dictated" DataFormatString="{0:d}" HtmlEncode="false" />
            <asp:BoundField DataField="appt_id" HeaderText="appt_id" SortExpression="appt_id" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("id", "report.aspx?id={0}") %>'
                        Text="View"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDicbyPatID"
        TypeName="ptrackerTableAdapters.dictationsTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="pat_id" Type="String" />
            <asp:Parameter Name="message" Type="String" />
            <asp:Parameter Name="doctor" Type="String" />
            <asp:Parameter Name="date_dictated" Type="DateTime" />
            <asp:Parameter Name="appt_id" Type="String" />
            <asp:Parameter Name="Original_id" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="pat_id" PropertyName="Text" Type="String" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="pat_id" Type="String" />
            <asp:Parameter Name="message" Type="String" />
            <asp:Parameter Name="doctor" Type="String" />
            <asp:Parameter Name="date_dictated" Type="DateTime" />
            <asp:Parameter Name="appt_id" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>

</asp:Content>

