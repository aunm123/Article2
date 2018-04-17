<%--
  Created by IntelliJ IDEA.
  User: tim
  Date: 2018/4/17
  Time: 下午10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String activePage = pageContext.getAttribute("activePage").toString();
    System.out.println(activePage.equals("home")?"active":"");

    String homeactive = activePage.equals("home")?"active":"";
    String categoryactive = activePage.equals("category")?"active":"";

    String userListactive = activePage.equals("userlist")?"active":"";
    String userpointactive = activePage.equals("userpoint")?"active":"";
    String user_active = ((userListactive.length()>0) || (userpointactive.length()>0))?"active":"collapsed";

%>
<!-- LEFT SIDEBAR -->
<div id="sidebar-nav" class="sidebar">
    <div class="sidebar-scroll">
        <nav>
            <ul class="nav">
                <li>
                    <a href="../admin/index.jsp" class="<%=homeactive%>">
                        <i class="lnr lnr-home"></i>
                        <span>主页</span>
                    </a>
                </li>
                <li>
                    <a href="#user-col" data-toggle="collapse" class="<%=user_active%>">
                        <i class="lnr lnr-file-empty"></i>
                        <span>用户管理</span> <i class="icon-submenu lnr lnr-chevron-left"></i>
                    </a>
                    <div id="user-col" class="collapse <%=(user_active.equals("active")?"in":"")%>">
                        <ul class="nav">
                            <li><a href="../admin/userList_tab.jsp" class="<%=userListactive%>">用户列表</a></li>
                            <li><a href="../admin/userpoint_tab.jsp" class="<%=userpointactive%>">用户权限管理</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="../admin/category.jsp" class="<%=categoryactive%>">
                        <i class="lnr lnr-chart-bars"></i>
                        <span>分类列表</span>
                    </a>
                </li>
                <li>
                    <a href="../admin/panels.jsp" class="">
                        <i class="lnr lnr-cog"></i>
                        <span>Panels</span>
                    </a>
                </li>
                <li>
                    <a href="../admin/notifications.jsp" class="">
                        <i class="lnr lnr-alarm"></i>
                        <span>Notifications</span>
                    </a>
                </li>
                <li>
                    <a href="#subPages" data-toggle="collapse" class="collapsed">
                        <i class="lnr lnr-file-empty"></i>
                        <span>Pages</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPages" class="collapse ">
                        <ul class="nav">
                            <li><a href="../admin/page-profile.html" class="">Profile</a></li>
                            <li><a href="../admin/page-login.html" class="">Login</a></li>
                            <li><a href="../admin/page-lockscreen.html" class="">Lockscreen</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="../admin/tables.jsp" class="">
                        <i class="lnr lnr-dice"></i>
                        <span>Tables</span>
                    </a>
                </li>
                <li>
                    <a href="../admin/typography.jsp" class="">
                        <i class="lnr lnr-text-format"></i>
                        <span>Typography</span>
                    </a>
                </li>
                <li>
                    <a href="../admin/icons.jsp" class="">
                        <i class="lnr lnr-linearicons"></i>
                        <span>Icons</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- END LEFT SIDEBAR -->
