<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>         
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>별을쓰다</title>
       
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/reset.css" />
    <link rel="stylesheet" href="/resources/css/style.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <script src="https://code.iconify.design/2/2.1.0/iconify.min.js"></script>
    <link href="/resources/css/list.css" rel="stylesheet">
</head>
<body>

<%-- <a href="/friend/friendRequestPage?to_user=${login.email}"> --%>

 <div class="inner">
        <nav class="main_box">
            <ul id="gnb" class="clear">
                <li><a href="#">Home</a></li>
                <li><a href="#">My star</a></li>
                <li><a href="#">Other Planet</a></li>
                <li><a href="#">Star Map</a></li>
                <li>
                  <input id="search" type="text" placeholder="검색어를 입력하세요.">
                  <button type="button"  id="img_btn"><img src="/resources/img/search.png"></button>
                </li>
           </ul>
      </nav>
      <nav>
        <ul>
            <li id="join"><a href="#">Join <i class="fas fa-star"></i></a></li>
            <li id="login"><a href="#">Log Out<<<<-<i class="fas fa-star" style="color:red"></i></a></li>
       </ul>
      </nav>
    </div>
    <div class="logo">
      <div class="box"></div>
       <div><img src="/resources/img/logo.png" alt="logo"></div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
    

    </script>
     