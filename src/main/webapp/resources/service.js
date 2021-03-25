var service = (function() {
  
   function list(page,perSheet){
   
		return fetch("/notice/"+page+"/"+perSheet,{
                method : 'get'
        }).then(res => res.json())
	}
	
	function read(nno){
	
		console.log(nno)
	
		return fetch("/notice/"+nno,{
                method : 'get'
        }).then(res => res.json())
	
	}
	
	

        return {list:list, read:read}

    }())