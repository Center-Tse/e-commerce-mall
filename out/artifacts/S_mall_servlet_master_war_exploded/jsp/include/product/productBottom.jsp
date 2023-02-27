<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<main class="product-content">
  <div class="product-bar">
    <div class="product-select selected" href="#nowhere" id="button-1">
      <a href="#nowhere">商品详情</a>
    </div>
    <div class="product-select" href="#nowhere" id="button-2">
      <a href="#nowhere">
        累计评价
        <span class="product-comment-number">${product.commentCount}</span>
      </a>
    </div>
  </div>
  <div class="clear" id="main-1">
    <div class="product-top">
      <div class="product-key-title">产品参数：</div>
      <ul class="product-key">
        <c:forEach items="${pvs}" var="map" varStatus="vs">
          <li>${map.key.name}: ${map.value.value}</li>
        </c:forEach>
      </ul>
    </div>
    <div class="product-content-part">
      <c:forEach items="${detailImages}" var="img" varStatus="vs">
        <img src="pictures/product/${img.id}.jpg">
      </c:forEach>
    </div>
  </div>
  <div class="clear" id="main-2" style="display: none;">
    <table class="comment">
      <c:forEach items="${comments}" var="c" varStatus="vs">
        <tr>
          <td class="comment-left">${c.content}
            <span class="date">${c.createDate}</span></td>
          <td class="comment-right">${c.user.name}<span class="annoy">（匿名）</span></td>
        </tr>
      </c:forEach>
    </table>
  </div>
</main>

<script>
  // 获取商品详情和评价的按钮元素
  const button1 = document.querySelector('#button-1');
  const button2 = document.querySelector('#button-2');

  // 获取显示商品详情和评价的元素
  const main1 = document.querySelector('#main-1');
  const main2 = document.querySelector('#main-2');

  // 点击商品详情按钮，显示商品详情部分
  button1.addEventListener('click', () => {
    button1.classList.add('selected');
    button2.classList.remove('selected');
    main1.style.display = 'block';
    main2.style.display = 'none';
  });

  // 点击累计评价按钮，显示评价部分
  button2.addEventListener('click', () => {
    button2.classList.add('selected');
    button1.classList.remove('selected');
    main2.style.display = 'block';
    main1.style.display = 'none';
  });
</script>

