<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
    <div class="pull-left">
        <div class="form-group form-inline">
            总共${pb.pages} 页，共${pb.total} 条数据。 每页
            <select class="form-control">
                <option ${pb.pageSize=='2'?"selected":""}>2</option>
                <option ${pb.pageSize=='4'?"selected":""}>4</option>
                <option ${pb.pageSize=='8'?"selected":""}>8</option>
                <option ${pb.pageSize=='16'?"selected":""}>16</option>
                <option ${pb.pageSize=='32'?"selected":""}>32</option>
            </select> 条
        </div>
    </div>

    <div class="box-tools pull-right">
        <ul class="pagination">
            <%--如果是第一页就不显示首页和上一页的字眼--%>
            <c:if test="${pb.pageNum!=1}">
                <li>
                    <a href="javascript:toPage('1')" aria-label="Previous">首页</a>
                </li>
                <!--上一页就是当前页减一-->
                <li><a href="javascript:toPage('${pb.pageNum-1}')">上一页</a></li>
            </c:if>
                <!--遍历页码，拿到开始页码和结束页码-->
            <c:forEach begin="${pb.navigateFirstPage}" step="1" end="${pb.navigateLastPage}"  var="page">
                <li ><a href="javascript:toPage('${page}')" style="color:${pb.pageNum==page?'gold':''}">${page}</a></li>
            </c:forEach>

            <%--不是最后一页就显示下一页和尾页--%>
            <c:if test="${pb.pageNum!=pb.pages}">
                <li><a href="javascript:toPage('${pb.pageNum+1}')">下一页</a></li>
                <li>
                    <a href="javascript:toPage('${pb.pages}')" aria-label="Next">尾页</a>
                </li>
            </c:if>
        </ul>
    </div>
    <%--点击首页 上一页 下一页 尾页 该form提交 传递pageNum--%>
    <form method="post" id="formId" action="${param.pageUrl}">
        <input type="text" name="pageNum" id="pageNum"/>
        <input type="text" name="pageSize" id="pageSize"/>
    </form>
    <script type="text/javascript">
        function toPage(value) {
            //console(value);
            //获取到传递过来的值，赋值给这个表单，让表单传递数据到Controller，就可以进行数据查询了
            $("#pageNum").val(value);
            //提交我们的表单
            $("#formId").submit();
        }
    </script>
</div>
</body>
</html>
