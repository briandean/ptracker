<%@ Page Language="C#" MasterPageFile="dictation.master" Title="Untitled Page" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Appointments to dictate</h1><br />
    Select Doctor:
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource2"
        DataTextField="name" DataValueField="name">
    </asp:DropDownList><asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete"
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
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
        DataSourceID="ObjectDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
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
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("id", "dictate.aspx?id={0}") %>'
                        Text="Dictate"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3EAEB" />
        <EditRowStyle BackColor="#7C6F57" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByDoctorAndStatus"
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
            <asp:ControlParameter ControlID="DropDownList1" Name="doctor" PropertyName="SelectedValue"
                Type="String" />
            <asp:QueryStringParameter DefaultValue="3" Name="status" QueryStringField="status"
                Type="String" />
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
</asp:Content>

