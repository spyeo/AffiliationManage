<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.box {
    position:absolute;
    top:0; left:0; bottom:0; right:0;
    height:50%;
    width: 40%;
    margin-left:30%;
    margin-right:30%;
    margin-top:10%;
    background-color:skyblue;
    text-align:center;
    padding-top:5%;
    }
</style>
<script>
</script>
<div>
	<div class="box">
		<form action="/login" method="post">
			<p>
				<input type="text" id="id" name="id" placeholder="아이디">
			</p>
			<p>
				<input type="password" id="password" name="password" placeholder="비밀번호">
			</p>
			<p>
				<input type="submit" value="로그인">
			</p>
		</form>
	</div>
</div>
