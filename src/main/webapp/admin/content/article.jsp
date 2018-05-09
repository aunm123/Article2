<%@ page import="org.springframework.web.context.WebApplicationContext" %>
<%@ page import="com.service.ArticleService" %>
<%@ page import="com.entity.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.service.CategoryService" %>
<%@ page import="com.entity.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    WebApplicationContext context = (WebApplicationContext) this.getServletConfig().getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
    CategoryService categoryService = context.getBean(CategoryService.class);
    List<Category> categories = categoryService.list();
%>

<script type="text/javascript">
    var editor = null;
    var allCategory = [];



    $(function () {
        // 编辑的页面初始化
        $("#recipient-icon").upload();
        var E = window.wangEditor;
        editor = new E('#recipient-content');
        editor.customConfig.uploadImgServer = 'file/upload';
        editor.customConfig.uploadFileName = 'file';
        editor.customConfig.uploadImgHooks = {
            customInsert: function (insertImg, result, editor) {
                var datas = result.data;
                datas.forEach(function (tempurl) {
                    console.log(tempurl);
                    insertImg(tempurl)
                })
            }
        }
        editor.create();

        let category = getUrlParam("category");
        let tempStr = '#selectcid option[value=' + category + ']';
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
                url: "/article/deleteByid",
                data: {articleid: cid},
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
            url: "/article/find",
            data: {articleid: cid},
            success: function (article) {
                $('#recipient-name').val(article.name);
                $('#recipient-des').val(article.description);
                $('#recipient-id').val(article.id);
                var tempStr = '#recipient-categoryId option[value=' + article.categoryId + ']';
                $(tempStr)[0].selected = true;
                $('#myModal').modal({});
                if (editor) {
                    editor.txt.html(article.content);
                    setTimeout(function () {
                        $('.w-e-text').scrollTop(0);
                    },300)
                }
                $('.upload.one .item.success').attr("style", "background-image: url(" + article.icon + ");")
                $('input[name=icon]').val(article.icon);
            }
        })
    }

    function addEditModel() {
        cleanEditForm();
        $('#myModal').modal({})
    }

    function cleanEditForm() {
        $('#model-form input').val("");
        let tempStr = '#recipient-categoryId option';
        $(tempStr)[0].selected = true;
        $('.upload.one .item.success').attr("style", "background-image: url();")
        $('input[name=icon]').val("");
        if (editor) {
            editor.txt.html("")
        }
        let category = getUrlParam("category");
        $('#recipient-cid').val(category);
    }

    var pageSize = 10.0;
    function loadData(num) {
        let category = getUrlParam("category");
        $.ajax({
            url: "/article/listWithPage",
            data: {page: num , pageSize: pageSize, categoryid: category},
            success: function (artRes) {
                $.ajax({
                    url: "/category/list",
                    data: {},
                    success: function (res) {
                        allCategory = res;
                        tableDataInit(artRes.list);
                        console.log(artRes);
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
        listData.forEach(function (item) {
            let tableRow = getTableRow(item,tempCa[item.categoryId]);
            result +=tableRow
        });
        $('#tb').html(result);
    }

    function cateSelectChange() {
        let selectText = $("#selectcid").val();
        window.location.href = "/admin/article_tab.jsp?category="+selectText;
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
        <h3 class="page-title">文章列表</h3>
        <div class="panel">
            <div class="panel-heading">
                <div style="display: flex;">
                    <button type="button" class="btn btn-success" onclick="addEditModel()">添加</button>
                    <select id="selectcid" class="form-control cate-select" onchange="cateSelectChange()">
                        <optgroup value="0" label="根目录">
                            <% for (Category tempC : categories) {
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
                            <th>简介</th>
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
        <form id="model-form" action="/article/saveOrUpdate" method="post">
            <input hidden type="text" name="id" id="recipient-id"/>
            <input hidden type="text" name="cid" id="recipient-cid"/>
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">编辑文章</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">文章标题</label>
                            <input type="text" class="form-control" name="name" id="recipient-name">
                        </div>
                        <div class="form-group">
                            <label for="recipient-des" class="control-label">文章简介</label>
                            <input type="text" class="form-control" name="description" id="recipient-des">
                        </div>
                        <div class="form-group">
                            <label for="recipient-icon" class="control-label">文章缩略图</label>
                            <div class="upload one empty"
                                 data-file="file"
                                 data-name="icon"
                                 data-value="/images/noimage.png"
                                 action="/file/iconUpload"
                                 data-num="1"
                                 id="recipient-icon"
                                 data-type="png,jpg,jpeg,gif"
                            >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recipient-categoryId" class="control-label">文章分类</label>
                            <select class="form-control" name="categoryId" id="recipient-categoryId">
                                <optgroup label="根目录">
                                    <% for (Category tempC : categories) {
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
                            <label for="recipient-content" class="control-label">文章内容</label>
                            <div id="recipient-content">
                            </div>
                            <input hidden type="text" name="content" id="content-hidden"/>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="submitForm()">提交</button>
                </div>
            </div><!-- /.modal-content -->
        </form>
    </div><!-- /.modal -->
</div>
<script type="text/javascript">
    function submitForm() {
        $('#content-hidden').val(editor.txt.html());
        $('#model-form').submit();
    }
</script>