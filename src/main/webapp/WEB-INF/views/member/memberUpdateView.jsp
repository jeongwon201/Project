<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<%@ include file="/resources/include/head.jsp" %>
		<title>회원정보수정</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				
				$.ajax({
					url : "/member/memberUpdate",
					type : "POST",
					dateType : "json",
					data : $("#updateForm").serialize(),
					success: function(result){
						if(result == 1) {
							alert('회원 정보 수정이 완료되었습니다, 다시 로그인해주세요.');
							location.href = "/";
						}
					}
				})
			});
			
			$("#submit-pw").on("click", function(){
				if($("#userPwCur").val()==""){
					alert("현재 비밀번호를 입력해주세요.");
					$("#userPw-cur").focus();
					return false;
				}

				if($("#userPw").val()==""){
					alert("새 비밀번호를 입력해주세요.");
					$("#userPw").focus();
					return false;
				}

				if($("#userPw-confirm").val()==""){
					alert("비밀번호 확인을 입력해주세요.");
					$("#userPw-confirm").focus();
					return false;
				}

				if($("#userPw").val() != $("#userPw-confirm").val()) {
					alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
					$("#userPw-confirm").focus();
					return false;
				}

				$.ajax({
					url : "/member/memberUpdatePw",
					type : "POST",
					dateType : "json",
					data : $("#updateForm-pw").serialize(),
					success: function(result){
						if(result == 1) {
							alert('비밀번호 수정이 완료되었습니다, 다시 로그인해주세요.');
							location.href = "/";
						}
					},
					error: function (result) {
						if(result == 0) {
							alert("입력된 비밀번호가 현재 비밀번호와 일치하지 않습니다.");
							$("#userPwCur").focus();
						} else {
							alert("서버에 오류가 있습니다. 관리자에게 연락해주세요.");
						}
					}
				})
			});
			
			$("#memberDeleteBtn").on("click", function() {
				location.href = "memberDeleteView";
			})
		})
	</script>
	<body>
		<%@include file="../header.jsp" %>
		<section id="container" class="container">
			<div class="row">
				<div class="col-md-6">
					<h3>내 정보 수정</h3>
					<form id="updateForm" action="/member/memberUpdate" method="post">
						<div class="form-group has-feedback">
							<label class="control-label" for="userId">아이디</label>
							<input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="userName">성명</label>
							<input class="form-control" type="text" id="userName" name="userName" value="${member.userName}"/>
						</div>
					</form>
					<button class="btn btn-success" type="button" id="submit">수정하기</button>
					<button id="memberDeleteBtn" class="btn btn-warning" type="button">회원탈퇴</button>
				</div>
				<div class="col-md-6">
					<h3>비밀 번호 수정</h3>	
					<form id="updateForm-pw" action="/member/memberUpdatePw" method="post">
						<div class="form-group has-feedback">
							<label class="control-label" for="userPwCur">현재 비밀번호</label>
							<input class="form-control" type="password" id="userPwCur" name="userPwCur" />
						</div>
						
						<div class="form-group has-feedback">
							<label class="control-label" for="userPw">새 비밀번호</label>
							<input class="form-control" type="password" id="userPw" name="userPw"/>
						</div>
						
						<div class="form-group has-feedback">
							<label class="control-label" for="userPw-confirm">비밀번호 확인</label>
							<input class="form-control" type="password" id="userPw-confirm" name="userPw-confirm"/>
						</div>
					</form>
					<button class="btn btn-success" type="button" id="submit-pw">수정하기</button>
				</div>
			</div>
		</section>
		
		<hr />
		<%@ include file="../footer.jsp" %>
	</body>
	
</html>