<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="sagar.Student" MasterPageFile="~/Index.Master" %>

<asp:Content ID="Student" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="content-head list-group-item mt-2 mb-2">Student</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" CssClass="table">
            <Columns>
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" HeaderStyle-CssClass="table-dark" >
                <HeaderStyle CssClass="table-dark" />
                </asp:BoundField>
                <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" HeaderStyle-CssClass="table-dark" >
                <HeaderStyle CssClass="table-dark" />
                </asp:BoundField>
                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" HeaderStyle-CssClass="table-dark" >
                <HeaderStyle CssClass="table-dark" />
                </asp:BoundField>
                <asp:BoundField DataField="CONTACT_NO" HeaderText="CONTACT_NO" SortExpression="CONTACT_NO" HeaderStyle-CssClass="table-dark" >
                <HeaderStyle CssClass="table-dark" />
                </asp:BoundField>
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" HeaderStyle-CssClass="table-dark" >
                <HeaderStyle CssClass="table-dark" />
                </asp:BoundField>
                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" HeaderStyle-CssClass="table-dark" >
                <HeaderStyle CssClass="table-dark" />
                </asp:BoundField>
                <asp:BoundField DataField="COMPLETED_YEAR" HeaderText="COMPLETED_YEAR" SortExpression="COMPLETED_YEAR" HeaderStyle-CssClass="table-dark" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderStyle-CssClass="table-dark" />
            </Columns>
        </asp:GridView>
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;ADDRESS&quot;, &quot;CONTACT_NO&quot;, &quot;EMAIL&quot;, &quot;DOB&quot;, &quot;COMPLETED_YEAR&quot;) VALUES (:STUDENT_ID, :STUDENT_NAME, :ADDRESS, :CONTACT_NO, :EMAIL, :DOB, :COMPLETED_YEAR)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;ADDRESS&quot;, &quot;CONTACT_NO&quot;, &quot;EMAIL&quot;, &quot;DOB&quot;, &quot;COMPLETED_YEAR&quot; FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;ADDRESS&quot; = :ADDRESS, &quot;CONTACT_NO&quot; = :CONTACT_NO, &quot;EMAIL&quot; = :EMAIL, &quot;DOB&quot; = :DOB, &quot;COMPLETED_YEAR&quot; = :COMPLETED_YEAR WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STUDENT_ID" Type="String" />
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="CONTACT_NO" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="COMPLETED_YEAR" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="ADDRESS" Type="String" />
                <asp:Parameter Name="CONTACT_NO" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="DOB" Type="String" />
                <asp:Parameter Name="COMPLETED_YEAR" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
           
           
            <InsertItemTemplate>
                STUDENT_ID:
                <asp:TextBox ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' CssClass="form-control" />
                <br />
                STUDENT_NAME:
                <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' CssClass="form-control" />
                <br />
                ADDRESS:
                <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' CssClass="form-control" />
                <br />
                CONTACT_NO:
                <asp:TextBox ID="CONTACT_NOTextBox" runat="server" Text='<%# Bind("CONTACT_NO") %>' CssClass="form-control" />
                <br />
                EMAIL:
                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' CssClass="form-control" />
                <br />
                DOB:
                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' CssClass="form-control" />
                <br />
                COMPLETED_YEAR:
                <asp:TextBox ID="COMPLETED_YEARTextBox" runat="server" Text='<%# Bind("COMPLETED_YEAR") %>' CssClass="form-control" />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
            </InsertItemTemplate>
            <ItemTemplate>
               
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-primary" />
            </ItemTemplate>
        </asp:FormView>
</asp:Content>