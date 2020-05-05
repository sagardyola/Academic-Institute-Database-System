<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherCourse Schedule.aspx.cs" Inherits="sagar.TeacherCourse_Schedule" MasterPageFile="~/Index.Master" %>

<asp:Content ID="TeacherCourseSchedule" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="content-head list-group-item mt-2 mb-2">Teacher Course Schedule</h3>
    <h5 class="mt-3">&nbsp;Select Course</h5>
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_NAME" DataValueField="COURSE_ID" AutoPostBack="True" CssClass="form-control mb-2">
            </asp:DropDownList>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table">
            <Columns>
                <asp:BoundField DataField="STAFF_NAME" HeaderText="STAFF_NAME" SortExpression="STAFF_NAME" HeaderStyle-CssClass="table-dark" />
                <asp:BoundField DataField="STAFF_EMAIL" HeaderText="STAFF_EMAIL" SortExpression="STAFF_EMAIL" HeaderStyle-CssClass="table-dark" />
                <asp:BoundField DataField="COURSE_NAME" HeaderText="COURSE_NAME" SortExpression="COURSE_NAME" HeaderStyle-CssClass="table-dark" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_NAME&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT STAFF.STAFF_NAME AS staff_name, STAFF.EMAIL AS staff_Email, COURSE.COURSE_NAME AS Course_Name FROM STAFF, COURSECLASSSTAFF, COURSE WHERE STAFF.STAFF_ID = COURSECLASSSTAFF.STAFF_ID AND COURSECLASSSTAFF.COURSE_ID = COURSE.COURSE_ID AND (STAFF.STAFF_ID = STAFF.STAFF_ID) AND (COURSE.COURSE_ID = :COURSE_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="COURSE_ID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
