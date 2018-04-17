<%--
  Created by IntelliJ IDEA.
  User: tim
  Date: 2018/4/17
  Time: 下午10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- LEFT SIDEBAR -->
<div id="sidebar-nav" class="sidebar">
    <div class="sidebar-scroll">
        <nav>
            <ul class="nav">
                <li>
                    <a href="index.jsp" class="active">
                        <i class="lnr lnr-home"></i>
                        <span>主页</span>
                    </a>
                </li>
                <li>
                    <a href="elements.jsp" class="">
                        <i class="lnr lnr-code"></i>
                        <span>Elements</span>
                    </a>
                </li>
                <li>
                    <a href="charts.jsp" class="">
                        <i class="lnr lnr-chart-bars"></i>
                        <span>Charts</span>
                    </a>
                </li>
                <li>
                    <a href="panels.jsp" class="">
                        <i class="lnr lnr-cog"></i>
                        <span>Panels</span>
                    </a>
                </li>
                <li>
                    <a href="notifications.jsp" class="">
                        <i class="lnr lnr-alarm"></i>
                        <span>Notifications</span>
                    </a>
                </li>
                <li>
                    <a href="#subPages" data-toggle="collapse" class="collapsed"><i class="lnr lnr-file-empty"></i>
                        <span>Pages</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
                    <div id="subPages" class="collapse ">
                        <ul class="nav">
                            <li><a href="page-profile.html" class="">Profile</a></li>
                            <li><a href="page-login.html" class="">Login</a></li>
                            <li><a href="page-lockscreen.html" class="">Lockscreen</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="tables.jsp" class="">
                        <i class="lnr lnr-dice"></i>
                        <span>Tables</span>
                    </a>
                </li>
                <li>
                    <a href="typography.jsp" class="">
                        <i class="lnr lnr-text-format"></i>
                        <span>Typography</span>
                    </a>
                </li>
                <li>
                    <a href="icons.jsp" class="">
                        <i class="lnr lnr-linearicons"></i>
                        <span>Icons</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- END LEFT SIDEBAR -->
