<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

<div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">공지사항 등록</h4>
                </div>
                <div class="card-body">
                  <form>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group bmd-form-group">
                          <label class="bmd-label-floating">제목</label>
                          <input type="text" name="title" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group bmd-form-group">
                          <label class="bmd-label-floating">작성자</label>
                          <input type="text" name="writer" class="form-control">
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group bmd-form-group">
                          <label class="bmd-label-floating">카테고리</label>
                          <input type="text" name="category" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label>내용</label>
                          <div class="form-group bmd-form-group">
                            <textarea class="form-control" name="content" rows="20"></textarea>
                          </div>
                        </div>
                      </div>
                     </div>
                      <div>
                      <input style="height:10vh;" type="file" multiple="multiple" name="files">
                      <button class="uploadBtn">upload</button>
                       <ul class="fileUl">
                       </ul>
                      </div>
                       <div class="btnContainer">
						<button class="btn btn-primary btn-round registerBtn">등록</button>
						<button class="btn btn-primary btn-round listBtn">목록으로</button>
					</div>
                  </form>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card card-profile">
              </div>
            </div>
          </div>
        </div>
      </div>


<div class="modal" id="registerModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">등록 확인</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>등록하시겠습니까?</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary modalRegisterBtn">등록</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal" id="checkModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">등록 확인</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body checkModalBody">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary checkBtn">확인</button>
			</div>
		</div>
	</div>
</div>


<form action="/admin/notice/list" class="actionForm">
	<input type="hidden" name="page" value="${pageDTO.page }"> 
	<input type="hidden" name="perSheet" value="${pageDTO.perSheet }"> 
	<input type="hidden" name="type" value="${pageDTO.type }"> 
	<input type="hidden" name="keyword" value="${pageDTO.keyword }">
</form>


<script src="/admin/resources/service.js"></script>
<script>
	const actionForm = document.querySelector(".actionForm")

	document.querySelector(".registerBtn").addEventListener("click", function(e) {

	e.preventDefault();
		
	 $("#registerModal").modal("show")

	}, false)
	

	document.querySelector(".modalRegisterBtn").addEventListener("click", function(e) {
		
		const title = document.querySelector("input[name='title']").value
		
		const category = document.querySelector("input[name='category']").value
		
		const writer = document.querySelector("input[name='writer']").value
		
		const content = document.querySelector("textarea[name='content']").value
		
		const obj = {title:title, category:category, writer:writer, content:content}
		
		service.register(obj).then(result => document.querySelector(".checkModalBody").innerHTML += "<p>"+result+"<p>");
		
		 $("#registerModal").modal("hide")
		
		$("#checkModal").modal("show")
		
	}, false)
	
	
	
	document.querySelector(".checkBtn").addEventListener("click", function(e){
		
		location.href="/admin/notice/list"
		
	},false)
	
	
	
	const fileUl = document.querySelector(".fileUl")
	
	document.querySelector(".uploadBtn").addEventListener("click", function(e){
		
		e.preventDefault()
		
		const formdata = new FormData()
		
		const files = document.querySelector("input[name='files']").files
		
		for(var i = 0; i < files.length ; i++){
			
			formdata.append("uploadFile", files[i])
			
		}
		
		service.upload(formdata).then(jsonObj => 
		
		 { console.log(jsonObj)
			for(var i = 0 ; i< jsonObj.length; i++){
			
			var file = jsonObj[i];
			
			if(!file.image){
				
					console.log(file.link)			
					fileUl.innerHTML += "<li><a href='/admin/common/notice/download?link="+file.link+"'><i class='fas fa-file'></i></a>"+file.fileName+"<button onclick='delTempImg()'>삭제</button></li>" 
			
			}else{
			fileUl.innerHTML += "<li>"+file.fileName+"<img src='/admin/common/notice/view?link="+file.thumbLink+"'/><button onclick=''>삭제</button></li>"

			}	
		}})
		
	}, false)
	
	document.querySelector(".listBtn").addEventListener("click", function(e){
		
		e.preventDefault();
		
		actionForm.submit();
		
	},false)
	
	function delTempImg(){
		
		e.preventDefault();
	}
	
</script>

<%@ include file="../includes/footer.jsp"%>