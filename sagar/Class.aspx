<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Class.aspx.cs" Inherits="sagar.Class" MasterPageFile="~/Index.Master" %>

<asp:Content ID="Class" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="content-head list-group-item mt-2 mb-2">Class</h3>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID,CLASS_ID" DataSourceID="SqlDataSource1" CssClass="table">
            <Columns>
                <asp:BoundField DataField="CLASS_ID" HeaderText="CLASS_ID" ReadOnly="True" SortExpression="CLASS_ID" HeaderStyle-CssClass="table-dark" />
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" HeaderStyle-CssClass="table-dark" />
                <asp:BoundField DataField="CLASS_TYPE" HeaderText="CLASS_TYPE" SortExpression="CLASS_TYPE" HeaderStyle-CssClass="table-dark" />
                <asp:BoundField DataField="TIME" HeaderText="TIME" SortExpression="TIME" HeaderStyle-CssClass="table-dark" />
                <asp:BoundField DataField="DAY" HeaderText="DAY" SortExpression="DAY" HeaderStyle-CssClass="table-dark" />
                <asp:BoundField DataField="ROOM" HeaderText="ROOM" SortExpression="ROOM" HeaderStyle-CssClass="table-dark" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" HeaderStyle-CssClass="table-dark" />


            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;CLASS&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;CLASS_ID&quot; = :CLASS_ID" InsertCommand="INSERT INTO &quot;CLASS&quot; (&quot;COURSE_ID&quot;, &quot;CLASS_TYPE&quot;, &quot;CLASS_ID&quot;, &quot;TIME&quot;, &quot;DAY&quot;, &quot;ROOM&quot;) VALUES (:COURSE_ID, :CLASS_TYPE, :CLASS_ID, :TIME, :DAY, :ROOM)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;CLASS_TYPE&quot;, &quot;CLASS_ID&quot;, &quot;TIME&quot;, &quot;DAY&quot;, &quot;ROOM&quot; FROM &quot;CLASS&quot;" UpdateCommand="UPDATE &quot;CLASS&quot; SET &quot;CLASS_TYPE&quot; = :CLASS_TYPE, &quot;TIME&quot; = :TIME, &quot;DAY&quot; = :DAY, &quot;ROOM&quot; = :ROOM WHERE &quot;COURSE_ID&quot; = :COURSE_ID AND &quot;CLASS_ID&quot; = :CLASS_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="CLASS_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="CLASS_TYPE" Type="String" />
                <asp:Parameter Name="CLASS_ID" Type="String" />
                <asp:Parameter Name="TIME" Type="String" />
                <asp:Parameter Name="DAY" Type="String" />
                <asp:Parameter Name="ROOM" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CLASS_TYPE" Type="String" />
                <asp:Parameter Name="TIME" Type="String" />
                <asp:Parameter Name="DAY" Type="String" />
                <asp:Parameter Name="ROOM" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="CLASS_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID,CLASS_ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                COURSE_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_NAME" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>' CssClass="form-control">
                </asp:DropDownList>
                <br />
                CLASS_TYPE:
                <asp:TextBox ID="CLASS_TYPETextBox" runat="server" Text='<%# Bind("CLASS_TYPE") %>' CssClass="form-control" />
                <br />
                CLASS_ID:
                <asp:TextBox ID="CLASS_IDTextBox" runat="server" Text='<%# Bind("CLASS_ID") %>' CssClass="form-control" />
                <br />
                TIME:
                <asp:TextBox ID="TIMETextBox" runat="server" Text='<%# Bind("TIME") %>' CssClass="form-control" />
                <br />
                DAY:
                <asp:TextBox ID="DAYTextBox" runat="server" Text='<%# Bind("DAY") %>' CssClass="form-control" />
                <br />
                ROOM:
                <asp:TextBox ID="ROOMTextBox" runat="server" Text='<%# Bind("ROOM") %>' CssClass="form-control" />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
            </InsertItemTemplate>
            <ItemTemplate>

                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-primary" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_NAME&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
</asp:Content>