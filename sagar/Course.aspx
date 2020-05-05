<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="sagar.Course" MasterPageFile="~/Index.Master" %>

<asp:Content ID="Course" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="content-head list-group-item mt-2 mb-2">Course</h3>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1" CssClass="table">
            <Columns>
                
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" HeaderStyle-CssClass="table-dark" />
                <asp:BoundField DataField="LEADER_ID" HeaderText="LEADER_ID" SortExpression="LEADER_ID" HeaderStyle-CssClass="table-dark" />
                <asp:TemplateField HeaderText="Leader_name" HeaderStyle-CssClass="table-dark">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" Enabled="false" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSELEADER" DataValueField="LEADER_ID" SelectedValue='<%# Bind("LEADER_ID") %>'>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COURSE_NAME" HeaderText="COURSE_NAME" SortExpression="COURSE_NAME" HeaderStyle-CssClass="table-dark" />
                <asp:BoundField DataField="CREDIT_HOUR" HeaderText="CREDIT_HOUR" SortExpression="CREDIT_HOUR" HeaderStyle-CssClass="table-dark" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderStyle-CssClass="table-dark" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSE_ID&quot;, &quot;LEADER_ID&quot;, &quot;COURSE_NAME&quot;, &quot;CREDIT_HOUR&quot;) VALUES (:COURSE_ID, :LEADER_ID, :COURSE_NAME, :CREDIT_HOUR)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;LEADER_ID&quot;, &quot;COURSE_NAME&quot;, &quot;CREDIT_HOUR&quot; FROM &quot;COURSE&quot;" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;LEADER_ID&quot; = :LEADER_ID, &quot;COURSE_NAME&quot; = :COURSE_NAME, &quot;CREDIT_HOUR&quot; = :CREDIT_HOUR WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LEADER_ID" Type="String" />
                <asp:Parameter Name="COURSE_NAME" Type="String" />
                <asp:Parameter Name="CREDIT_HOUR" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LEADER_ID" Type="String" />
                <asp:Parameter Name="COURSE_NAME" Type="String" />
                <asp:Parameter Name="CREDIT_HOUR" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                COURSE_ID:
                <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
                <br />
                LEADER_ID:
                <asp:TextBox ID="LEADER_IDTextBox" runat="server" Text='<%# Bind("LEADER_ID") %>' />
                <br />
                COURSE_NAME:
                <asp:TextBox ID="COURSE_NAMETextBox" runat="server" Text='<%# Bind("COURSE_NAME") %>' />
                <br />
                CREDIT_HOUR:
                <asp:TextBox ID="CREDIT_HOURTextBox" runat="server" Text='<%# Bind("CREDIT_HOUR") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                COURSE_ID:
                <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' CssClass="form-control" />
                <br />
                LEADER_ID:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSELEADER" DataValueField="LEADER_ID" SelectedValue='<%# Bind("LEADER_ID") %>' CssClass="form-control">
                </asp:DropDownList>
                <br />
                COURSE_NAME:
                <asp:TextBox ID="COURSE_NAMETextBox" runat="server" Text='<%# Bind("COURSE_NAME") %>' CssClass="form-control" />
                <br />
                CREDIT_HOUR:
                <asp:TextBox ID="CREDIT_HOURTextBox" runat="server" Text='<%# Bind("CREDIT_HOUR") %>' CssClass="form-control" />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
            </InsertItemTemplate>
            <ItemTemplate>

                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-primary" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;LEADER_ID&quot;, &quot;COURSELEADER&quot; FROM &quot;COURSELEADER&quot;"></asp:SqlDataSource>
        
</asp:Content>