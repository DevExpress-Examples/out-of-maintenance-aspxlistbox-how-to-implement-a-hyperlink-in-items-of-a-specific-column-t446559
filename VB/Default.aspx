<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function ShowPopup(s, notes, fullname) {
            popup.Hide();
            popup.SetContentHtml(notes);
            popup.SetHeaderText('Notes for ' + fullname);
            popup.ShowAtElement(s.GetMainElement());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxListBox ID="MyListBox" runat="server" DataSourceID="AccessDataSource1" Height="225"
            ValueField="EmployeeID" ValueType="System.Int32">
            <Columns>
                <dx:ListBoxColumn FieldName="FirstName"></dx:ListBoxColumn>
                <dx:ListBoxColumn FieldName="LastName">
                </dx:ListBoxColumn>
                <dx:ListBoxColumn FieldName="Notes">
                    <CellTemplate>
                        <dx:ASPxHyperLink ID="NotesHyperLink" runat="server" Text="More info..."
                            ClientSideEvents-Click='<%#GetClickHandler()%>'>
                        </dx:ASPxHyperLink>
                    </CellTemplate>
                </dx:ListBoxColumn>
            </Columns>
        </dx:ASPxListBox>
        <dx:ASPxPopupControl ID="DescriptionPopup" runat="server" ClientInstanceName="popup"
            PopupHorizontalAlign="OutsideRight">
        </dx:ASPxPopupControl>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Notes] FROM [Employees]">
        </asp:AccessDataSource>
    </form>
</body>
</html>