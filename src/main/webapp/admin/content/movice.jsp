<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="java.util.List" %>
<%@ page import="com.service.MCategoryService" %>
<%@ page import="com.entity.MCategory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    WebApplicationContext context = (WebApplicationContext) this.getServletConfig().getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
    MCategoryService mCategoryService = context.getBean(MCategoryService.class);
    List<MCategory> mCategories = mCategoryService.list();
%>

<script type="text/javascript">
    var editor = null;
    var allCategory = [];



    $(function () {
        // 编辑的页面初始化
        $("#recipient-icon").upload();
        let mcategory = getUrlParam("mcategory");
        let tempStr = '#selectcid option[value=' + mcategory + ']';
        $(tempStr)[0].selected = true;
    });

    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r !== null) return unescape(r[2]); return 0; //返回参数值
    }

    function deletebyid(cid) {
        var r = confirm("你确定删除？");
        if (r === true) {
            $.ajax({
                url: "/movice/deleteByid",
                data: {moviceid: cid},
                success: function () {
                    window.location.reload();
                }
            })
        }
        else {
        }
    }

    function showEditModel(cid) {
        cleanEditForm();
        var hostname = "http://"+location.hostname+"/";
        $.ajax({
            url: "/movice/find",
            data: {moviceid: cid},
            success: function (movice) {
                $('#recipient-name').val(movice.name);
                $('#recipient-des').val(movice.header);
                $('#recipient-id').val(movice.id);
                $('#recipient-url').val(movice.url);
                var tempStr = '#recipient-categoryId option[value=' + movice.mcategoryId + ']';
                $(tempStr)[0].selected = true;
                $('#myModal').modal({});
                $('.upload.one .item.success').attr("style", "background-image: url(" + hostname + movice.icon + ");")
                $('input[name=icon]').val(movice.icon);
            }
        })
    }

    function addEditModel() {
        cleanEditForm();
        $('#myModal').modal({})
    }

    function cleanEditForm() {
        $('#model-form input').val("");
        var tempStr = '#recipient-categoryId option';
        $(tempStr)[0].selected = true;
        $('.upload.one .item.success').attr("style", "background-image: url();")
        $('input[name=icon]').val("");
        if (editor) {
            editor.txt.html("")
        }
        let mcategory = getUrlParam("mcategory");
        $('#recipient-cid').val(mcategory);
    }

    var pageSize = 10.0;
    function loadData(num) {
        let mcategory = getUrlParam("mcategory");
        $.ajax({
            url: "/movice/listWithPage",
            data: {page: num , pageSize: pageSize, mcategoryid: mcategory},
            success: function (artRes) {
                $.ajax({
                    url: "/mcategory/list",
                    data: {},
                    success: function (res) {
                        allCategory = res;
                        tableDataInit(artRes.list);
                        let tempTotal = Math.ceil(artRes.counts/pageSize);
                        $('#pagination').jqPaginator('option', {
                            totalPages: tempTotal===0?1:tempTotal,
                        });
                    }
                });
            }
        })
    }

    function tableDataInit(listData) {
        let result = "";
        let tempCa = [];
        allCategory.forEach(function (item) {
            tempCa[item.id] = item.name;
        });
        console.log(listData);
        listData.forEach(function (item) {
            let tableRow = getMoviceTableRow(item,tempCa[item.mcategoryId]);
            result +=tableRow
        });
        $('#tb').html(result);
    }

    function cateSelectChange() {
        var selectText = $("#selectcid").val();
        window.location.href = "/admin/movice_tab.jsp?mcategory="+selectText;
    }

</script>
<style type="text/css">
    .close.fileinput-remove {
        display: none;
    }
    .cate-select{
        height: 34px;
        width: auto;
        margin-left: 15px;
    }
</style>

<div class="main-content">
    <div class="container-fluid">
        <h3 class="page-title">电影列表</h3>
        <div class="panel">
            <div class="panel-heading">
                <div style="display: flex;">
                    <button type="button" class="btn btn-success" onclick="addEditModel()">添加</button>
                    <select id="selectcid" class="form-control cate-select" onchange="cateSelectChange()">
                        <optgroup value="0" label="根目录">
                            <% for (MCategory tempC : mCategories) {
                                String tempStr = "";
                                for (int j = 1; j < tempC.getLevel(); j++) {
                                    tempStr += "---";
                                }
                            %>
                                <option value="<%=tempC.getId()%>"><%=tempStr + tempC.getName()%></option>
                            <%} %>
                        </optgroup>

                    </select>
                </div>
            </div>
            <div class="panel-body">
                <form action="">
                    <table id="res-table" class="table table-bordered table-striped table-condensed">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>标题</th>
                            <th>缩略图</th>
                            <th>分类</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="tb">

                        </tbody>

                    </table>
                    <ul class="pagination" id="pagination"></ul>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" onsubmit="return " role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:800px">
        <form id="model-form" action="/movice/saveOrUpdate" method="post">
            <input hidden type="text" name="id" id="recipient-id"/>
            <input hidden type="text" name="cid" id="recipient-cid"/>
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">编辑电影</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">电影标题</label>
                            <input type="text" class="form-control" name="name" id="recipient-name">
                        </div>
                        <div class="form-group">
                            <label for="recipient-des" class="control-label">电影简介</label>
                            <input type="text" class="form-control" name="description" id="recipient-des">
                        </div>
                        <div class="form-group">
                            <label for="recipient-icon" class="control-label">电影缩略图</label>
                            <div class="upload one empty"
                                 data-file="file"
                                 data-name="icon"
                                 data-value="images/noimage.png"
                                 action="file/iconUpload"
                                 data-num="1"
                                 id="recipient-icon"
                                 data-type="png,jpg,jpeg,gif"
                            >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recipient-categoryId" class="control-label">电影分类</label>
                            <select class="form-control" name="mcategoryId" id="recipient-categoryId">
                                <optgroup label="根目录">
                                    <% for (MCategory tempC : mCategories) {
                                        String tempStr = "";
                                        for (int j = 1; j < tempC.getLevel(); j++) {
                                            tempStr += "---";
                                        }
                                    %>
                                        <option value="<%=tempC.getId()%>"><%=tempStr + tempC.getName()%></option>
                                    <%} %>
                                </optgroup>

                            </select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-url" class="control-label">电影URL</label>
                            <input type="text" class="form-control" name="url" id="recipient-url">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary" onclick="submitForm()">提交</button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>