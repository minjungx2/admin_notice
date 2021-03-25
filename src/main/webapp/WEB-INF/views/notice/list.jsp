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
						<h4 class="card-title">Simple Table</h4>
						<p class="card-category">Here is a subtitle for this table</p>
						
						
					</div>
					<div class="card-body">
						<div class="table-responsive">
						
						<div class="selectPerSheet" >
							<select class="custom-select">
							  <option value="10" ${pageDTO.perSheet == 10? "selected" : ""}>10개씩</option>
							  <option value="20" ${pageDTO.perSheet == 20? "selected" : ""}>20개씩</option>
							  <option value="30" ${pageDTO.perSheet == 30? "selected" : ""}>30개씩</option>
							  </select>
						</div>
							<table class="table">
								<thead class=" text-primary">
									<th>Nno</th>
									<th>Title</th>
									<th>Content</th>
									<th>Writer</th>
									<th>regDate</th>
									<th>updateDate</th>
								</thead>
								<tbody class="tList">
								</tbody>
							</table>
						</div>
						
						<div>
						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.start-1 }" tabindex="-1" aria-disabled="true">Previous</a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker.start}" end="${pageMaker.end }"
								var="num">
								<li class="page-item ${pageDTO.page == num? "active" : ""}  "><a
									class="page-link" href="${num }">${num }</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next }">
								<li class="page-item"><a class="page-link"
									href="${pageMaker.end+1 }">Next</a></li>
							</c:if>
						</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<form action="/notice/list" class="actionForm">
	<input type="hidden" name="page" value="${pageDTO.page }"> <input
		type="hidden" name="perSheet" value="${pageDTO.perSheet }">
</form>

<script src="/resources/service.js"></script>
<script>
 const actionForm = document.querySelector(".actionForm")
 
 const list = service.list(${pageDTO.page},${pageDTO.perSheet});
 
 const ul =  document.querySelector(".tList")

 function moveRead(param){
	 
	 self.location ="/notice/read/"+param
	 
 }
 
 
  list.then(result => {
	 for(const list of result) {
	     ul.innerHTML += "<tr><td>"+ list.nno + "</td><td onclick='moveRead("+list.nno+")'>"+ list.title +"</td><td>"+ list.content +"</td><td>"+ list.writer +"</td><td>"+ list.regdate +"</td><td>"+ list.updatedate +"</td></tr>"
  }})
  
  const pUl = document.querySelector(".pagination")
  
  pUl.addEventListener("click",function(e){
	  
	  e.preventDefault()
	  
	  const target = e.target
	  
	  if(target == pUl){
		  return;
	  }
	  
	  console.log(target)

	  const pageNum = target.getAttribute("href")
	  
	document.querySelector("input[name='page']").value = pageNum
	
	actionForm.submit()

	  
  },false)
  const sPerSheet = document.querySelector(".custom-select")
  
  sPerSheet.addEventListener("change", function(e){
	  
	  const idx = sPerSheet.selectedIndex
		
	 const perSheet = sPerSheet[idx].value
		
	  actionForm.querySelector("input[name='perSheet']").value = perSheet
	  
	  actionForm.submit()
	  
	  
	  
	  
  }, false)
  
  
  
</script>


<%@ include file="../includes/footer.jsp"%>