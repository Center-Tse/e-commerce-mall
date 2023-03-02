<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>


<script src="js/index.js"></script>
<header class="index-top">
    <a href="/" class="logo">
        <img src="img/logo.png">
    </a>
    <div class="search">
        <form action="search">
            <input type="text" placeholder="搜索天猫商品/品牌/店铺" name="keyword">
            <button class="search-button" type="submit">搜索</button>
        </form>
        <div class="search-below">
            <ul>
                <c:forEach items="${categories}" var="c" varStatus="vs">
                    <c:if test="${vs.count>=1 and vs.count<=8}">
                        <li><a href="category?cid=${c.id}">${c.name}</a></li>
                    </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>
</header>

<style>
    .search {
        position: relative;
    }

    .search-below {
        display: none;
        position: absolute;
        z-index: 999;
        background: #fff;
        border: 1px solid #ddd;
        width: 400px;
        margin-top: 3px;
    }

    .search-below ul {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .search-below ul li {
        display: inline-block;
        width: 100px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        border-right: 1px solid #ddd;
    }

    .search-below ul li:last-child {
        border-right: none;
    }

    .search input[type="text"] {
        width: 400px;
        height: 30px;
        padding: 0 10px;
        border: 1px solid #ccc;
    }

    .search-button {
        display: inline-block;
        width: 60px;
        height: 32px;
        border: none;
        background: #ff3c3c;
        color: #fff;
        font-size: 14px;
        cursor: pointer;
    }

    .search input[type="text"]:focus + .search-button {
        background: #c33;
    }

    .search input[type="text"]:focus + .search-button + .search-below {
        display: block;
    }
</style>

<script>
    // 点击搜索框外部隐藏下拉菜单
    $(document).click(function (event) {
        if (!$(event.target).closest('.search').length) {
            $('.search-below').hide();
        }
    });
</script>
