<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="sagar.Index1" MasterPageFile="~/Index.Master" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Home" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="content-head list-group-item mt-2 mb-2">Dashboard</h3>
    <div class="container">


        <div class="row mb-4">
            <div class="col-12 col-md-4 text-center border dash-card">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="Number Of Teachers" HeaderText="Number Of Teachers" SortExpression="Number Of Teachers" HeaderStyle-CssClass="dash-head" ItemStyle-CssClass="dash-body" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT COUNT(Staff_ID) AS &quot;Number Of Teachers&quot; FROM Staff"></asp:SqlDataSource>
                
            </div>

            <div class="col-12 col-md-4 text-center border dash-card">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="Number of Students" HeaderText="Number of Students" SortExpression="Number of Students" HeaderStyle-CssClass="dash-head" ItemStyle-CssClass="dash-body" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT COUNT(Student_ID) AS &quot;Number of Students&quot; FROM Student"></asp:SqlDataSource>
            </div>

            <div class="col-12 col-md-4 text-center border dash-card">
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="Number Of Courses" HeaderText="Number Of Courses" SortExpression="Number Of Courses" HeaderStyle-CssClass="dash-head" ItemStyle-CssClass="dash-body" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT COUNT(Course_ID) AS &quot;Number Of Courses&quot; FROM Course"></asp:SqlDataSource>
            </div>
        </div>


        <div class="row">
            <div class="col-6 pt-4 pl-4 border">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="COURSE_NAME" DataValueField="COURSE_ID" AutoPostBack="True" CssClass="form-control mb-2">
                </asp:DropDownList>

                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" Width="512px" OnLoad="Chart1_Load" Height="340px">
                    <series>
                        <asp:Series Name="Marks" XValueMember="STUDENT_ID" YValueMembers="TOTAL_MARKS" YValuesPerPoint="2" Legend="Legend1">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                    <Legends>
                        <asp:Legend Name="Legend1">
                        </asp:Legend>
                    </Legends>
                    <Titles>
                        <asp:Title Name="Title1" Text="Student Marks">
                        </asp:Title>
                    </Titles>
                </asp:Chart>

            </div>
            <div class="col-6 pt-4 pl-4 border">

                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource3" Width="510px" Height="405px">
                    <Series>
                        <asp:Series Legend="Legend1" Name="Number of students" XValueMember="COURSE_ID" YValueMembers="COUNT(STUDENT_ID)">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1">
                        </asp:Legend>
                    </Legends>
                    <Titles>
                        <asp:Title Name="Title" Text="Number of Students in Course">
                        </asp:Title>
                    </Titles>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT student_id, COURSE_ID, AVG(MARKs_OBTAINED) AS Total_Marks FROM MARKS GROUP BY COURSE_ID, student_id HAVING (COURSE_ID = :COURSE_ID) ORDER BY student_id">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="COURSE_ID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>

                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="select course_ID, count(student_ID) from marks group by course_ID"></asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;COURSE_ID&quot;, &quot;COURSE_NAME&quot; FROM &quot;COURSE&quot;"></asp:SqlDataSource>


                </div>
            </div>

  
        

    </div>
    
</asp:Content>