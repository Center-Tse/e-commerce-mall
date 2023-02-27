<%--
  Created by IntelliJ IDEA.
  User: xen
  Date: 2017/12/9
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<main class="register">
    <script>
        $(function () {
            $("#refer").val(document.referrer);
            $("#form").submit(function () {
                if($("#repeatpassword").val()!=$("#password").val()){
                    alert("两次输入的密码不一致");
                    return false;
                }
                if($("#password").val() == "" || $("#name").val() == ""){
                    alert("用户名或密码为空");
                    return false;
                }
                return true;
            });
        });
    </script>
<style>
    body {
        background-color: #f8f9fa;
    }

    .register {
        padding: 50px 0;
    }

    .card-header {
        font-weight: bold;
        font-size: 20px;
    }

    .card {
        box-shadow: 0 0 2px 2px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        font-size: 16px;
    }

    input[type="text"], input[type="password"] {
        border-radius: 4px;
        border: 1px solid #ced4da;
        padding: 10px;
        width: 100%;
    }

    .btn-primary {
        background-color: #dc3545;
        border-color: #dc3545;
        width: 100%;
    }

    .btn-primary:hover {
        background-color: #c82333;
        border-color: #c82333;
    }
</style>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-header bg-primary text-white">注册新用户</div>
                    <div class="card-body">
                        <form action="registerAdd" method="post" id="form">
                            <input type="hidden" name="refer" id="refer">
                            <div class="form-group">
                                <label for="name">用户名</label>
                                <input type="text" class="form-control" placeholder="会员登陆名" name="name" id="name">
                            </div>
                            <div class="form-group">
                                <label for="password">密码</label>
                                <input type="password" class="form-control" placeholder="登陆密码" name="password" id="password">
                            </div>
                            <div class="form-group">
                                <label for="repeatpassword">确认密码</label>
                                <input type="password" class="form-control" placeholder="再次输入密码" id="repeatpassword">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">提交</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
