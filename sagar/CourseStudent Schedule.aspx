<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseStudent Schedule.aspx.cs" Inherits="sagar.CourseStudent_Schedule" MasterPageFile="~/Index.Master" %>

<asp:Content ID="CourseStudentSchedule" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="content-head list-group-item mt-2 mb-2">Course Student Schedule</h3>
    
    <h5 class="mt-3">&nbsp;Select Course</h5>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_NAME&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_NAME" DataValueField="COURSE_ID" AutoPostBack="True" CssClass="form-control mb-2">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT student_id, COURSE_ID, AVG(MARKs_OBTAINED) AS Total_Marks FROM MARKS GROUP BY COURSE_ID, student_id HAVING (COURSE_ID = :COURSE_ID) ORDER BY student_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="COURSE_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table">
        <Columns>
            <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" SortExpression="STUDENT_ID" HeaderStyle-CssClass="table-dark" />
            <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" HeaderStyle-CssClass="table-dark" />
            <asp:BoundField DataField="TOTAL_MARKS" HeaderText="TOTAL_MARKS" SortExpression="TOTAL_MARKS" HeaderStyle-CssClass="table-dark" />
        </Columns>
    </asp:GridView>

    <br />

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource3" CssClass="table">
        <Columns>
            <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" HeaderStyle-CssClass="table-dark" />
            <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" HeaderStyle-CssClass="table-dark" />
            <asp:BoundField DataField="ASSIGNMENT_ID" HeaderText="ASSIGNMENT_ID" SortExpression="ASSIGNMENT_ID" HeaderStyle-CssClass="table-dark" />
            <asp:BoundField DataField="MARKS_OBTAINED" HeaderText="MARKS_OBTAINED" SortExpression="MARKS_OBTAINED" HeaderStyle-CssClass="table-dark" />
            <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" HeaderStyle-CssClass="table-dark" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT s.student_Id, s.STUDENT_NAME, m.ASSIGNMENT_ID, m.MARKS_OBTAINED, m.COURSE_ID FROM MARKS m, STUDENT s WHERE m.STUDENT_ID = s.STUDENT_ID AND (m.COURSE_ID = :COURSE_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="COURSE_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>