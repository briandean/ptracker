<%@ Page Language="C#" MasterPageFile="~/dictations/dictation.master" Title="Untitled Page" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1>Report</h1><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetReportByID"
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
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="pat_id" Type="String" />
            <asp:Parameter Name="message" Type="String" />
            <asp:Parameter Name="doctor" Type="String" />
            <asp:Parameter Name="date_dictated" Type="DateTime" />
            <asp:Parameter Name="appt_id" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
            Patient Name:
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("first_name") %>'></asp:Label>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("last_name") %>'></asp:Label><br />
            <br />
            Doctor:
            <asp:Label ID="doctorLabel" runat="server" Text='<%# Eval("doctor") %>'></asp:Label><br />
            Appointment Date:
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("checked_in") %>'></asp:Label><br />
            Date Dictated:<asp:Label ID="date_dictatedLabel" runat="server" Text='<%# Eval("date_dictated") %>'></asp:Label><br />
            <br />
            <asp:Label ID="messageLabel" runat="server" Text='<%# Eval("message") %>'></asp:Label>
        </ItemTemplate>
    </asp:DataList>
    &nbsp;

</asp:Content>

