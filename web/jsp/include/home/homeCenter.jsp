<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<section class="head-bar">
    <div class="c-menu">
        <span class="glyphicon glyphicon-th-list icon"></span>
        <span>商品分类</span>
    </div>
    <div class="r-menu">
        <a href="#nowhere"><img src="img/chaoshi.png"></a>
        <a href="#nowhere"><img src="img/guoji.png"></a>
        <div class="categories">
            <c:forEach items="${categories}" var="c" varStatus="vs">
                <c:if test="${vs.count>=1 and vs.count<=4}">
                    <a href="#" class="category" data-cid="${c.id}">${c.name}</a>
                </c:if>
            </c:forEach>
        </div>
    </div>
</section>

<section class="carousel">
    <div data-ride="carousel" class="carousel-of-product carousel slide" id="carousel-of-product" >
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li class="active" data-slide-to="0" data-target="#carousel-of-product"></li>
            <li data-slide-to="1" data-target="#carousel-of-product" class=""></li>
            <li data-slide-to="2" data-target="#carousel-of-product" class=""></li>
            <li data-slide-to="3" data-target="#carousel-of-product" class=""></li>
        </ol>
        <!-- Wrapper for slides -->
        <div role="listbox" class="carousel-inner">
            <div class="item active">
                <img src="img/1.jpg" class="carousel carousel-image">
            </div>
            <div class="item">
                <img src="img/2.jpg" class="carousel-image">
            </div>
            <div class="item">
                <img src="img/3.jpg" class="carousel-image">
            </div>
            <div class="item">
                <img src="img/4.jpg" class="carousel-image">
            </div>
        </div>

        <div class="m-menu">
            <ul>
            <c:forEach items="${categories}" var="c" varStatus="vs">
                <c:if test="${vs.count>=1 and vs.count<=13}">
                    <li><span class="glyphicon glyphicon-link"></span><a href="#" class="category" data-cid="${c.id}">${c.name}</a></li>
                </c:if>
            </c:forEach>
            </ul>
        </div>
        <c:forEach items="${categories}" var="c" varStatus="vs">
        <div class="d-menu" data-cid="${c.id}" style="display: none">
            <c:forEach items="${c.products}" var="p" varStatus="vs">
                <a href="product?pid=${p.id}">${p.subTitle}</a>
            </c:forEach>
        </div>
        </c:forEach>
    </div>
</section>

<script>
    $(document).ready(function () {
        // Toggle category dropdown menus
        $(".category").hover(function() {
            var cid = $(this).data("cid");
            $(".d-menu[data-cid='" + cid + "']").show();
        }, function() {
            var cid = $(this).data("cid");
            $(".d-menu[data-cid='" + cid + "']").hide();
        });
    });
</script>

