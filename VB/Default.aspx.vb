Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
    Protected Function GetClickHandler() As String
        Dim notes As String = Eval("Notes").ToString()
        Dim fullName As String = String.Format("{0} {1}", Eval("FirstName"), Eval("LastName"))
        Return "function (s, e) { ShowPopup(s, '" & notes & "', '" & fullName & "'); }"
    End Function
End Class