<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
<title>sample</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
	crossorigin="anonymous" />
<style type="text/css">
div.center {
	text-align: center;
	margin-top: 200px;
}

p.e1 {
	font-size: 5em
}
</style>
</head>
<body>
	<div class="center">
		<p class="e1"><b>${msg} ${name} !</b></p>
		<form:form modelAttribute="inputForm"
			action="${pageContext.request.contextPath}/showName" methd="POST">
			<div class="form-group form-inline">
				<form:input path="name" class="form-control" />
				<button type="submit" class="btn btn-primary">INPUT</button>
			</div>
		</form:form>
	</div>
</body>
</html>
