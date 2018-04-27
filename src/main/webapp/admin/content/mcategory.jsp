<%--
  Created by IntelliJ IDEA.
  User: tim
  Date: 2018/4/18
  Time: 下午1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:directive.page import="org.springframework.web.context.WebApplicationContext"/>
<%@ page import="java.util.List" %>
<%@ page import="com.service.MCategoryService" %>
<%@ page import="com.entity.MCategory" %>

<%
    WebApplicationContext context = (WebApplicationContext) this.getServletConfig().getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);

    MCategoryService mCategoryService = context.getBean(MCategoryService.class);
    List<MCategory> mCategories = mCategoryService.list();
%>

<script type="text/javascript">
    $(function () {
        $('.tree').treegrid();
    });

    function deletebyid(cid) {
        var r = confirm("你确定删除？");
        if (r === true) {
            $.ajax({
                url: "/mcategory/deleteByid",
                data: {mcategoryid: cid},
                success: function () {
                    window.location.reload();
                }
            })
        }
        else {}
    }

    function showEditModel(cid) {
        cleanEditForm();
        $.ajax({
            url: "/mcategory/find",
            data: {mcategoryid: cid},
            success: function (mcategory) {
                console.log(mcategory);
                $('#recipient-name').val(mcategory.name);
                $('#recipient-des').val(mcategory.des);
                $('#recipient-id').val(mcategory.id);
                $('#myModal').modal({});
            }
        })
    }

    function addEditModel() {
        cleanEditForm();
        $('#myModal').modal({})
    }
    function cleanEditForm() {
        $('#model-form input').val("");
    }
</script>
<style type="text/css">
    .panel-body td {
        line-height: 33px !important;
    }

    .td-detail {
        text-align: center;
    }
</style>

<div class="main-content">
    <div class="container-fluid">
        <h3 class="page-title">分类列表</h3>
        <div class="panel">
            <div class="panel-heading">
                <div>
                    <button type="button" class="btn btn-success" onclick="addEditModel()">添加</button>
                </div>
            </div>
            <div class="panel-body">
                <table class="tree table table-bordered table-striped table-condensed">

                    <% for (MCategory tempC : mCategories) {
                        String tempParent = tempC.getParentid() == 0 ? "" : "treegrid-parent-" + tempC.getParentid();
                    %>
                    <tr class="treegrid-<%=tempC.getId()%> <%=tempParent%>">
                        <td><%=tempC.getName()%>
                        </td>
                        <td class="td-detail"><%=tempC.getDes()%></td>
                        <td style="text-align: right;">
                            <button type="button" class="btn btn-success" onclick="showEditModel(<%=tempC.getId()%>)">
                                编辑
                            </button>
                            <button type="button" class="btn btn-danger" onclick="deletebyid(<%=tempC.getId()%>)">
                                删除
                            </button>
                        </td>
                    </tr>
                    <%} %>

                </table>
            </div>
        </div>
    </div>
</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" onsubmit="return " role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form id="model-form" action="/mcategory/saveOrUpdate" method="post">
            <input hidden type="text" name="id" id="recipient-id" />
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">编辑分类</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">分类名称</label>
                            <input type="text" class="form-control" name="name" id="recipient-name">
                        </div>
                        <div class="form-group">
                            <label for="recipient-des" class="control-label">分类描述</label>
                            <input type="text" class="form-control" name="des" id="recipient-des">
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label for="recipient-parent" class="control-label">父分类</label>--%>
                            <%--<select class="form-control" name="parentid" id="recipient-parent">--%>
                                <%--<option value="0">根目录</option>--%>
                                <%--<% for (MCategory tempC : mCategories) {--%>
                                    <%--String tempStr = "";--%>
                                    <%--for (int j = 0; j < tempC.getLevel(); j++) {--%>
                                        <%--tempStr += "---";--%>
                                    <%--}--%>
                                <%--%>--%>
                                <%--<option value="<%=tempC.getId()%>"><%=tempStr + tempC.getName()%>--%>
                                <%--</option>--%>
                                <%--<%} %>--%>

                            <%--</select>--%>
                        <%--</div>--%>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
