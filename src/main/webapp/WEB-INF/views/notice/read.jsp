<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header card-header-primary noticeHeader">
						
						
					</div>
					<div class="contentBox card-body noticeContent">
						
		
					</div>
					<div class="btnContainer">
					<button class="btn btn-primary btn-round">삭제</button>
					</div>	
				</div>
			</div>
		</div>
	</div>
</div>


<script src="/resources/service.js"></script>
<script>
const read = service.read(${nno});

const header = document.querySelector(".noticeHeader")
const content = document.querySelector(".noticeContent")

read.then(result=> {
	console.log(result)
	header.innerHTML += "<h3>"+result.title+"<h3>"
	content.innerHTML += "<h4>"+result.content+"<h4>"
})



</script>

<%@ include file="../includes/footer.jsp"%>