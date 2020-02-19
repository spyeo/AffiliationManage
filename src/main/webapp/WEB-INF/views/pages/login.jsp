<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <div class="container">
      <div class="card card-login mx-auto mt-5">
        <div class="card-header">로그인</div>
        <div class="card-body">
          <form method="post" action="/login">
            <div class="form-group">
              <div class="form-label-group">
                <input type="text" id="mgr_id" name="mgr_id" class="form-control" placeholder="아이디" required="required" autofocus="autofocus">
                <label for="mgr_id">아이디</label>
              </div>
            </div>
            <div class="form-group">
              <div class="form-label-group">
                <input type="password" id="mgr_pw" name="mgr_pw" class="form-control" placeholder="비밀번호" required="required">
                <label for="mgr_pw">비밀번호</label>
              </div>
            </div>
            <div class="form-group">
              <div class="checkbox">
                <label>
                  <input type="checkbox" value="remember-me">
                  Remember Password
                </label>
              </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">로그인</button>
          </form>
          
        </div>
      </div>
    </div>
