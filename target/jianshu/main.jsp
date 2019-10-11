<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Vue.js+axios请求热门小说接口示例</title>
    <!-- Vue.js是一个MVVM框架 -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- axios是一个前端的网络请求工具 -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        .header{
            height: 60px;
            background-image:linear-gradient(to bottom,rgb(100, 150, 300),rgb(116, 220, 238), rgb(100, 150, 300));
            display: flex;

            align-items: center;
            justify-content: space-between;
            padding-left: 10px;
            padding-right: 10px;
        }
        .header ul {
            display: flex;
            align-items: center;
            list-style: none;
        }

        .header ul li {
            flex: 0 0 60px;
        }


        .search-input {
            flex: 0 0 40%;
            height: 35px;
            background-color: #fff;
            border: 1px;
            color: #00FF7F;
            border-radius: 3px;
            margin-left: 150px;
        }

        .search-btn {
            width: 440px;
            height: 40px;
            border:none;    /*取消默认的边框以设置自定义边框*/
            outline:none;   /*取消浏览器默认的蓝光边框以设置自定义的输入框*/
            font-size: 16px;        /*设置提示文字的字体大小*/
            color: rgb(112, 112, 112);   /*设置提示文字颜色*/
            margin-left: 10px;    /*给输入框与左边放大镜图标10px的间距*/

        }
        #search {
            width: 440px;
            height: 40px;
            border:none;    /*取消默认的边框以设置自定义边框*/
            outline:none;   /*取消浏览器默认的蓝光边框以设置自定义的输入框*/
            font-size: 16px;
            border-radius: 2em;
            color: rgb(112, 112, 112);
            margin-left: 10px;

        }
        .searchbar {        /*目的是设置自定义边框，比如圆角与阴影*/
            /* border: rgb(218, 218, 218) solid 1px;
            border-radius: 2em;
            width: 552px;
            height: 42px;
            box-shadow: 0px 0px 5px rgb(212, 212, 212);
            margin: 0 auto; */
        }

        .mcp {
            height: 35px;
        }

        .mg {
            height: 25px;
            margin-left: 15px;
        }
        #search, .mcp, .mg {
            vertical-align: middle;
        }


        .nav{
            flex: 0 0 50%;
            list-style: none;
            display: flex;
        }
        .nav li{
            margin-left: 10px;
            margin-right: 10px;
            width: 50px;
        }
        .container{
            width: 80%;
            margin: 0 auto;
            padding: 5px 5px 5px 5px;
        }
        .card-wrapper{
            display: flex;
            flex-wrap: wrap;
            padding: 5px;
        }
        .card{

            flex: 0 0 24%;
            /* list-style: none; */
            border-radius: 10px;
            border: 1px solid gray;
            margin-left: 10px;
            margin-bottom: 10px;

        }
        .card-head{
            /*height: 300px;*/
            text-align: center;
        }
        .card-head img{
            margin-top: 5px;
            border-radius: 50%;
            width: 50%;
            height: 50%;
        }
        .title{
            font-size: 20px;
            color: rgb(51, 51, 51);
            text-align: center;
        }
        .sub-title{
            margin-top: 5px;
            margin-bottom: 5px;
            color: rgb(179, 153, 153);
            font-size: 10px;
            text-align: center;
        }
        .content{
            width: 90%;
            margin: 0 auto;
            color: #747373;
            font-size:13px;
            font-weight: 400;
            text-align: left;
            height: 35px;
            border-top: 1px solid #eee;
            padding-top: 10px;
            line-height:20px;
        }
        .btn-left{
            width: 100px;
            height: 35px;
            border-radius: 20px;
            border: none;
            outline: none;
            display: block;
            margin: 0 auto;
            /*margin-bottom: 15px;*/
        }

        .green-theme{
            background-color: rgb(66,192,46);
            color: #fff;
        }

        .footer {
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-top: 1px dashed #ddd;
        }

        .footer ul {
            list-style: none;
            display: flex;
            padding: auto 10px auto 10px;
        }

        .footer ul li {
            font-size: 12px;
            color: #aaaaaa;
            margin-right: 10px;
        }
        a, a:link {
            color:rgb(102,107,177);
            text-decoration: none;
        }
    </style>
</head>
<body>
<!-- 顶层div只能有一个id名为app -->
<div id="app" >
    <div class="header">
        <div>
            <!-- 导航 -->
            <ul class="nav">
                <li>
                    <a href="#"><h2>首页</h2></a>
                </li>
                <li>
                    <a href="#"><h2>书吧</h2></a>
                </li>
                <li>
                    <a href="#"><h2>电台</h2></a>
                </li>
                <li>
                    <a href="#"><h2>圈子</h2></a>
                </li>
                <li>
                    <a href="#"><h2>收藏</h2></a>
                </li>
            </ul>


        </div>
<%--        <div class="searchbar">

            <input type="text" id="search" value="Search Google or type a URL"
                   onfocus="if(value=='Search Google or type a URL')value=''" onblur="if(!value)value='Search Google or type a URL'" name="keyword" >
            <img src=search.png class="mcp">
        </div>--%>
        <div class="user-info">
            <a href="#"><h2>登录/注册</h2></a>
        </div>
    </div>
    <div class="container">
        <div class="card-wrapper">
            <div class="card" v-for="(user,index) in users":key="index">
                <div class="card-head">
                    <img :src="user.avatar" class="avatar">
                </div>
                <div class="card-body">
                    <p class="title">{{user.name}}</p>
                    <%--<p class="sub-title">{{user.nickname}}</p>--%>
                    <p class="sub-title">{{user.download}}人下载|{{user.look}}人关注</p>

                    <p><button class="btn-left green-theme">下载</button></p>
                    <p class="content">{{user.description.substring(0,15)}}...</p>
                </div>
            </div>
        </div>
        <div class="footer"><ul>
            <li>@2015-2019</li>
            <li>niit.edu.cn,</li>
            <li>all rights reserved</li>
            <li>南工院计算机学院</li>
        </ul>
            <ul>
                <li>联系我们</li>
                <li>帮助中心</li>
                <li>法律声明</li>
                <li>移动合作</li>
            </ul></div>
    </div>

</div>
<script type="text/javascript">
    var app = new Vue({
        el: '#app',
        data: {
            users:[]
        },
        created: function() {
            var _this = this;
            axios.get('http://271y53e202.qicp.vip:52526/api/users')
                .then(function(response) {

                    // 请求得到的response对象,解析到真正的小说数组
                    _this.users =response.data.data;
                    console.log(_this.users.length);
                })
        }
    })
</script>
</body>
</html>
