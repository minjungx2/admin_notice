<%@ include file="includes/header.jsp"%>

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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script src="/resources/service.js"></script>
<script>
 
 const list = service.list();
 
 const ul =  document.querySelector(".tList")

 function moveRead(param){
	 
	 self.location ="/notice/read/"+param
	 
 }
 
 
  list.then(result => {
	 for(const list of result) {
	     ul.innerHTML += "<tr><td>"+ list.nno + "</td><td onclick='moveRead("+list.nno+")'>"+ list.title +"</td><td>"+ list.content +"</td><td>"+ list.writer +"</td><td>"+ list.regdate +"</td><td>"+ list.updatedate +"</td></tr>"
  }})
  
</script>


<%@ include file="includes/footer.jsp"%>