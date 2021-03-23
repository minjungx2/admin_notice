<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>list page</h1>
	<h2>${list }</h2>
	
	<ul>
	</ul>
	
 <script src="/resources/service.js"></script>
 
 <script>
 
 const list = service.list();
 
 const ul =  document.querySelector("ul")

 console.log(list)
 
  list.then(result => {
	    for (const list of result) {
	        console.log(list)
	        ul.innerHTML += "<li>"+list.context+"</li>" 
 }})
 </script>
</body>
</html>