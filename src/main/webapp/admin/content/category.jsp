<%--
  Created by IntelliJ IDEA.
  User: tim
  Date: 2018/4/18
  Time: 下午1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
    $(function () {
        $('.tree').treegrid();
    })
</script>

<div class="main-content">
    <div class="container-fluid">
        <h3 class="page-title">分类列表</h3>
        <div class="panel">
            <div class="panel-heading">
                <div>
                    <button type="button" class="btn btn-success">添加</button>
                    <button type="button" class="btn btn-danger">删除</button>
                </div>
            </div>
            <div class="panel-body">
                <table class="tree table table-bordered table-striped table-condensed">
                    <tr class="treegrid-1">
                        <td>Root node</td>
                        <td>Additional info</td>
                        <td style="text-align: right;">
                            <button type="button" class="btn btn-success">编辑</button>
                            <button type="button" class="btn btn-danger">删除</button>
                        </td>
                    </tr>
                    <tr class="treegrid-2 treegrid-parent-1">
                        <td>Node 1-1</td>
                        <td>Additional info</td>
                        <td style="text-align: right;">
                            <button type="button" class="btn btn-success">编辑</button>
                            <button type="button" class="btn btn-danger">删除</button>
                        </td>
                    </tr>
                    <tr class="treegrid-3 treegrid-parent-1">
                        <td>Node 1-2</td>
                        <td>Additional info</td>
                        <td style="text-align: right;">
                            <button type="button" class="btn btn-success">编辑</button>
                            <button type="button" class="btn btn-danger">删除</button>
                        </td>
                    </tr>
                    <tr class="treegrid-4 treegrid-parent-3">
                        <td>Node 1-2-1</td>
                        <td>Additional info</td>
                        <td style="text-align: right;">
                            <button type="button" class="btn btn-success">编辑</button>
                            <button type="button" class="btn btn-danger">删除</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
