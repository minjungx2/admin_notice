<%@ include file="../includes/header.jsp"%>

<div class="content">
	<div class="container-fluid">
		<div class="container-fluid">
			<div class="card card-plain">
				<div class="card-header card-header-primary noticeHeader"></div>
				<div class="row">
					<div class="col-md-12">
						<div class="card-body">
							<div class="noticeContent"></div>
							<div class="col-md-12 d-none d-sm-block d-md-block d-lg-none d-block d-sm-none text-center ml-auto mr-auto">
							</div>
						</div>
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