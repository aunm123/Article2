function exeData(num, type) {
    loadData(num);
}

// 初始化
function loadpage() {

    $.jqPaginator('#pagination', {
        totalPages: 1,
        visiblePages: 7,
        currentPage: 1,
        first: '<li class="first"><a href="javascript:;">首页</a></li>',
        prev: '<li class="prev"><a href="javascript:;"><i class="arrow arrow2"></i>上一页</a></li>',
        next: '<li class="next"><a href="javascript:;">下一页<i class="arrow arrow3"></i></a></li>',
        last: '<li class="last"><a href="javascript:;">末页</a></li>',
        page: '<li class="page"><a href="javascript:;">{{page}}</a></li>',
        onPageChange: pageChange,
    });
}

function pageChange(num, type) {
    if (type === "change") {
        exeData(num, type);
    }
}

$(function () {
    loadData(1);
    loadpage();
});


function getTableRow(item,cateName) {

    var hostname = "http://"+location.hostname;
    if(/^http/.test(item.icon)) {hostname = "";}
    let icon = item.icon === null? "":`<img style="height: 120px;" src="${hostname}${item.icon}"/>`;

    let tableRow = `<tr class="">
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td>${item.des}</td>
                            <td style="text-align: center">${icon}</td>
                            <td>${cateName}</td>
                            <td style="text-align: right;">
                                <button type="button" class="btn btn-success"
                                        onclick="showEditModel(${item.id})">
                                    编辑
                                </button>
                                <button type="button" class="btn btn-danger" onclick="deletebyid(${item.id})">
                                    删除
                                </button>
                            </td>
                        </tr>`;
    return tableRow
}

function getMoviceTableRow(item,cateName) {

    var hostname = "http://"+location.hostname;
    if(/^http/.test(item.icon)) {hostname = "";}
    let icon = item.icon === null? "":`<img style="height: 120px;" src="${hostname}${item.icon}"/>`;

    let tableRow = `<tr class="">
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td style="text-align: center">${icon}</td>
                            <td>${cateName}</td>
                            <td style="text-align: right;">
                                <button type="button" class="btn btn-success"
                                        onclick="showEditModel(${item.id})">
                                    编辑
                                </button>
                                <button type="button" class="btn btn-danger" onclick="deletebyid(${item.id})">
                                    删除
                                </button>
                            </td>
                        </tr>`;
    return tableRow
}