<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherStudent Mapping.aspx.cs" Inherits="sagar.TeacherStudent_Mapping" MasterPageFile="~/Index.Master" %>

<asp:Content ID="TeacherStudentMapping" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="content-head list-group-item mt-2 mb-2">Teacher Student Mapping</h3>
    <h5 class="mt-3">&nbsp;Select Teacher</h5>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="STAFF_NAME" DataValueField="STAFF_ID" AutoPostBack="True" CssClass="form-control mb-2">
        </asp:DropDownList>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="TEACHER_NAME" HeaderText="TEACHER_NAME" SortExpression="TEACHER_NAME" HeaderStyle-CssClass="table-dark" />
                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" HeaderStyle-CssClass="table-dark" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;STAFF_ID&quot;, &quot;STAFF_NAME&quot; FROM &quot;STAFF&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_NAME AS teacher_name, STUDENT.STUDENT_NAME AS Student_Name FROM STAFF, STAFFSTUDENT, STUDENT WHERE STAFF.STAFF_ID = STAFF.STAFF_ID AND STAFFSTUDENT.STAFF_ID = STAFF.STAFF_ID AND STUDENT.STUDENT_ID = STAFFSTUDENT.STUDENT_ID AND STAFF.STAFF_ID = :staff_ID">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="staff_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
