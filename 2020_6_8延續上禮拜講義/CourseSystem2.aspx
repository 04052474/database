<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CourseSystem2.aspx.cs" Inherits="CourseSystem2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" Orientation="Horizontal" StaticSubMenuIndent="10px" OnMenuItemClick="Menu1_MenuItemClick">
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <Items>
                    <asp:MenuItem Selected="True" Text="設定系碼" Value="0"></asp:MenuItem>
                    <asp:MenuItem Text="課程管理" Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="學生管理" Value="2"></asp:MenuItem>
                    <asp:MenuItem Text="選課作業" Value="3"></asp:MenuItem>
                    <asp:MenuItem Text="查詢選課" Value="4"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#507CD1" />
            </asp:Menu>
        </div>
        <asp:Panel ID="Panel1" runat="server" Height="500px" Width="1476px" BackColor="#CCCCCC">
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    設定系碼
                <br />
                系碼<asp:TextBox ID="TextBox1" runat="server" Width="54px"></asp:TextBox>
                &nbsp; 系名<asp:TextBox ID="TextBox2" runat="server" Width="77px"></asp:TextBox>
                &nbsp;&nbsp; 系主任<asp:TextBox ID="TextBox3" runat="server" Width="47px"></asp:TextBox>
                &nbsp;&nbsp; <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="新增" />
                <br />
                <br />
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="系碼" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="系碼" HeaderText="系碼" ReadOnly="True" SortExpression="系碼" />
                            <asp:BoundField DataField="系名" HeaderText="系名" SortExpression="系名" />
                            <asp:BoundField DataField="系主任" HeaderText="系主任" SortExpression="系主任" />
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:選課系統ConnectionString %>" DeleteCommand="DELETE FROM [科系代碼資料表] WHERE [系碼] = @系碼" InsertCommand="INSERT INTO [科系代碼資料表] ([系碼], [系名], [系主任]) VALUES (@系碼, @系名, @系主任)" SelectCommand="SELECT [系碼], [系名], [系主任] FROM [科系代碼資料表]" UpdateCommand="UPDATE [科系代碼資料表] SET [系名] = @系名, [系主任] = @系主任 WHERE [系碼] = @系碼">
                        <DeleteParameters>
                            <asp:Parameter Name="系碼" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="系碼" Type="String" />
                            <asp:Parameter Name="系名" Type="String" />
                            <asp:Parameter Name="系主任" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="系名" Type="String" />
                            <asp:Parameter Name="系主任" Type="String" />
                            <asp:Parameter Name="系碼" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    課程管理
                <br />
                課號<asp:TextBox ID="TextBox4" runat="server" Width="54px"></asp:TextBox>
                &nbsp; 課名<asp:TextBox ID="TextBox5" runat="server" Width="77px"></asp:TextBox>
                &nbsp;&nbsp; 學分數<asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>&nbsp;&nbsp; 
                    必選修<asp:RadioButton ID="RadioButton1" runat="server" GroupName="Subject" Text="必" />
                &nbsp;<asp:RadioButton ID="RadioButton2" runat="server" GroupName="Subject" Text="選" />
                &nbsp;&nbsp; <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="新增" />
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="課號" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="課號" HeaderText="課號" ReadOnly="True" SortExpression="課號" />
                        <asp:BoundField DataField="課名" HeaderText="課名" SortExpression="課名" />
                        <asp:BoundField DataField="學分數" HeaderText="學分數" SortExpression="學分數" />
                        <asp:BoundField DataField="必選修" HeaderText="必選修" SortExpression="必選修" />
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:選課系統ConnectionString %>" DeleteCommand="DELETE FROM [課程資料表] WHERE [課號] = @課號" InsertCommand="INSERT INTO [課程資料表] ([課號], [課名], [學分數], [必選修]) VALUES (@課號, @課名, @學分數, @必選修)" SelectCommand="SELECT * FROM [課程資料表]" UpdateCommand="UPDATE [課程資料表] SET [課名] = @課名, [學分數] = @學分數, [必選修] = @必選修 WHERE [課號] = @課號">
                        <DeleteParameters>
                            <asp:Parameter Name="課號" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="課號" Type="String" />
                            <asp:Parameter Name="課名" Type="String" />
                            <asp:Parameter Name="學分數" Type="Int32" />
                            <asp:Parameter Name="必選修" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="課名" Type="String" />
                            <asp:Parameter Name="學分數" Type="Int32" />
                            <asp:Parameter Name="必選修" Type="String" />
                            <asp:Parameter Name="課號" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                 <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    學生管理
                <br />
                    學號<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    &nbsp;姓名<asp:TextBox ID="TextBox7" runat="server" Width="77px"></asp:TextBox>
                    &nbsp;科名<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="系名" DataValueField="系名">
                    </asp:DropDownList>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="新增" />
                    &nbsp;<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="修改" />
                    &nbsp;<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="刪除" />
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:選課系統ConnectionString %>" SelectCommand="SELECT [系名] FROM [學生系名查詢]"></asp:SqlDataSource>
                    <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="Page_Load">
                        <AlternatingRowStyle BackColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                <br />
                </asp:View>
                <asp:View ID="View4" runat="server">
                    選課作業
                <br />
                <br />
                </asp:View>
                <asp:View ID="View5" runat="server">
                    查詢選課
                <br />
                    請選擇學生<asp:DropDownList ID="DropDownList3" runat="server">
                    </asp:DropDownList>
                    &nbsp;<asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="查詢" />
                    <br />
                    <asp:GridView ID="GridView4" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                <br />
                </asp:View>
            </asp:MultiView>
        </asp:Panel>
    </form>
</body>
</html>
