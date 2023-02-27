<%--
  Created by IntelliJ IDEA.
  User: xen
  Date: 2017/12/5
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>

<c:set var="title" value="订单管理"/>
<%@include file="common/adminHeader.jsp" %>
<c:set var="light" value="3"/>
<%@include file="common/adminNavigator.jsp" %>

<div class="container">
  <ol class="breadcrumb">
    <li>订单管理</li>
  </ol>
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">状态</th>
        <th scope="col">订单金额</th>
        <th scope="col">商品数量</th>
        <th scope="col">买家名称</th>
        <th scope="col">创建时间</th>
        <th scope="col">支付时间</th>
        <th scope="col">发货时间</th>
        <th scope="col">确认收货时间</th>
        <th scope="col" width="120px">操作</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${orders}" var="o" varStatus="vs">
        <tr>
          <th scope="row">${o.id}</th>
          <td>${o.status}</td>
          <td>${o.totalPrice}</td>
          <td>${o.totalNumber}</td>
          <td>${o.user.name}</td>
          <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
          <td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
          <td><fmt:formatDate value="${o.deliverDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
          <td><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
          <td>
            <button class="btn btn-primary btn-xs detail-btn" data-toggle="collapse" data-target="#order-${vs.index}"><i class="fa fa-info-circle"></i></button>
            <c:if test="${o.status == 'waitDelivery'}">
              <a href="order_delivery?oid=${o.id}">
                <button class="btn btn-success btn-xs"><i class="fa fa-truck"></i></button>
              </a>
            </c:if>
          </td>
        </tr>
        <tr class="collapse" id="order-${vs.index}">
  <td colspan="10">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">订单详情</h4>
      </div>
      <div class="panel-body">
        <table class="table table-striped">
          <thead>
            <tr>
              <th>商品图片</th>
              <th>商品名称</th>
              <th>商品数量</th>
              <th>商品单价</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${o.orderItems}" var="item" varStatus="vs">
              <tr>
                <td><img src="/pictures/product/${item.product.firstProductImage.id}.jpg" alt="${item.product.name}" width="40" height="40"></td>
                <td>${item.product.name}</td>
                <td>${item.number}</td>
                <td>￥${item.product.nowPrice}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </td>
</tr>
     </c:forEach>
    </tbody>
  </table>
</div>


<%@include file="common/adminPage.jsp" %>

<%@include file="common/adminFooter.jsp" %>

