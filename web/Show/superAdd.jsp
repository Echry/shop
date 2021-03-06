<%--
  Created by IntelliJ IDEA.
  User: Ederment
  Date: 2020-10-19
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>搜索结果</title>
</head>
<body>

<style>

    a.button2 {
        height: 30px;
        line-height: 30px;
        padding: 0 11px;
        background: #fff;
        border: 1px #26bbdb solid;
        border-radius: 3px;
        display: inline-block;
        text-decoration: none;
        font-size: 15px;
        outline: none;
        color: #4f6b72;
    }

    inpit.button3 {
        height: 30px;
        line-height: 30px;
        padding: 0 11px;
        background: #fff;
        border: 1px #26bbdb solid;
        border-radius: 3px;
        display: inline-block;
        text-decoration: none;
        font-size: 15px;
        outline: none;
        color: #4f6b72;
    }

    a.button {
        height: 21px;
        line-height: 21px;
        padding: 0 11px;
        background: #fff;
        border: 1px #26bbdb solid;
        border-radius: 3px;
        display: inline-block;
        text-decoration: none;
        font-size: 14px;
        outline: none;
        color: #4f6b72;
    }

    table{
        text-align: center;
    }

    body {
        font: normal 11px auto;
        color: #4f6b72;
        background: #E6EAE9;
    }

    a {
        color: #c75f3e;
    }

    #mytable {
        width: 700px;
        padding: 0;
        margin: 0;
    }

    caption {
        padding: 0 0 5px 0;
        width: 700px;
        font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
        text-align: right;
    }

    th {
        font: bold 15px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
        color: #4f6b72;
        border-right: 1px solid #C1DAD7;
        border-bottom: 1px solid #C1DAD7;
        border-top: 1px solid #C1DAD7;
        letter-spacing: 2px;
        text-transform: uppercase;
        text-align: center;
        padding: 6px 6px 6px 12px;
        background: #CAE8EA no-repeat;
    }

    th.nobg {
        border-top: 1px solid #C1DAD7;
        border-left: 1px solid #C1DAD7;
        border-right: 1px solid #C1DAD7;
        background: none;
        padding: 6px 6px 6px 12px;
        border-bottom: 1px solid #C1DAD7;
    }

    td {
        border-right: 1px solid #C1DAD7;
        border-bottom: 1px solid #C1DAD7;
        background: #fff;
        font-size:11px;
        padding: 6px 6px 6px 12px;
        color: #4f6b72;
    }


    td.alt {
        background: #F5FAFA;
        color: #797268;
    }

    th.spec {
        border-left: 1px solid #C1DAD7;
        border-top: 0;
        background: #fff no-repeat;
        font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
    }

    th.specalt {
        border-left: 1px solid #C1DAD7;
        border-top: 0;
        background: #f5fafa no-repeat;
        font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
        color: #797268;
    }

    html>body td{ font-size:15px;}

</style>

<table border=0 cellpadding=0 cellspacing=0 style="width:100% ;height:100%">

    <tr>

        <td style="width:50%;" align="center" valign="middle"  >


            <table id="mytable" cellspacing="0" width="25%" weight="25%" style="width: 20%">


                <tr>
                    <th colspan="2" class="nobg" >商品信息</th>
                </tr>

                <form action="/super" method="get" name="form1">
                    <input hidden name="operate" value="add">
                    <tr>
                        <th style="width: 50%;" scope="col" class="nobg">商品编号</th>
                        <td class="nobg">
                            <input type='text' text name='id' style= "height:28px;width: 100%;text-align: center" placeholder='自动生成' readonly>
                        </td>
                    </tr>

                    <tr>
                        <th scope="col" >商品名称</th>
                        <td class="nobg">
                            <input type='text' text name='name' style= "height:28px;width: 100%;text-align: center" placeholder='商品名称'>
                        </td>
                    </tr>

                    <tr>
                        <th scope="col" >商品价格</th>
                        <td class="nobg">
                            <input type='text' text name='price' style= "height:28px;width: 100%;text-align: center" placeholder='商品价格'>
                        </td>
                    </tr>

                    <tr>
                        <th scope="col" >商品库存</th>
                        <td class="nobg">
                            <input type='text' text name='stock' style= "height:28px;width: 100%;text-align: center" placeholder='商品库存'>
                        </td>
                    </tr>

                    <tr>
                        <th scope="col" >商品类别</th>
                        <td class="nobg">
                            <input type='text' text name='type' style= "height:28px;width: 100%;text-align: center" placeholder='商品类别'>
                        </td>
                    </tr>
                </form>
            </table>
            <br>
            <a href="/super" class="button2" style="width: 60px">返回</a>
            <a href="javascript:void(0)" onclick="form1.submit();" class="button2" style="width: 60px">添加</a>
        </td>
    </tr>
</table>

</body>
</html>